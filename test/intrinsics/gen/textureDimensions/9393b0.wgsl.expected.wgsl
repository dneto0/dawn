[[group(1), binding(0)]] var arg_0 : texture_depth_cube;

fn textureDimensions_9393b0() {
  var res : vec2<i32> = textureDimensions(arg_0, 1);
}

[[stage(vertex)]]
fn vertex_main() -> [[builtin(position)]] vec4<f32> {
  textureDimensions_9393b0();
  return vec4<f32>();
}

[[stage(fragment)]]
fn fragment_main() {
  textureDimensions_9393b0();
}

[[stage(compute), workgroup_size(1)]]
fn compute_main() {
  textureDimensions_9393b0();
}
