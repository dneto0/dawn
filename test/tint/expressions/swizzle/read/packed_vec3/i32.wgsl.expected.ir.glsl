#version 310 es


struct S {
  ivec3 v;
  uint tint_pad_0;
};

layout(binding = 0, std140)
uniform U_block_1_ubo {
  S inner;
} v_1;
void f() {
  ivec3 v = v_1.inner.v;
  int x = v_1.inner.v.x;
  int y = v_1.inner.v.y;
  int z = v_1.inner.v.z;
  ivec2 xx = v_1.inner.v.xx;
  ivec2 xy = v_1.inner.v.xy;
  ivec2 xz = v_1.inner.v.xz;
  ivec2 yx = v_1.inner.v.yx;
  ivec2 yy = v_1.inner.v.yy;
  ivec2 yz = v_1.inner.v.yz;
  ivec2 zx = v_1.inner.v.zx;
  ivec2 zy = v_1.inner.v.zy;
  ivec2 zz = v_1.inner.v.zz;
  ivec3 xxx = v_1.inner.v.xxx;
  ivec3 xxy = v_1.inner.v.xxy;
  ivec3 xxz = v_1.inner.v.xxz;
  ivec3 xyx = v_1.inner.v.xyx;
  ivec3 xyy = v_1.inner.v.xyy;
  ivec3 xyz = v_1.inner.v.xyz;
  ivec3 xzx = v_1.inner.v.xzx;
  ivec3 xzy = v_1.inner.v.xzy;
  ivec3 xzz = v_1.inner.v.xzz;
  ivec3 yxx = v_1.inner.v.yxx;
  ivec3 yxy = v_1.inner.v.yxy;
  ivec3 yxz = v_1.inner.v.yxz;
  ivec3 yyx = v_1.inner.v.yyx;
  ivec3 yyy = v_1.inner.v.yyy;
  ivec3 yyz = v_1.inner.v.yyz;
  ivec3 yzx = v_1.inner.v.yzx;
  ivec3 yzy = v_1.inner.v.yzy;
  ivec3 yzz = v_1.inner.v.yzz;
  ivec3 zxx = v_1.inner.v.zxx;
  ivec3 zxy = v_1.inner.v.zxy;
  ivec3 zxz = v_1.inner.v.zxz;
  ivec3 zyx = v_1.inner.v.zyx;
  ivec3 zyy = v_1.inner.v.zyy;
  ivec3 zyz = v_1.inner.v.zyz;
  ivec3 zzx = v_1.inner.v.zzx;
  ivec3 zzy = v_1.inner.v.zzy;
  ivec3 zzz = v_1.inner.v.zzz;
  ivec4 xxxx = v_1.inner.v.xxxx;
  ivec4 xxxy = v_1.inner.v.xxxy;
  ivec4 xxxz = v_1.inner.v.xxxz;
  ivec4 xxyx = v_1.inner.v.xxyx;
  ivec4 xxyy = v_1.inner.v.xxyy;
  ivec4 xxyz = v_1.inner.v.xxyz;
  ivec4 xxzx = v_1.inner.v.xxzx;
  ivec4 xxzy = v_1.inner.v.xxzy;
  ivec4 xxzz = v_1.inner.v.xxzz;
  ivec4 xyxx = v_1.inner.v.xyxx;
  ivec4 xyxy = v_1.inner.v.xyxy;
  ivec4 xyxz = v_1.inner.v.xyxz;
  ivec4 xyyx = v_1.inner.v.xyyx;
  ivec4 xyyy = v_1.inner.v.xyyy;
  ivec4 xyyz = v_1.inner.v.xyyz;
  ivec4 xyzx = v_1.inner.v.xyzx;
  ivec4 xyzy = v_1.inner.v.xyzy;
  ivec4 xyzz = v_1.inner.v.xyzz;
  ivec4 xzxx = v_1.inner.v.xzxx;
  ivec4 xzxy = v_1.inner.v.xzxy;
  ivec4 xzxz = v_1.inner.v.xzxz;
  ivec4 xzyx = v_1.inner.v.xzyx;
  ivec4 xzyy = v_1.inner.v.xzyy;
  ivec4 xzyz = v_1.inner.v.xzyz;
  ivec4 xzzx = v_1.inner.v.xzzx;
  ivec4 xzzy = v_1.inner.v.xzzy;
  ivec4 xzzz = v_1.inner.v.xzzz;
  ivec4 yxxx = v_1.inner.v.yxxx;
  ivec4 yxxy = v_1.inner.v.yxxy;
  ivec4 yxxz = v_1.inner.v.yxxz;
  ivec4 yxyx = v_1.inner.v.yxyx;
  ivec4 yxyy = v_1.inner.v.yxyy;
  ivec4 yxyz = v_1.inner.v.yxyz;
  ivec4 yxzx = v_1.inner.v.yxzx;
  ivec4 yxzy = v_1.inner.v.yxzy;
  ivec4 yxzz = v_1.inner.v.yxzz;
  ivec4 yyxx = v_1.inner.v.yyxx;
  ivec4 yyxy = v_1.inner.v.yyxy;
  ivec4 yyxz = v_1.inner.v.yyxz;
  ivec4 yyyx = v_1.inner.v.yyyx;
  ivec4 yyyy = v_1.inner.v.yyyy;
  ivec4 yyyz = v_1.inner.v.yyyz;
  ivec4 yyzx = v_1.inner.v.yyzx;
  ivec4 yyzy = v_1.inner.v.yyzy;
  ivec4 yyzz = v_1.inner.v.yyzz;
  ivec4 yzxx = v_1.inner.v.yzxx;
  ivec4 yzxy = v_1.inner.v.yzxy;
  ivec4 yzxz = v_1.inner.v.yzxz;
  ivec4 yzyx = v_1.inner.v.yzyx;
  ivec4 yzyy = v_1.inner.v.yzyy;
  ivec4 yzyz = v_1.inner.v.yzyz;
  ivec4 yzzx = v_1.inner.v.yzzx;
  ivec4 yzzy = v_1.inner.v.yzzy;
  ivec4 yzzz = v_1.inner.v.yzzz;
  ivec4 zxxx = v_1.inner.v.zxxx;
  ivec4 zxxy = v_1.inner.v.zxxy;
  ivec4 zxxz = v_1.inner.v.zxxz;
  ivec4 zxyx = v_1.inner.v.zxyx;
  ivec4 zxyy = v_1.inner.v.zxyy;
  ivec4 zxyz = v_1.inner.v.zxyz;
  ivec4 zxzx = v_1.inner.v.zxzx;
  ivec4 zxzy = v_1.inner.v.zxzy;
  ivec4 zxzz = v_1.inner.v.zxzz;
  ivec4 zyxx = v_1.inner.v.zyxx;
  ivec4 zyxy = v_1.inner.v.zyxy;
  ivec4 zyxz = v_1.inner.v.zyxz;
  ivec4 zyyx = v_1.inner.v.zyyx;
  ivec4 zyyy = v_1.inner.v.zyyy;
  ivec4 zyyz = v_1.inner.v.zyyz;
  ivec4 zyzx = v_1.inner.v.zyzx;
  ivec4 zyzy = v_1.inner.v.zyzy;
  ivec4 zyzz = v_1.inner.v.zyzz;
  ivec4 zzxx = v_1.inner.v.zzxx;
  ivec4 zzxy = v_1.inner.v.zzxy;
  ivec4 zzxz = v_1.inner.v.zzxz;
  ivec4 zzyx = v_1.inner.v.zzyx;
  ivec4 zzyy = v_1.inner.v.zzyy;
  ivec4 zzyz = v_1.inner.v.zzyz;
  ivec4 zzzx = v_1.inner.v.zzzx;
  ivec4 zzzy = v_1.inner.v.zzzy;
  ivec4 zzzz = v_1.inner.v.zzzz;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
