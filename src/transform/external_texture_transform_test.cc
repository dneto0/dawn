// Copyright 2021 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/transform/external_texture_transform.h"

#include "src/transform/test_helper.h"

namespace tint {
namespace transform {
namespace {

using ExternalTextureTransformTest = TransformTest;

TEST_F(ExternalTextureTransformTest, SinglePlane) {
  auto* src = R"(
[[group(0), binding(0)]] var s : sampler;

[[group(0), binding(1)]] var t : texture_external;

[[stage(fragment)]]
fn main([[builtin(position)]] coord : vec4<f32>) -> [[location(0)]] vec4<f32> {
  return textureSample(t, s, (coord.xy / vec2<f32>(4.0, 4.0)));
}
)";

  auto* expect = R"(
[[group(0), binding(0)]] var s : sampler;

[[group(0), binding(1)]] var t : texture_2d<f32>;

[[stage(fragment)]]
fn main([[builtin(position)]] coord : vec4<f32>) -> [[location(0)]] vec4<f32> {
  return textureSample(t, s, (coord.xy / vec2<f32>(4.0, 4.0)));
}
)";

  auto got = Run<ExternalTextureTransform>(src);

  EXPECT_EQ(expect, str(got));
}

}  // namespace
}  // namespace transform
}  // namespace tint
