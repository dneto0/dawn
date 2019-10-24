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

#include "dawn_native/d3d12/HeapAllocatorD3D12.h"
#include "dawn_native/d3d12/DeviceD3D12.h"
#include "dawn_native/d3d12/HeapD3D12.h"

namespace dawn_native { namespace d3d12 {

    HeapAllocator::HeapAllocator(Device* device,
                                 D3D12_HEAP_TYPE heapType,
                                 D3D12_HEAP_FLAGS heapFlags)
        : mDevice(device), mHeapType(heapType), mHeapFlags(heapFlags) {
    }

    ResultOrError<std::unique_ptr<ResourceHeapBase>> HeapAllocator::AllocateResourceHeap(
        uint64_t size) {
        D3D12_HEAP_DESC heapDesc;
        heapDesc.SizeInBytes = size;
        heapDesc.Properties.Type = mHeapType;
        heapDesc.Properties.CPUPageProperty = D3D12_CPU_PAGE_PROPERTY_UNKNOWN;
        heapDesc.Properties.MemoryPoolPreference = D3D12_MEMORY_POOL_UNKNOWN;
        heapDesc.Properties.CreationNodeMask = 0;
        heapDesc.Properties.VisibleNodeMask = 0;
        // It is preferred to use a size that is a multiple of the alignment.
        // However, MSAA heaps are always aligned to 4MB instead of 64KB. This means
        // if the heap size is too small, the VMM would fragment.
        // TODO(bryan.bernhart@intel.com): Consider having MSAA vs non-MSAA heaps.
        heapDesc.Alignment = D3D12_DEFAULT_MSAA_RESOURCE_PLACEMENT_ALIGNMENT;
        heapDesc.Flags = mHeapFlags;

        ComPtr<ID3D12Heap> heap;
        if (FAILED(mDevice->GetD3D12Device()->CreateHeap(&heapDesc, IID_PPV_ARGS(&heap)))) {
            return DAWN_OUT_OF_MEMORY_ERROR("Unable to allocate heap");
        }

        return {std::make_unique<Heap>(std::move(heap))};
    }

    void HeapAllocator::DeallocateResourceHeap(std::unique_ptr<ResourceHeapBase> heap) {
        mDevice->ReferenceUntilUnused(static_cast<Heap*>(heap.get())->GetD3D12Heap());
    }

}}  // namespace dawn_native::d3d12
