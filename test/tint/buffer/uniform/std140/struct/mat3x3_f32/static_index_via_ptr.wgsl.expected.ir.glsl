#version 310 es


struct Inner_std140 {
  vec3 m_col0;
  uint tint_pad_0;
  vec3 m_col1;
  uint tint_pad_1;
  vec3 m_col2;
  uint tint_pad_2;
  uint tint_pad_3;
  uint tint_pad_4;
  uint tint_pad_5;
  uint tint_pad_6;
};

struct Outer_std140 {
  Inner_std140 a[4];
};

struct Inner {
  mat3 m;
};

struct Outer {
  Inner a[4];
};

layout(binding = 0, std140)
uniform a_block_std140_1_ubo {
  Outer_std140 inner[4];
} v;
Inner tint_convert_Inner(Inner_std140 tint_input) {
  return Inner(mat3(tint_input.m_col0, tint_input.m_col1, tint_input.m_col2));
}
Outer tint_convert_Outer(Outer_std140 tint_input) {
  Inner v_1[4] = Inner[4](Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))));
  {
    uint v_2 = 0u;
    v_2 = 0u;
    while(true) {
      uint v_3 = v_2;
      if ((v_3 >= 4u)) {
        break;
      }
      v_1[v_3] = tint_convert_Inner(tint_input.a[v_3]);
      {
        v_2 = (v_3 + 1u);
      }
      continue;
    }
  }
  return Outer(v_1);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat3 v_4 = mat3(v.inner[3].a[2].m_col0, v.inner[3].a[2].m_col1, v.inner[3].a[2].m_col2);
  Outer_std140 v_5[4] = v.inner;
  Outer v_6[4] = Outer[4](Outer(Inner[4](Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))))), Outer(Inner[4](Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))))), Outer(Inner[4](Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))))), Outer(Inner[4](Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))))));
  {
    uint v_7 = 0u;
    v_7 = 0u;
    while(true) {
      uint v_8 = v_7;
      if ((v_8 >= 4u)) {
        break;
      }
      v_6[v_8] = tint_convert_Outer(v_5[v_8]);
      {
        v_7 = (v_8 + 1u);
      }
      continue;
    }
  }
  Outer l_a[4] = v_6;
  Outer l_a_3 = tint_convert_Outer(v.inner[3]);
  Inner_std140 v_9[4] = v.inner[3].a;
  Inner v_10[4] = Inner[4](Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))), Inner(mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f))));
  {
    uint v_11 = 0u;
    v_11 = 0u;
    while(true) {
      uint v_12 = v_11;
      if ((v_12 >= 4u)) {
        break;
      }
      v_10[v_12] = tint_convert_Inner(v_9[v_12]);
      {
        v_11 = (v_12 + 1u);
      }
      continue;
    }
  }
  Inner l_a_3_a[4] = v_10;
  Inner l_a_3_a_2 = tint_convert_Inner(v.inner[3].a[2]);
  mat3 l_a_3_a_2_m = v_4;
  vec3 l_a_3_a_2_m_1 = v_4[1];
  float l_a_3_a_2_m_1_0 = v_4[1][0];
}
