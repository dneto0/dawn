var<workgroup> arg_1 : vec4<f32>;

fn modf_1d59e5() {
  var res : vec4<f32> = modf(vec4<f32>(), &(arg_1));
}

[[stage(compute), workgroup_size(1)]]
fn compute_main() {
  modf_1d59e5();
}
