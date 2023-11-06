# Copyright 2023 The Dawn & Tint Authors
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

if(TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_reader_parser
# Kind:      lib
# Condition: TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_reader_parser lib
  lang/wgsl/reader/parser/classify_template_args.cc
  lang/wgsl/reader/parser/classify_template_args.h
  lang/wgsl/reader/parser/detail.h
  lang/wgsl/reader/parser/lexer.cc
  lang/wgsl/reader/parser/lexer.h
  lang/wgsl/reader/parser/parser.cc
  lang/wgsl/reader/parser/parser.h
  lang/wgsl/reader/parser/token.cc
  lang/wgsl/reader/parser/token.h
)

tint_target_add_dependencies(tint_lang_wgsl_reader_parser lib
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_common
  tint_lang_wgsl_program
  tint_lang_wgsl_resolver
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_strconv
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

endif(TINT_BUILD_WGSL_READER)
if(TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_reader_parser_test
# Kind:      test
# Condition: TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_reader_parser_test test
  lang/wgsl/reader/parser/additive_expression_test.cc
  lang/wgsl/reader/parser/argument_expression_list_test.cc
  lang/wgsl/reader/parser/assignment_stmt_test.cc
  lang/wgsl/reader/parser/bitwise_expression_test.cc
  lang/wgsl/reader/parser/break_stmt_test.cc
  lang/wgsl/reader/parser/bug_cases_test.cc
  lang/wgsl/reader/parser/call_stmt_test.cc
  lang/wgsl/reader/parser/classify_template_args_test.cc
  lang/wgsl/reader/parser/compound_stmt_test.cc
  lang/wgsl/reader/parser/const_literal_test.cc
  lang/wgsl/reader/parser/continue_stmt_test.cc
  lang/wgsl/reader/parser/continuing_stmt_test.cc
  lang/wgsl/reader/parser/core_lhs_expression_test.cc
  lang/wgsl/reader/parser/diagnostic_attribute_test.cc
  lang/wgsl/reader/parser/diagnostic_control_test.cc
  lang/wgsl/reader/parser/diagnostic_directive_test.cc
  lang/wgsl/reader/parser/enable_directive_test.cc
  lang/wgsl/reader/parser/error_msg_test.cc
  lang/wgsl/reader/parser/error_resync_test.cc
  lang/wgsl/reader/parser/expression_test.cc
  lang/wgsl/reader/parser/for_stmt_test.cc
  lang/wgsl/reader/parser/function_attribute_list_test.cc
  lang/wgsl/reader/parser/function_attribute_test.cc
  lang/wgsl/reader/parser/function_decl_test.cc
  lang/wgsl/reader/parser/function_header_test.cc
  lang/wgsl/reader/parser/global_constant_decl_test.cc
  lang/wgsl/reader/parser/global_decl_test.cc
  lang/wgsl/reader/parser/global_variable_decl_test.cc
  lang/wgsl/reader/parser/helper_test.cc
  lang/wgsl/reader/parser/helper_test.h
  lang/wgsl/reader/parser/if_stmt_test.cc
  lang/wgsl/reader/parser/increment_decrement_stmt_test.cc
  lang/wgsl/reader/parser/lexer_test.cc
  lang/wgsl/reader/parser/lhs_expression_test.cc
  lang/wgsl/reader/parser/loop_stmt_test.cc
  lang/wgsl/reader/parser/math_expression_test.cc
  lang/wgsl/reader/parser/multiplicative_expression_test.cc
  lang/wgsl/reader/parser/param_list_test.cc
  lang/wgsl/reader/parser/paren_expression_test.cc
  lang/wgsl/reader/parser/parser_test.cc
  lang/wgsl/reader/parser/primary_expression_test.cc
  lang/wgsl/reader/parser/relational_expression_test.cc
  lang/wgsl/reader/parser/require_directive_test.cc
  lang/wgsl/reader/parser/reserved_keyword_test.cc
  lang/wgsl/reader/parser/shift_expression_test.cc
  lang/wgsl/reader/parser/singular_expression_test.cc
  lang/wgsl/reader/parser/statement_test.cc
  lang/wgsl/reader/parser/statements_test.cc
  lang/wgsl/reader/parser/struct_attribute_decl_test.cc
  lang/wgsl/reader/parser/struct_body_decl_test.cc
  lang/wgsl/reader/parser/struct_decl_test.cc
  lang/wgsl/reader/parser/struct_member_attribute_decl_test.cc
  lang/wgsl/reader/parser/struct_member_attribute_test.cc
  lang/wgsl/reader/parser/struct_member_test.cc
  lang/wgsl/reader/parser/switch_body_test.cc
  lang/wgsl/reader/parser/switch_stmt_test.cc
  lang/wgsl/reader/parser/token_test.cc
  lang/wgsl/reader/parser/type_alias_test.cc
  lang/wgsl/reader/parser/type_decl_test.cc
  lang/wgsl/reader/parser/unary_expression_test.cc
  lang/wgsl/reader/parser/variable_attribute_list_test.cc
  lang/wgsl/reader/parser/variable_attribute_test.cc
  lang/wgsl/reader/parser/variable_decl_test.cc
  lang/wgsl/reader/parser/variable_ident_decl_test.cc
  lang/wgsl/reader/parser/variable_qualifier_test.cc
  lang/wgsl/reader/parser/variable_stmt_test.cc
  lang/wgsl/reader/parser/while_stmt_test.cc
)

tint_target_add_dependencies(tint_lang_wgsl_reader_parser_test test
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_ast_test
  tint_lang_wgsl_common
  tint_lang_wgsl_program
  tint_lang_wgsl_resolver
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_reader_parser_test test
  "gtest"
)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_reader_parser_test test
    tint_lang_wgsl_reader_parser
  )
endif(TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_WGSL_READER)