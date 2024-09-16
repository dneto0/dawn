#version 310 es

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  vec2 tint_symbol_col0;
  vec2 tint_symbol_col1;
} v;
shared mat2 w;
void f_inner(uint tint_local_index) {
  if ((tint_local_index == 0u)) {
    w = mat2(vec2(0.0f), vec2(0.0f));
  }
  barrier();
  w = mat2(v.tint_symbol_col0, v.tint_symbol_col1);
  w[1] = mat2(v.tint_symbol_col0, v.tint_symbol_col1)[0];
  w[1] = mat2(v.tint_symbol_col0, v.tint_symbol_col1)[0].yx;
  w[0][1] = mat2(v.tint_symbol_col0, v.tint_symbol_col1)[1][0];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f_inner(gl_LocalInvocationIndex);
}
