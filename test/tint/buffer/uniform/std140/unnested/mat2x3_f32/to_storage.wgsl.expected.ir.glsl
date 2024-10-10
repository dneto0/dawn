#version 310 es

layout(binding = 0, std140)
uniform u_block_std140_1_ubo {
  vec3 inner_col0;
  uint tint_pad_0;
  vec3 inner_col1;
} v;
layout(binding = 1, std430)
buffer s_block_1_ssbo {
  mat2x3 inner;
} v_1;
void tint_store_and_preserve_padding(inout mat2x3 target, mat2x3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_store_and_preserve_padding(v_1.inner, mat2x3(v.inner_col0, v.inner_col1));
  v_1.inner[1] = mat2x3(v.inner_col0, v.inner_col1)[0];
  v_1.inner[1] = mat2x3(v.inner_col0, v.inner_col1)[0].zxy;
  v_1.inner[0][1] = mat2x3(v.inner_col0, v.inner_col1)[1][0];
}
