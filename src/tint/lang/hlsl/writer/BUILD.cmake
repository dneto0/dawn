# Copyright 2023 The Tint Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################################################
# File generated by tools/src/cmd/gen
# using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# Do not modify this file directly
################################################################################

include(lang/hlsl/writer/ast_printer/BUILD.cmake)
include(lang/hlsl/writer/common/BUILD.cmake)

if(TINT_BUILD_HLSL_WRITER)
tint_add_target("lang/hlsl/writer"
  lang/hlsl/writer/output.cc
  lang/hlsl/writer/output.h
  lang/hlsl/writer/writer.cc
  lang/hlsl/writer/writer.h
)

tint_target_add_dependencies("lang/hlsl/writer"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/hlsl/writer/common"
  "lang/wgsl/ast"
  "lang/wgsl/ast/transform"
  "lang/wgsl/program"
  "lang/wgsl/sem"
  "utils/containers"
  "utils/diagnostic"
  "utils/generator"
  "utils/ice"
  "utils/id"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/reflection"
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

if (TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies("lang/hlsl/writer"
    "lang/hlsl/writer/ast_printer"
  )
endif(TINT_BUILD_HLSL_WRITER)

endif(TINT_BUILD_HLSL_WRITER)
if(TINT_BUILD_HLSL_WRITER)
tint_add_target("lang/hlsl/writer:bench"
  lang/hlsl/writer/writer_bench.cc
)

tint_target_add_dependencies("lang/hlsl/writer:bench"
  "cmd/bench"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/hlsl/writer/common"
  "lang/wgsl/ast"
  "lang/wgsl/program"
  "lang/wgsl/sem"
  "utils/containers"
  "utils/diagnostic"
  "utils/ice"
  "utils/id"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/reflection"
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

if (TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies("lang/hlsl/writer:bench"
    "lang/hlsl/writer"
  )
endif(TINT_BUILD_HLSL_WRITER)

endif(TINT_BUILD_HLSL_WRITER)