// Copyright 2020 The Tint Authors.
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

#include <memory>

#include "gtest/gtest.h"
#include "src/ast/identifier_expression.h"
#include "src/ast/member_accessor_expression.h"
#include "src/program.h"
#include "src/writer/msl/generator_impl.h"
#include "src/writer/msl/test_helper.h"

namespace tint {
namespace writer {
namespace msl {
namespace {

using MslGeneratorImplTest = TestHelper;

TEST_F(MslGeneratorImplTest, EmitExpression_MemberAccessor) {
  Global("str",
         ty.struct_("my_str", create<ast::Struct>(
                                  ast::StructMemberList{
                                      Member("mem", ty.f32()),
                                  },
                                  ast::StructDecorationList{})),
         ast::StorageClass::kPrivate);
  auto* expr = MemberAccessor("str", "mem");
  WrapInFunction(expr);

  GeneratorImpl& gen = Build();

  ASSERT_TRUE(gen.EmitExpression(expr)) << gen.error();
  EXPECT_EQ(gen.result(), "str.mem");
}

TEST_F(MslGeneratorImplTest, EmitExpression_MemberAccessor_Swizzle_xyz) {
  Global("my_vec", ty.vec4<f32>(), ast::StorageClass::kPrivate);

  auto* expr = MemberAccessor("my_vec", "xyz");
  WrapInFunction(expr);

  GeneratorImpl& gen = Build();
  ASSERT_TRUE(gen.EmitExpression(expr)) << gen.error();
  EXPECT_EQ(gen.result(), "my_vec.xyz");
}

TEST_F(MslGeneratorImplTest, EmitExpression_MemberAccessor_Swizzle_gbr) {
  Global("my_vec", ty.vec4<f32>(), ast::StorageClass::kPrivate);

  auto* expr = MemberAccessor("my_vec", "gbr");
  WrapInFunction(expr);

  GeneratorImpl& gen = Build();
  ASSERT_TRUE(gen.EmitExpression(expr)) << gen.error();
  EXPECT_EQ(gen.result(), "my_vec.gbr");
}

}  // namespace
}  // namespace msl
}  // namespace writer
}  // namespace tint
