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

#include "src/tint/lang/core/ir/exit_loop.h"
#include "src/tint/lang/core/ir/function.h"
#include "src/tint/lang/core/ir/loop.h"
#include "src/tint/lang/core/ir/multi_in_block.h"
#include "src/tint/lang/core/ir/traverse.h"
#include "src/tint/lang/core/ir/var.h"
#include "src/tint/utils/ice/ice.h"

namespace tint::core::ir::analysis {

std::ostream& operator<<(std::ostream& os, const LoopInfo& li) {
    StringStream ss;
    ss << li;
    return os << ss.str();
}

StringStream& operator<<(StringStream& ss, const LoopInfo& li) {
    ss << "LoopInfo( indexVar " << li.indexVar << ", indexStrictUpperBound "
       << li.indexStrictUpperBound << ")";
    return ss;
}

struct LoopAnalysisImpl {
    LoopAnalysisImpl(ir::Function& func) {
        Traverse(func.Block(), [&](Loop* l) { AnalyzeLoop(*l); });
    }
    void AnalyzeLoop(ir::Loop& loop);

    const LoopInfo* GetInfo(const ir::Loop&) const;
};

namespace {

bool IsSimpleLoopExit(ir::Block* b) {
    return (b->Front() == b->Back()) && b->Front()->Is<ExitLoop>();
}
}  // anonymous namespace

void LoopAnalysisImpl::AnalyzeLoop(ir::Loop& loop) {
    Vector<Var*, 8> candidate_vars;
    if (auto* init_block = loop.Initializer()) {
        Traverse(init_block, [&](Var* var) {
            auto* ty = var->Results()[0]->Type();
            if (!ty->IsIntegerScalar()) {
                return;
            }
            //  don't care about initial value, as long as there as is progress.
            candidate_vars.Push(var);
        });
    }
    if (candidate_vars.IsEmpty()) {
        return;
    }
    // traverse the body
    for (auto* i : *loop.Body()) {
        i = i;
    }
}

const LoopInfo* LoopAnalysisImpl::GetInfo(const ir::Loop&) const {
    return nullptr;
}

LoopAnalysis::LoopAnalysis(ir::Function& func) : impl_(new LoopAnalysisImpl(func)) {}
LoopAnalysis::~LoopAnalysis() = default;

const LoopInfo* LoopAnalysis::GetInfo(const ir::Loop& loop) const {
    return impl_->GetInfo(loop);
}

}  // namespace tint::core::ir::analysis
