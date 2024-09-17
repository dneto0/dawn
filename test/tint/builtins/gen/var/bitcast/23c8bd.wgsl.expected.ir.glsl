#version 310 es
#extension GL_AMD_gpu_shader_half_float: require
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  float tint_symbol;
} v;
float tint_bitcast_from_f16(f16vec2 src) {
  return uintBitsToFloat(packFloat2x16(src));
}
float bitcast_23c8bd() {
  f16vec2 arg_0 = f16vec2(1.0hf);
  float res = tint_bitcast_from_f16(arg_0);
  return res;
}
void main() {
  v.tint_symbol = bitcast_23c8bd();
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  float tint_symbol;
} v;
float tint_bitcast_from_f16(f16vec2 src) {
  return uintBitsToFloat(packFloat2x16(src));
}
float bitcast_23c8bd() {
  f16vec2 arg_0 = f16vec2(1.0hf);
  float res = tint_bitcast_from_f16(arg_0);
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol = bitcast_23c8bd();
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float: require


struct VertexOutput {
  vec4 pos;
  float prevent_dce;
};

layout(location = 0) flat out float vertex_main_loc0_Output;
float tint_bitcast_from_f16(f16vec2 src) {
  return uintBitsToFloat(packFloat2x16(src));
}
float bitcast_23c8bd() {
  f16vec2 arg_0 = f16vec2(1.0hf);
  float res = tint_bitcast_from_f16(arg_0);
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f), 0.0f);
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = bitcast_23c8bd();
  return tint_symbol;
}
void main() {
  VertexOutput v = vertex_main_inner();
  gl_Position = v.pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  vertex_main_loc0_Output = v.prevent_dce;
  gl_PointSize = 1.0f;
}
