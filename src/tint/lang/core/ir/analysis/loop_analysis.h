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

#ifndef SRC_TINT_LANG_CORE_IR_ANALYSIS_LOOP_ANALYSIS_H_
#define SRC_TINT_LANG_CORE_IR_ANALYSIS_LOOP_ANALYSIS_H_

#include <memory>
#include <optional>
#include "src/tint/lang/core/ir/instruction.h"

namespace tint::core::ir::analysis {

using Id = Instruction::Id;

struct LoopInfo {
  // ID of the deduced variable used as the loop index.
  const Id indexVar = 0;
  // One more than the highest value of the loop index, if it could be inferred.
  // Otherwise it is 0.
  const Id indexStrictUpperBound = 0;
  bool IsFinite() const { return indexStrictUpperBound > 0; }
}

struct LoopAnalysisImpl;

class LoopAnalysis {
  public:
    using Result = std::unordered_map<Id, LoopInfo*>

    /// Constructor
    /// @param f the function being analyzed
    LoopAnalysis(const ir::Function& func);
    ~LoopAnalysis();
    LoopAnalysis(const LoopAnalysis&) = delete;
    LoopAnalysis(LoopAnalysis&&) = delete;

    /// Returns the info for a given loop, if it is a loop.
    /// Otherwise is not analyzable, and has no value.
    /// @param id the ID of the loop
    std::optional<const LoopInfo> GetInfo(Id id) const;

  private:
    std::unique_ptr<LoopAnalysisImpl> impl_;
};

}  // namespace tint::core::ir::analysis

#endif  // SRC_TINT_LANG_CORE_IR_ANALYSIS_LOOP_ANALYSIS_H_
