SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

fn textureBarrier_3d0f7e() {
  textureBarrier();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureBarrier_3d0f7e();
}

Failed to generate: builtins/gen/literal/textureBarrier/3d0f7e.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

