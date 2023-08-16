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

tint_add_target("cmd/tint:cmd"
  cmd/tint/main.cc
)

tint_target_add_dependencies("cmd/tint:cmd"
  "api"
  "cmd/common"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/hlsl/writer/common"
  "lang/spirv/reader/common"
  "lang/wgsl/ast"
  "lang/wgsl/ast/transform"
  "lang/wgsl/helpers"
  "lang/wgsl/inspector"
  "lang/wgsl/program"
  "lang/wgsl/reader"
  "lang/wgsl/sem"
  "lang/wgsl/writer"
  "utils/cli"
  "utils/command"
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
  "utils/strconv"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

if (TINT_BUILD_GLSL_WRITER)
  tint_target_add_dependencies("cmd/tint:cmd"
    "lang/glsl/writer"
    "lang/glsl/writer/common"
  )
  tint_target_add_external_dependencies("cmd/tint:cmd"
    "glslang"
    "glslang-res-limits"
  )
endif(TINT_BUILD_GLSL_WRITER)

if (TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies("cmd/tint:cmd"
    "lang/hlsl/validate"
    "lang/hlsl/writer"
  )
endif(TINT_BUILD_HLSL_WRITER)

if (TINT_BUILD_IR)
  tint_target_add_dependencies("cmd/tint:cmd"
    "lang/core/ir"
    "lang/wgsl/reader/program_to_ir"
  )
endif(TINT_BUILD_IR)

if (TINT_BUILD_MSL_WRITER)
  tint_target_add_dependencies("cmd/tint:cmd"
    "lang/msl/validate"
    "lang/msl/writer"
    "lang/msl/writer/common"
  )
endif(TINT_BUILD_MSL_WRITER)

if (TINT_BUILD_SPV_READER)
  tint_target_add_dependencies("cmd/tint:cmd"
    "lang/spirv/reader"
  )
endif(TINT_BUILD_SPV_READER)

if (TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)
  tint_target_add_external_dependencies("cmd/tint:cmd"
    "spirv-tools"
  )
endif(TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies("cmd/tint:cmd"
    "lang/spirv/writer"
    "lang/spirv/writer/common"
  )
endif(TINT_BUILD_SPV_WRITER)
