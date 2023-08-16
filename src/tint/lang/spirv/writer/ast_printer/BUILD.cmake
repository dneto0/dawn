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

if(TINT_BUILD_SPV_WRITER)
tint_add_target("lang/spirv/writer/ast_printer"
  lang/spirv/writer/ast_printer/ast_printer.cc
  lang/spirv/writer/ast_printer/ast_printer.h
  lang/spirv/writer/ast_printer/builder.cc
  lang/spirv/writer/ast_printer/builder.h
  lang/spirv/writer/ast_printer/scalar_constant.h
)

tint_target_add_dependencies("lang/spirv/writer/ast_printer"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
  "lang/wgsl/ast/transform"
  "lang/wgsl/helpers"
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

if (TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)
  tint_target_add_external_dependencies("lang/spirv/writer/ast_printer"
    "spirv-headers"
  )
endif(TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies("lang/spirv/writer/ast_printer"
    "lang/spirv/writer/common"
  )
endif(TINT_BUILD_SPV_WRITER)

endif(TINT_BUILD_SPV_WRITER)
if(TINT_BUILD_SPV_WRITER)
tint_add_target("lang/spirv/writer/ast_printer:test"
  lang/spirv/writer/ast_printer/accessor_expression_test.cc
  lang/spirv/writer/ast_printer/assign_test.cc
  lang/spirv/writer/ast_printer/ast_builtin_test.cc
  lang/spirv/writer/ast_printer/ast_discard_test.cc
  lang/spirv/writer/ast_printer/ast_function_test.cc
  lang/spirv/writer/ast_printer/ast_if_test.cc
  lang/spirv/writer/ast_printer/ast_loop_test.cc
  lang/spirv/writer/ast_printer/ast_printer_test.cc
  lang/spirv/writer/ast_printer/ast_switch_test.cc
  lang/spirv/writer/ast_printer/ast_type_test.cc
  lang/spirv/writer/ast_printer/binary_expression_test.cc
  lang/spirv/writer/ast_printer/bitcast_expression_test.cc
  lang/spirv/writer/ast_printer/block_test.cc
  lang/spirv/writer/ast_printer/builtin_texture_test.cc
  lang/spirv/writer/ast_printer/call_test.cc
  lang/spirv/writer/ast_printer/const_assert_test.cc
  lang/spirv/writer/ast_printer/constructor_expression_test.cc
  lang/spirv/writer/ast_printer/entry_point_test.cc
  lang/spirv/writer/ast_printer/format_conversion_test.cc
  lang/spirv/writer/ast_printer/function_attribute_test.cc
  lang/spirv/writer/ast_printer/function_variable_test.cc
  lang/spirv/writer/ast_printer/global_variable_test.cc
  lang/spirv/writer/ast_printer/helper_test.h
  lang/spirv/writer/ast_printer/ident_expression_test.cc
  lang/spirv/writer/ast_printer/literal_test.cc
  lang/spirv/writer/ast_printer/return_test.cc
  lang/spirv/writer/ast_printer/scalar_constant_test.cc
  lang/spirv/writer/ast_printer/unary_op_expression_test.cc
)

tint_target_add_dependencies("lang/spirv/writer/ast_printer:test"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
  "lang/wgsl/ast:test"
  "lang/wgsl/program"
  "lang/wgsl/resolver"
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

if (TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)
  tint_target_add_external_dependencies("lang/spirv/writer/ast_printer:test"
    "spirv-headers"
    "spirv-tools"
  )
endif(TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies("lang/spirv/writer/ast_printer:test"
    "lang/spirv/writer"
    "lang/spirv/writer/ast_printer"
    "lang/spirv/writer/common"
    "lang/spirv/writer/common:test"
  )
endif(TINT_BUILD_SPV_WRITER)

endif(TINT_BUILD_SPV_WRITER)