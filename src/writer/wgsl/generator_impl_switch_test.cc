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
#include <vector>

#include "gtest/gtest.h"
#include "src/ast/break_statement.h"
#include "src/ast/case_statement.h"
#include "src/ast/identifier_expression.h"
#include "src/ast/int_literal.h"
#include "src/ast/switch_statement.h"
#include "src/ast/type/i32_type.h"
#include "src/writer/wgsl/generator_impl.h"

namespace tint {
namespace writer {
namespace wgsl {
namespace {

using GeneratorImplTest = testing::Test;

TEST_F(GeneratorImplTest, Emit_Switch) {
  auto def = std::make_unique<ast::CaseStatement>();
  std::vector<std::unique_ptr<ast::Statement>> def_body;
  def_body.push_back(std::make_unique<ast::BreakStatement>());
  def->set_body(std::move(def_body));

  ast::type::I32Type i32;
  auto case_val = std::make_unique<ast::IntLiteral>(&i32, 5);
  std::vector<std::unique_ptr<ast::Statement>> case_body;
  case_body.push_back(std::make_unique<ast::BreakStatement>());

  auto case_stmt = std::make_unique<ast::CaseStatement>(std::move(case_val),
                                                        std::move(case_body));

  std::vector<std::unique_ptr<ast::CaseStatement>> body;
  body.push_back(std::move(case_stmt));
  body.push_back(std::move(def));

  auto cond = std::make_unique<ast::IdentifierExpression>("cond");
  ast::SwitchStatement s(std::move(cond), std::move(body));

  GeneratorImpl g;
  g.increment_indent();

  ASSERT_TRUE(g.EmitStatement(&s)) << g.error();
  EXPECT_EQ(g.result(), R"(  switch(cond) {
    case 5: {
      break;
    }
    default: {
      break;
    }
  }
)");
}

}  // namespace
}  // namespace wgsl
}  // namespace writer
}  // namespace tint
