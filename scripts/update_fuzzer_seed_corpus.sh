#!/bin/bash

# Copyright 2019 The Dawn Authors
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

# Generates a seed corpus for fuzzing based on dumping wire traces
# from running Dawn tests

# Exit if anything fails
set -e

if [ "$#" -ne 3 ]; then
cat << EOF

Usage:
  $0 <out_dir> <fuzzer_name> <test_name>

Example:
  $0 out/fuzz dawn_wire_server_and_frontend_fuzzer dawn_end2end_tests

EOF
    exit 1
fi

out_dir=$1
fuzzer_name=$2
test_name=$3

testcase_dir="/tmp/testcases/${fuzzer_name}/"
minimized_testcase_dir="/tmp/testcases/${fuzzer_name}_minimized/"

# Make a directory for temporarily storing testcases
mkdir -p "$testcase_dir"

# Make an empty directory for temporarily storing minimized testcases
rm -rf "$minimized_testcase_dir"
mkdir -p "$minimized_testcase_dir"

# Download the existing corpus. First argument is src, second is dst.
gsutil -m rsync gs://clusterfuzz-corpus/libfuzzer/${fuzzer_name}/ "$testcase_dir"

# Build the fuzzer and test
autoninja -C $out_dir $fuzzer_name $test_name

fuzzer_binary="${out_dir}/${fuzzer_name}"
test_binary="${out_dir}/${test_name}"

# Run the test binary
$test_binary --use-wire --wire-trace-dir="$testcase_dir"

# Run the fuzzer to minimize the corpus
$fuzzer_binary -merge=1 "$minimized_testcase_dir" "$testcase_dir"

if [ -z "$(ls -A $minimized_testcase_dir)" ]; then
cat << EOF

Minimized testcase directory is empty!
Are you building with use_libfuzzer=true ?

EOF
    exit 1
fi

cat << EOF

Please test the corpus in $minimized_testcase_dir with $fuzzer_name and confirm it works as expected.

    $fuzzer_binary $minimized_testcase_dir

Then, run the following command to upload new testcases to the seed corpus:

    gsutil -m rsync $minimized_testcase_dir gs://clusterfuzz-corpus/libfuzzer/${fuzzer_name}/

    WARNING: Add [-d] argument to delete all GCS files that are not also in $minimized_testcase_dir

EOF
