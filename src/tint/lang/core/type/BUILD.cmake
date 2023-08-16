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

tint_add_target("lang/core/type"
  lang/core/type/abstract_float.cc
  lang/core/type/abstract_float.h
  lang/core/type/abstract_int.cc
  lang/core/type/abstract_int.h
  lang/core/type/abstract_numeric.cc
  lang/core/type/abstract_numeric.h
  lang/core/type/array.cc
  lang/core/type/array.h
  lang/core/type/array_count.cc
  lang/core/type/array_count.h
  lang/core/type/atomic.cc
  lang/core/type/atomic.h
  lang/core/type/bool.cc
  lang/core/type/bool.h
  lang/core/type/builtin_structs.cc
  lang/core/type/builtin_structs.h
  lang/core/type/clone_context.h
  lang/core/type/depth_multisampled_texture.cc
  lang/core/type/depth_multisampled_texture.h
  lang/core/type/depth_texture.cc
  lang/core/type/depth_texture.h
  lang/core/type/external_texture.cc
  lang/core/type/external_texture.h
  lang/core/type/f16.cc
  lang/core/type/f16.h
  lang/core/type/f32.cc
  lang/core/type/f32.h
  lang/core/type/i32.cc
  lang/core/type/i32.h
  lang/core/type/manager.cc
  lang/core/type/manager.h
  lang/core/type/matrix.cc
  lang/core/type/matrix.h
  lang/core/type/multisampled_texture.cc
  lang/core/type/multisampled_texture.h
  lang/core/type/node.cc
  lang/core/type/node.h
  lang/core/type/numeric_scalar.cc
  lang/core/type/numeric_scalar.h
  lang/core/type/pointer.cc
  lang/core/type/pointer.h
  lang/core/type/reference.cc
  lang/core/type/reference.h
  lang/core/type/sampled_texture.cc
  lang/core/type/sampled_texture.h
  lang/core/type/sampler.cc
  lang/core/type/sampler.h
  lang/core/type/sampler_kind.cc
  lang/core/type/sampler_kind.h
  lang/core/type/scalar.cc
  lang/core/type/scalar.h
  lang/core/type/storage_texture.cc
  lang/core/type/storage_texture.h
  lang/core/type/struct.cc
  lang/core/type/struct.h
  lang/core/type/texture.cc
  lang/core/type/texture.h
  lang/core/type/texture_dimension.cc
  lang/core/type/texture_dimension.h
  lang/core/type/type.cc
  lang/core/type/type.h
  lang/core/type/u32.cc
  lang/core/type/u32.h
  lang/core/type/unique_node.cc
  lang/core/type/unique_node.h
  lang/core/type/vector.cc
  lang/core/type/vector.h
  lang/core/type/void.cc
  lang/core/type/void.h
)

tint_target_add_dependencies("lang/core/type"
  "lang/core"
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

tint_add_target("lang/core/type:test"
  lang/core/type/array_test.cc
  lang/core/type/atomic_test.cc
  lang/core/type/bool_test.cc
  lang/core/type/builtin_structs_test.cc
  lang/core/type/depth_multisampled_texture_test.cc
  lang/core/type/depth_texture_test.cc
  lang/core/type/external_texture_test.cc
  lang/core/type/f16_test.cc
  lang/core/type/f32_test.cc
  lang/core/type/helper_test.h
  lang/core/type/i32_test.cc
  lang/core/type/manager_test.cc
  lang/core/type/matrix_test.cc
  lang/core/type/multisampled_texture_test.cc
  lang/core/type/pointer_test.cc
  lang/core/type/reference_test.cc
  lang/core/type/sampled_texture_test.cc
  lang/core/type/sampler_test.cc
  lang/core/type/storage_texture_test.cc
  lang/core/type/struct_test.cc
  lang/core/type/texture_test.cc
  lang/core/type/type_test.cc
  lang/core/type/u32_test.cc
  lang/core/type/vector_test.cc
)

tint_target_add_dependencies("lang/core/type:test"
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
