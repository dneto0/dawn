[[group(1), binding(0)]] var arg_0 : texture_storage_3d<rg32uint, read>;

fn textureLoad_ef5405() {
  var res : vec4<u32> = textureLoad(arg_0, vec3<i32>());
}

[[stage(vertex)]]
fn vertex_main() -> [[builtin(position)]] vec4<f32> {
  textureLoad_ef5405();
  return vec4<f32>();
}

[[stage(fragment)]]
fn fragment_main() {
  textureLoad_ef5405();
}

[[stage(compute), workgroup_size(1)]]
fn compute_main() {
  textureLoad_ef5405();
}
