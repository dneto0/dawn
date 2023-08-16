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

tint_add_target("lang/wgsl/sem"
  lang/wgsl/sem/accessor_expression.cc
  lang/wgsl/sem/accessor_expression.h
  lang/wgsl/sem/array_count.cc
  lang/wgsl/sem/array_count.h
  lang/wgsl/sem/behavior.cc
  lang/wgsl/sem/behavior.h
  lang/wgsl/sem/block_statement.cc
  lang/wgsl/sem/block_statement.h
  lang/wgsl/sem/break_if_statement.cc
  lang/wgsl/sem/break_if_statement.h
  lang/wgsl/sem/builtin.cc
  lang/wgsl/sem/builtin.h
  lang/wgsl/sem/builtin_enum_expression.cc
  lang/wgsl/sem/builtin_enum_expression.h
  lang/wgsl/sem/call.cc
  lang/wgsl/sem/call.h
  lang/wgsl/sem/call_target.cc
  lang/wgsl/sem/call_target.h
  lang/wgsl/sem/expression.cc
  lang/wgsl/sem/expression.h
  lang/wgsl/sem/for_loop_statement.cc
  lang/wgsl/sem/for_loop_statement.h
  lang/wgsl/sem/function.cc
  lang/wgsl/sem/function.h
  lang/wgsl/sem/function_expression.cc
  lang/wgsl/sem/function_expression.h
  lang/wgsl/sem/if_statement.cc
  lang/wgsl/sem/if_statement.h
  lang/wgsl/sem/index_accessor_expression.cc
  lang/wgsl/sem/index_accessor_expression.h
  lang/wgsl/sem/info.cc
  lang/wgsl/sem/info.h
  lang/wgsl/sem/load.cc
  lang/wgsl/sem/load.h
  lang/wgsl/sem/loop_statement.cc
  lang/wgsl/sem/loop_statement.h
  lang/wgsl/sem/materialize.cc
  lang/wgsl/sem/materialize.h
  lang/wgsl/sem/member_accessor_expression.cc
  lang/wgsl/sem/member_accessor_expression.h
  lang/wgsl/sem/module.cc
  lang/wgsl/sem/module.h
  lang/wgsl/sem/node.cc
  lang/wgsl/sem/node.h
  lang/wgsl/sem/pipeline_stage_set.h
  lang/wgsl/sem/sampler_texture_pair.h
  lang/wgsl/sem/statement.cc
  lang/wgsl/sem/statement.h
  lang/wgsl/sem/struct.cc
  lang/wgsl/sem/struct.h
  lang/wgsl/sem/switch_statement.cc
  lang/wgsl/sem/switch_statement.h
  lang/wgsl/sem/type_expression.cc
  lang/wgsl/sem/type_expression.h
  lang/wgsl/sem/type_mappings.h
  lang/wgsl/sem/value_constructor.cc
  lang/wgsl/sem/value_constructor.h
  lang/wgsl/sem/value_conversion.cc
  lang/wgsl/sem/value_conversion.h
  lang/wgsl/sem/value_expression.cc
  lang/wgsl/sem/value_expression.h
  lang/wgsl/sem/variable.cc
  lang/wgsl/sem/variable.h
  lang/wgsl/sem/while_statement.cc
  lang/wgsl/sem/while_statement.h
)

tint_target_add_dependencies("lang/wgsl/sem"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
  "utils/containers"
  "utils/diagnostic"
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

tint_add_target("lang/wgsl/sem:test"
  lang/wgsl/sem/builtin_test.cc
  lang/wgsl/sem/diagnostic_severity_test.cc
  lang/wgsl/sem/helper_test.h
  lang/wgsl/sem/struct_test.cc
  lang/wgsl/sem/value_expression_test.cc
)

tint_target_add_dependencies("lang/wgsl/sem:test"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
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
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)
