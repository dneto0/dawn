SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
int2 subgroupMax_932164() {
  int2 res = WaveActiveMax((int(1)).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(subgroupMax_932164()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(subgroupMax_932164()));
}

FXC validation failure:
<scrubbed_path>(4,14-39): error X3004: undeclared identifier 'WaveActiveMax'


tint executable returned error: exit status 1
