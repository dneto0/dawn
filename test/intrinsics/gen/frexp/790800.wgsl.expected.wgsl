fn frexp_790800() {
  var arg_1 : u32;
  var res : f32 = frexp(1.0, &(arg_1));
}

[[stage(vertex)]]
fn vertex_main() -> [[builtin(position)]] vec4<f32> {
  frexp_790800();
  return vec4<f32>();
}

[[stage(fragment)]]
fn fragment_main() {
  frexp_790800();
}

[[stage(compute), workgroup_size(1)]]
fn compute_main() {
  frexp_790800();
}
