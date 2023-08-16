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

tint_add_target("lang/wgsl/writer/ast_printer"
  lang/wgsl/writer/ast_printer/ast_printer.cc
  lang/wgsl/writer/ast_printer/ast_printer.h
)

tint_target_add_dependencies("lang/wgsl/writer/ast_printer"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
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
  "utils/result"
  "utils/rtti"
  "utils/strconv"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

tint_add_target("lang/wgsl/writer/ast_printer:test"
  lang/wgsl/writer/ast_printer/alias_type_test.cc
  lang/wgsl/writer/ast_printer/array_accessor_test.cc
  lang/wgsl/writer/ast_printer/assign_test.cc
  lang/wgsl/writer/ast_printer/ast_printer_test.cc
  lang/wgsl/writer/ast_printer/binary_test.cc
  lang/wgsl/writer/ast_printer/bitcast_test.cc
  lang/wgsl/writer/ast_printer/block_test.cc
  lang/wgsl/writer/ast_printer/break_test.cc
  lang/wgsl/writer/ast_printer/call_test.cc
  lang/wgsl/writer/ast_printer/case_test.cc
  lang/wgsl/writer/ast_printer/cast_test.cc
  lang/wgsl/writer/ast_printer/const_assert_test.cc
  lang/wgsl/writer/ast_printer/constructor_test.cc
  lang/wgsl/writer/ast_printer/continue_test.cc
  lang/wgsl/writer/ast_printer/diagnostic_test.cc
  lang/wgsl/writer/ast_printer/discard_test.cc
  lang/wgsl/writer/ast_printer/enable_test.cc
  lang/wgsl/writer/ast_printer/function_test.cc
  lang/wgsl/writer/ast_printer/global_decl_test.cc
  lang/wgsl/writer/ast_printer/helper_test.h
  lang/wgsl/writer/ast_printer/identifier_test.cc
  lang/wgsl/writer/ast_printer/if_test.cc
  lang/wgsl/writer/ast_printer/literal_test.cc
  lang/wgsl/writer/ast_printer/loop_test.cc
  lang/wgsl/writer/ast_printer/member_accessor_test.cc
  lang/wgsl/writer/ast_printer/return_test.cc
  lang/wgsl/writer/ast_printer/switch_test.cc
  lang/wgsl/writer/ast_printer/type_test.cc
  lang/wgsl/writer/ast_printer/unary_op_test.cc
  lang/wgsl/writer/ast_printer/variable_decl_statement_test.cc
  lang/wgsl/writer/ast_printer/variable_test.cc
)

tint_target_add_dependencies("lang/wgsl/writer/ast_printer:test"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
  "lang/wgsl/program"
  "lang/wgsl/resolver"
  "lang/wgsl/sem"
  "lang/wgsl/writer/ast_printer"
  "utils/containers"
  "utils/diagnostic"
  "utils/generator"
  "utils/ice"
  "utils/id"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)
