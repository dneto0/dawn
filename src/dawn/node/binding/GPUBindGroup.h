// Copyright 2021 The Dawn Authors
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

#ifndef DAWN_NODE_BINDING_GPUBINDGROUP_H_
#define DAWN_NODE_BINDING_GPUBINDGROUP_H_

#include "dawn/native/DawnNative.h"
#include "dawn/webgpu_cpp.h"
#include "node-addon-api/napi.h"
#include "src/dawn/node/interop/WebGPU.h"

namespace wgpu::binding {

    // GPUBindGroup is an implementation of interop::GPUBindGroup that wraps a wgpu::BindGroup.
    class GPUBindGroup final : public interop::GPUBindGroup {
      public:
        GPUBindGroup(wgpu::BindGroup group);

        // Implicit cast operator to Dawn GPU object
        inline operator const wgpu::BindGroup&() const {
            return group_;
        }

        // interop::GPUBindGroup interface compliance
        std::variant<std::string, interop::UndefinedType> getLabel(Napi::Env) override;
        void setLabel(Napi::Env, std::variant<std::string, interop::UndefinedType> value) override;

      private:
        wgpu::BindGroup group_;
    };

}  // namespace wgpu::binding

#endif  // DAWN_NODE_BINDING_GPUBINDGROUP_H_
