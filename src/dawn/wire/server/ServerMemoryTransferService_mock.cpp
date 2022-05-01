// Copyright 2019 The Dawn Authors
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

#include "dawn/wire/server/ServerMemoryTransferService_mock.h"

#include "dawn/common/Assert.h"

namespace dawn::wire::server {

MockMemoryTransferService::MockReadHandle::MockReadHandle(MockMemoryTransferService* service)
    : ReadHandle(), mService(service) {}

MockMemoryTransferService::MockReadHandle::~MockReadHandle() {
    mService->OnReadHandleDestroy(this);
}

size_t MockMemoryTransferService::MockReadHandle::SizeOfSerializeDataUpdate(size_t offset,
                                                                            size_t size) {
    return mService->OnReadHandleSizeOfSerializeDataUpdate(this, offset, size);
}

void MockMemoryTransferService::MockReadHandle::SerializeDataUpdate(const void* data,
                                                                    size_t offset,
                                                                    size_t size,
                                                                    void* serializePointer) {
    mService->OnReadHandleSerializeDataUpdate(this, data, offset, size, serializePointer);
}

MockMemoryTransferService::MockWriteHandle::MockWriteHandle(MockMemoryTransferService* service)
    : WriteHandle(), mService(service) {}

MockMemoryTransferService::MockWriteHandle::~MockWriteHandle() {
    mService->OnWriteHandleDestroy(this);
}

const uint32_t* MockMemoryTransferService::MockWriteHandle::GetData() const {
    return reinterpret_cast<const uint32_t*>(mTargetData);
}

bool MockMemoryTransferService::MockWriteHandle::DeserializeDataUpdate(
    const void* deserializePointer,
    size_t deserializeSize,
    size_t offset,
    size_t size) {
    ASSERT(deserializeSize % sizeof(uint32_t) == 0);
    return mService->OnWriteHandleDeserializeDataUpdate(
        this, reinterpret_cast<const uint32_t*>(deserializePointer), deserializeSize, offset, size);
}

MockMemoryTransferService::MockMemoryTransferService() = default;
MockMemoryTransferService::~MockMemoryTransferService() = default;

bool MockMemoryTransferService::DeserializeReadHandle(const void* deserializePointer,
                                                      size_t deserializeSize,
                                                      ReadHandle** readHandle) {
    ASSERT(deserializeSize % sizeof(uint32_t) == 0);
    return OnDeserializeReadHandle(reinterpret_cast<const uint32_t*>(deserializePointer),
                                   deserializeSize, readHandle);
}

bool MockMemoryTransferService::DeserializeWriteHandle(const void* deserializePointer,
                                                       size_t deserializeSize,
                                                       WriteHandle** writeHandle) {
    ASSERT(deserializeSize % sizeof(uint32_t) == 0);
    return OnDeserializeWriteHandle(reinterpret_cast<const uint32_t*>(deserializePointer),
                                    deserializeSize, writeHandle);
}

MockMemoryTransferService::MockReadHandle* MockMemoryTransferService::NewReadHandle() {
    return new MockReadHandle(this);
}

MockMemoryTransferService::MockWriteHandle* MockMemoryTransferService::NewWriteHandle() {
    return new MockWriteHandle(this);
}

}  // namespace dawn::wire::server
