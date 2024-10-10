#version 310 es


struct S_std140 {
  int before;
  uint tint_pad_0;
  uint tint_pad_1;
  uint tint_pad_2;
  vec3 m_col0;
  uint tint_pad_3;
  vec3 m_col1;
  uint tint_pad_4;
  vec3 m_col2;
  uint tint_pad_5;
  vec3 m_col3;
  uint tint_pad_6;
  uint tint_pad_7;
  uint tint_pad_8;
  uint tint_pad_9;
  uint tint_pad_10;
  uint tint_pad_11;
  uint tint_pad_12;
  uint tint_pad_13;
  uint tint_pad_14;
  uint tint_pad_15;
  uint tint_pad_16;
  uint tint_pad_17;
  uint tint_pad_18;
  int after;
  uint tint_pad_19;
  uint tint_pad_20;
  uint tint_pad_21;
  uint tint_pad_22;
  uint tint_pad_23;
  uint tint_pad_24;
  uint tint_pad_25;
  uint tint_pad_26;
  uint tint_pad_27;
  uint tint_pad_28;
  uint tint_pad_29;
  uint tint_pad_30;
  uint tint_pad_31;
  uint tint_pad_32;
  uint tint_pad_33;
};

struct S {
  int before;
  mat4x3 m;
  int after;
};

layout(binding = 0, std140)
uniform u_block_std140_1_ubo {
  S_std140 inner[4];
} v;
shared S w[4];
S tint_convert_S(S_std140 tint_input) {
  return S(tint_input.before, mat4x3(tint_input.m_col0, tint_input.m_col1, tint_input.m_col2, tint_input.m_col3), tint_input.after);
}
void f_inner(uint tint_local_index) {
  {
    uint v_1 = 0u;
    v_1 = tint_local_index;
    while(true) {
      uint v_2 = v_1;
      if ((v_2 >= 4u)) {
        break;
      }
      w[v_2] = S(0, mat4x3(vec3(0.0f), vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0);
      {
        v_1 = (v_2 + 1u);
      }
      continue;
    }
  }
  barrier();
  S_std140 v_3[4] = v.inner;
  S v_4[4] = S[4](S(0, mat4x3(vec3(0.0f), vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0), S(0, mat4x3(vec3(0.0f), vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0), S(0, mat4x3(vec3(0.0f), vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0), S(0, mat4x3(vec3(0.0f), vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0));
  {
    uint v_5 = 0u;
    v_5 = 0u;
    while(true) {
      uint v_6 = v_5;
      if ((v_6 >= 4u)) {
        break;
      }
      v_4[v_6] = tint_convert_S(v_3[v_6]);
      {
        v_5 = (v_6 + 1u);
      }
      continue;
    }
  }
  w = v_4;
  w[1] = tint_convert_S(v.inner[2]);
  w[3].m = mat4x3(v.inner[2].m_col0, v.inner[2].m_col1, v.inner[2].m_col2, v.inner[2].m_col3);
  w[1].m[0] = v.inner[0].m_col1.zxy;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f_inner(gl_LocalInvocationIndex);
}
