fn modf_e83560() {
  var arg_1 : vec4<f32>;
  var res : vec4<f32> = modf(vec4<f32>(), &(arg_1));
}

[[stage(vertex)]]
fn vertex_main() -> [[builtin(position)]] vec4<f32> {
  modf_e83560();
  return vec4<f32>();
}

[[stage(fragment)]]
fn fragment_main() {
  modf_e83560();
}

[[stage(compute), workgroup_size(1)]]
fn compute_main() {
  modf_e83560();
}
