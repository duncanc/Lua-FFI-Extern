return {
  inherits = {
    require 'extern.opengl.packages.VERSION_3_2';
    require 'extern.opengl.packages.ARB_blend_func_extended';
    require 'extern.opengl.packages.ARB_sampler_objects';
    require 'extern.opengl.packages.ARB_explicit_attrib_location';
    require 'extern.opengl.packages.ARB_occlusion_query2';
    require 'extern.opengl.packages.ARB_shader_bit_encoding';
    require 'extern.opengl.packages.ARB_texture_rgb10_a2ui';
    require 'extern.opengl.packages.ARB_texture_swizzle';
    require 'extern.opengl.packages.ARB_timer_query';
    require 'extern.opengl.packages.ARB_vertex_type_2_10_10_10_rev';
  };
  magicNumbers = {
    VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
    SRC1_COLOR = 0x88F9;
    ONE_MINUS_SRC1_COLOR = 0x88FA;
    ONE_MINUS_SRC1_ALPHA = 0x88FB;
    MAX_DUAL_SOURCE_DRAW_BUFFERS = 0x88FC;
    ANY_SAMPLES_PASSED = 0x8C2F;
    SAMPLER_BINDING = 0x8919;
    RGB10_A2UI = 0x906F;
    TEXTURE_SWIZZLE_R = 0x8E42;
    TEXTURE_SWIZZLE_G = 0x8E43;
    TEXTURE_SWIZZLE_B = 0x8E44;
    TEXTURE_SWIZZLE_A = 0x8E45;
    TEXTURE_SWIZZLE_RGBA = 0x8E46;
    TIME_ELAPSED = 0x88BF;
    TIMESTAMP = 0x8E28;
    INT_2_10_10_10_REV = 0x8D9F;
  };
  funcs = {
    {'VertexAttribDivisor';
      'UInt32', 'index';
      'UInt32', 'divisor'};
  };
}
