fn bitcast_1c3b31() {
  var arg_0 = vec2<i32>(1i);
  var res : vec2<u32> = bitcast<vec2<u32>>(arg_0);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  bitcast_1c3b31();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  bitcast_1c3b31();
}

@compute @workgroup_size(1)
fn compute_main() {
  bitcast_1c3b31();
}
