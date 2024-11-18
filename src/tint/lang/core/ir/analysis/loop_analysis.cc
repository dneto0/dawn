// Copyright 2024 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include "src/tint/lang/core/ir/analysis/loop_analysis.h"
#include <iostream>

#include "src/tint/lang/core/binary_op.h"
#include "src/tint/lang/core/ir/binary.h"
#include "src/tint/lang/core/ir/bitcast.h"
#include "src/tint/lang/core/ir/exit_loop.h"
#include "src/tint/lang/core/ir/if.h"
#include "src/tint/lang/core/ir/function.h"
#include "src/tint/lang/core/ir/load.h"
#include "src/tint/lang/core/ir/loop.h"
#include "src/tint/lang/core/ir/multi_in_block.h"
#include "src/tint/lang/core/ir/store.h"
#include "src/tint/lang/core/ir/traverse.h"
#include "src/tint/lang/core/ir/value.h"
#include "src/tint/lang/core/ir/var.h"
#include "src/tint/lang/core/type/i32.h"
#include "src/tint/lang/core/type/pointer.h"
#include "src/tint/lang/core/type/type.h"
#include "src/tint/lang/core/type/u32.h"
#include "src/tint/utils/ice/ice.h"
#include "src/tint/utils/rtti/switch.h"

namespace tint::core::ir::analysis {

std::ostream& operator<<(std::ostream& os, const LoopInfo& li) {
    StringStream ss;
    ss << li;
    return os << ss.str();
}

StringStream& operator<<(StringStream& ss, const LoopInfo& li) {
    ss << "LoopInfo( var " << li.indexVar << ")";
    return ss;
}

struct LoopAnalysisImpl {
    LoopAnalysisImpl(ir::Function& func) {
        Traverse(func.Block(), [&](Loop* l) { AnalyzeLoop(*l); });
    }
    void AnalyzeLoop(ir::Loop& loop);

