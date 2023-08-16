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

tint_add_target("lang/wgsl/resolver"
  lang/wgsl/resolver/dependency_graph.cc
  lang/wgsl/resolver/dependency_graph.h
  lang/wgsl/resolver/resolve.cc
  lang/wgsl/resolver/resolve.h
  lang/wgsl/resolver/resolver.cc
  lang/wgsl/resolver/resolver.h
  lang/wgsl/resolver/sem_helper.cc
  lang/wgsl/resolver/sem_helper.h
  lang/wgsl/resolver/uniformity.cc
  lang/wgsl/resolver/uniformity.h
  lang/wgsl/resolver/validator.cc
  lang/wgsl/resolver/validator.h
)

tint_target_add_dependencies("lang/wgsl/resolver"
  "lang/core"
  "lang/core/constant"
  "lang/core/intrinsic"
  "lang/core/intrinsic/data"
  "lang/core/type"
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
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

tint_add_target("lang/wgsl/resolver:test"
  lang/wgsl/resolver/address_space_layout_validation_test.cc
  lang/wgsl/resolver/address_space_validation_test.cc
  lang/wgsl/resolver/alias_analysis_test.cc
  lang/wgsl/resolver/array_accessor_test.cc
  lang/wgsl/resolver/assignment_validation_test.cc
  lang/wgsl/resolver/atomics_test.cc
  lang/wgsl/resolver/atomics_validation_test.cc
  lang/wgsl/resolver/attribute_validation_test.cc
  lang/wgsl/resolver/bitcast_validation_test.cc
  lang/wgsl/resolver/builtin_enum_test.cc
  lang/wgsl/resolver/builtin_structs_test.cc
  lang/wgsl/resolver/builtin_test.cc
  lang/wgsl/resolver/builtin_validation_test.cc
  lang/wgsl/resolver/builtins_validation_test.cc
  lang/wgsl/resolver/call_test.cc
  lang/wgsl/resolver/call_validation_test.cc
  lang/wgsl/resolver/compound_assignment_validation_test.cc
  lang/wgsl/resolver/compound_statement_test.cc
  lang/wgsl/resolver/const_assert_test.cc
  lang/wgsl/resolver/control_block_validation_test.cc
  lang/wgsl/resolver/dependency_graph_test.cc
  lang/wgsl/resolver/diagnostic_control_test.cc
  lang/wgsl/resolver/dual_source_blending_extension_test.cc
  lang/wgsl/resolver/entry_point_validation_test.cc
  lang/wgsl/resolver/evaluation_stage_test.cc
  lang/wgsl/resolver/expression_kind_test.cc
  lang/wgsl/resolver/f16_extension_test.cc
  lang/wgsl/resolver/function_validation_test.cc
  lang/wgsl/resolver/host_shareable_validation_test.cc
  lang/wgsl/resolver/increment_decrement_validation_test.cc
  lang/wgsl/resolver/inferred_type_test.cc
  lang/wgsl/resolver/is_host_shareable_test.cc
  lang/wgsl/resolver/is_storeable_test.cc
  lang/wgsl/resolver/load_test.cc
  lang/wgsl/resolver/materialize_test.cc
  lang/wgsl/resolver/override_test.cc
  lang/wgsl/resolver/ptr_ref_test.cc
  lang/wgsl/resolver/ptr_ref_validation_test.cc
  lang/wgsl/resolver/resolver_behavior_test.cc
  lang/wgsl/resolver/resolver_helper_test.cc
  lang/wgsl/resolver/resolver_helper_test.h
  lang/wgsl/resolver/resolver_test.cc
  lang/wgsl/resolver/root_identifier_test.cc
  lang/wgsl/resolver/side_effects_test.cc
  lang/wgsl/resolver/struct_address_space_use_test.cc
  lang/wgsl/resolver/struct_layout_test.cc
  lang/wgsl/resolver/struct_pipeline_stage_use_test.cc
  lang/wgsl/resolver/subgroups_extension_test.cc
  lang/wgsl/resolver/type_validation_test.cc
  lang/wgsl/resolver/uniformity_test.cc
  lang/wgsl/resolver/unresolved_identifier_test.cc
  lang/wgsl/resolver/validation_test.cc
  lang/wgsl/resolver/validator_is_storeable_test.cc
  lang/wgsl/resolver/value_constructor_validation_test.cc
  lang/wgsl/resolver/variable_test.cc
  lang/wgsl/resolver/variable_validation_test.cc
)

tint_target_add_dependencies("lang/wgsl/resolver:test"
  "lang/core"
  "lang/core/constant"
  "lang/core/intrinsic"
  "lang/core/type"
  "lang/core/type:test"
  "lang/wgsl/ast"
  "lang/wgsl/ast/transform"
  "lang/wgsl/ast:test"
  "lang/wgsl/program"
  "lang/wgsl/reader"
  "lang/wgsl/resolver"
  "lang/wgsl/sem"
  "lang/wgsl/sem:test"
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
