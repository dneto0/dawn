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

if(TINT_BUILD_MSL_WRITER  AND  TINT_BUILD_IR)
tint_add_target("lang/msl/writer/printer"
  lang/msl/writer/printer/printer.cc
  lang/msl/writer/printer/printer.h
)

tint_target_add_dependencies("lang/msl/writer/printer"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
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

if (TINT_BUILD_IR)
  tint_target_add_dependencies("lang/msl/writer/printer"
    "lang/core/ir"
  )
endif(TINT_BUILD_IR)

if (TINT_BUILD_MSL_WRITER)
  tint_target_add_dependencies("lang/msl/writer/printer"
    "lang/msl/writer/common"
  )
endif(TINT_BUILD_MSL_WRITER)

endif(TINT_BUILD_MSL_WRITER  AND  TINT_BUILD_IR)
if(TINT_BUILD_MSL_WRITER  AND  TINT_BUILD_IR)
tint_add_target("lang/msl/writer/printer:test"
  lang/msl/writer/printer/binary_test.cc
  lang/msl/writer/printer/constant_test.cc
  lang/msl/writer/printer/function_test.cc
  lang/msl/writer/printer/helper_test.h
  lang/msl/writer/printer/if_test.cc
  lang/msl/writer/printer/let_test.cc
  lang/msl/writer/printer/return_test.cc
  lang/msl/writer/printer/type_test.cc
  lang/msl/writer/printer/var_test.cc
)

tint_target_add_dependencies("lang/msl/writer/printer:test"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/msl/writer/raise"
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

if (TINT_BUILD_IR)
  tint_target_add_dependencies("lang/msl/writer/printer:test"
    "lang/core/ir"
  )
endif(TINT_BUILD_IR)

if (TINT_BUILD_MSL_WRITER  AND  TINT_BUILD_IR)
  tint_target_add_dependencies("lang/msl/writer/printer:test"
    "lang/msl/writer/printer"
  )
endif(TINT_BUILD_MSL_WRITER  AND  TINT_BUILD_IR)

endif(TINT_BUILD_MSL_WRITER  AND  TINT_BUILD_IR)