    const LoopInfo* GetInfo(ir::Loop& loop) const {
      return loop_info_map_.Get(&loop).value;
    }
    private:
      Hashmap<ir::Loop*, LoopInfo,8> loop_info_map_;
};

namespace {

// Returns the value found after following backward through
// any number of bitcasts.
ir::Value* UnwrapBitcasts(Value* v) {
    do {
        if (auto* ir = v->As<ir::InstructionResult>()) {
            if (auto* bc = ir->Instruction()->As<ir::Bitcast>()) {
                v = bc->Val();
                continue;
            }
        }
    } while (false);
    return v;
}

// Returns true if v is the constant 1.
bool IsOne(Value* v) {
    if (auto* cv = v->As<ir::Constant>()) {
        return Switch(
            cv->Type(),
            [&](const core::type::I32* t) { return cv->Value()->ValueAs<int32_t>() == 1; },
            [&](const core::type::U32* t) { return cv->Value()->ValueAs<uint32_t>() == 1; },
            [&](const Default) -> bool { return false; });
    }
    return false;
}

}  // anonymous namespace

void LoopAnalysisImpl::AnalyzeLoop(ir::Loop& loop) {
    std::cerr << "loop " << std::endl;
    Vector<Var*, 8> candidate_vars;
    if (auto* init_block = loop.Initializer()) {
        std::cerr << "init_block " << std::endl;
        Traverse(init_block, [&](Var* var) {
            const auto* pty = var->Result(0)->Type()->As<core::type::Pointer>();
            std::cerr << "inst " << std::endl;
            if (!pty->StoreType()->IsIntegerScalar()) {
                return;
            }
            //  don't care about initial value, as long as there as is progress.
            std::cerr << "candidate var " << std::endl;
            candidate_vars.Push(var);
        });
    }
    if (candidate_vars.IsEmpty()) {
        return;
    }

    for (Var* cv : candidate_vars) {
        // Loads of the candidate variable.
        Hashset<Value*, 16> load_values;
        ir::Store* single_store = nullptr;
        bool keep_going = true;
        auto skip = [&] {
            keep_going = false;
            single_store = nullptr;
        };
        auto is_increment_of_load = [&](ir::Value* val) {
            return Switch(
                UnwrapBitcasts(val),
                [&](core::ir::InstructionResult* ir) {
                    if (auto* binary = ir->Instruction()->As<ir::Binary>()) {
                        if (binary->Op() == BinaryOp::kAdd) {
                            auto is_add_one = [&](Value* a, Value* b) {
                                return load_values.Contains(a) && IsOne(b);
                            };
                            auto* lhs = UnwrapBitcasts(binary->LHS());
                            auto* rhs = UnwrapBitcasts(binary->RHS());
                            return is_add_one(lhs, rhs) || is_add_one(rhs, lhs);
                        }
                    }
                    return false;
                },
                [&](Default) { return false; });
        };

        cv->Result(0)->ForEachUseSorted([&](Usage u) {
            if (keep_going) {
                Switch(
                    u.instruction, [&](Load* l) { load_values.Add(l->Result(0)); },
                    [&](Store* s) {
                        if (s->Block() != loop.Continuing()) {
                            skip();
                            return;
                        }
                        if (single_store) {
                            // more than one store. Skip it.
                            skip();
                            return;
                        }
                        single_store = s;
                    },
                    [&](Binary* b) {},
                    [&](Default) {
                        skip();
                        return;
                    });
            }
        });
        if (single_store) {
            std::cerr << "single store" << std::endl;
            if (!is_increment_of_load(single_store->From())) {
              continue;
            }
        }
        // We've proven the variable increments exactly once per iteration.
        // single_store is the only modification of the candidate index
        // variable, it increments the candidate index variable, and it
        // occurs directly in the continuing block. So if the loop reaches
        // the next iteration, then we know the index variable progresses
        // to the next value.
        std::cerr << "  increment of k" << std::endl;
  
        // Check if the body exits the loop based on the index variable.
        auto is_loop_exiting_if = [&](ir::If *i) {
          // Returns true if cond is like  %k < constant
          auto is_exiting_condition = [&](Value* cond) {
            return Switch(cond,
              [&](ir::InstructionResult* ir) {
                if (auto* binary = ir->Instruction()->As<ir::Binary>()) {
                  if (binary->Op() == BinaryOp::kLessThan) {
                auto exiting_comparison = [&](Value* a, Value* b) {
                  return load_values.Contains(a) && b->Is<ir::Constant>();
                };
                auto* lhs = UnwrapBitcasts(binary->LHS());
                auto* rhs = UnwrapBitcasts(binary->RHS());
                return exiting_comparison(lhs, rhs) || exiting_comparison(rhs, lhs);
                  }
                }
                return false;
              },
              [&](Default) { return false; });
         };
         if (!is_exiting_condition(i->Condition())) {
           return false;
      }
      
          auto is_simple_loop_exit = [&](ir::Block* b) {
            return b && (b->Front() == b->Back()) && b->Front()->Is<ExitLoop>();
          };
          return 
            is_simple_loop_exit(i->True()) ||
            is_simple_loop_exit(i->False());
        };

        bool keep_going_inst = true;
        for (auto* inst: *loop.Body()) {
          Switch(inst,
            [&](ir::Load *load) { },
            [&](ir::Binary *binary) { },
            [&](ir::If* i) {
              if (is_loop_exiting_if(i)) {
                // The loop is finite!
                loop_info_map_.Add(&loop, LoopInfo{cv});
                return;
              }
              // Only look at one 'if'.
              keep_going_inst = false;
            },
            [&](Default) { keep_going_inst = false; });
          if (!keep_going_inst) break;
        }
    }
}

LoopAnalysis::LoopAnalysis(ir::Function& func) : impl_(new LoopAnalysisImpl(func)) {}
LoopAnalysis::~LoopAnalysis() = default;

const LoopInfo* LoopAnalysis::GetInfo(ir::Loop& loop) const {
    return impl_->GetInfo(loop);
}

}  // namespace tint::core::ir::analysis
