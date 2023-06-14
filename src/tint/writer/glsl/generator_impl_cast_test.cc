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

#include "src/tint/utils/string_stream.h"
#include "src/tint/writer/glsl/test_helper.h"

#include "gmock/gmock.h"

using namespace tint::builtin::fluent_types;  // NOLINT
using namespace tint::number_suffixes;        // NOLINT

namespace tint::writer::glsl {
namespace {

using GlslGeneratorImplTest_Cast = TestHelper;

TEST_F(GlslGeneratorImplTest_Cast, EmitExpression_Cast_Scalar) {
    auto* cast = Call<f32>(1_i);
    WrapInFunction(cast);

    GeneratorImpl& gen = Build();

    utils::StringStream out;
    gen.EmitExpression(out, cast);
    EXPECT_THAT(gen.Diagnostics(), testing::IsEmpty());
    EXPECT_EQ(out.str(), "1.0f");
}

TEST_F(GlslGeneratorImplTest_Cast, EmitExpression_Cast_Vector) {
    auto* cast = Call<vec3<f32>>(Call<vec3<i32>>(1_i, 2_i, 3_i));
    WrapInFunction(cast);

    GeneratorImpl& gen = Build();

    utils::StringStream out;
    gen.EmitExpression(out, cast);
    EXPECT_THAT(gen.Diagnostics(), testing::IsEmpty());
    EXPECT_EQ(out.str(), "vec3(1.0f, 2.0f, 3.0f)");
}

}  // namespace
}  // namespace tint::writer::glsl
