return {
  inherits = {
    require 'extern.opengl.packages.VERSION_3_0';
    require 'extern.opengl.packages.ARB_copy_buffer';
    require 'extern.opengl.packages.ARB_uniform_buffer_object';
  };
  magicNumbers = {
    SAMPLER_2D_RECT = 0x8B63;
    SAMPLER_2D_RECT_SHADOW = 0x8B64;
    SAMPLER_BUFFER = 0x8DC2;
    INT_SAMPLER_2D_RECT = 0x8DCD;
    INT_SAMPLER_BUFFER = 0x8DD0;
    UNSIGNED_INT_SAMPLER_2D_RECT = 0x8DD5;
    UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8;
    TEXTURE_BUFFER = 0x8C2A;
    MAX_TEXTURE_BUFFER_SIZE = 0x8C2B;
    TEXTURE_BINDING_BUFFER = 0x8C2C;
    TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D;
    TEXTURE_BUFFER_FORMAT = 0x8C2E;
    TEXTURE_RECTANGLE = 0x84F5;
    TEXTURE_BINDING_RECTANGLE = 0x84F6;
    PROXY_TEXTURE_RECTANGLE = 0x84F7;
    MAX_RECTANGLE_TEXTURE_SIZE = 0x84F8;
    RED_SNORM = 0x8F90;
    RG_SNORM = 0x8F91;
    RGB_SNORM = 0x8F92;
    RGBA_SNORM = 0x8F93;
    R8_SNORM = 0x8F94;
    RG8_SNORM = 0x8F95;
    RGB8_SNORM = 0x8F96;
    RGBA8_SNORM = 0x8F97;
    R16_SNORM = 0x8F98;
    RG16_SNORM = 0x8F99;
    RGB16_SNORM = 0x8F9A;
    RGBA16_SNORM = 0x8F9B;
    SIGNED_NORMALIZED = 0x8F9C;
    PRIMITIVE_RESTART = 0x8F9D;
    PRIMITIVE_RESTART_INDEX = 0x8F9E;
    COPY_READ_BUFFER = 0x8F36;
    COPY_WRITE_BUFFER = 0x8F37;
    UNIFORM_BUFFER = 0x8A11;
    UNIFORM_BUFFER_BINDING = 0x8A28;
    UNIFORM_BUFFER_START = 0x8A29;
    UNIFORM_BUFFER_SIZE = 0x8A2A;
    MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
    MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
    MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
    MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
    MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
    MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
    MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
    UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
    ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35;
    ACTIVE_UNIFORM_BLOCKS = 0x8A36;
    UNIFORM_TYPE = 0x8A37;
    UNIFORM_SIZE = 0x8A38;
    UNIFORM_NAME_LENGTH = 0x8A39;
    UNIFORM_BLOCK_INDEX = 0x8A3A;
    UNIFORM_OFFSET = 0x8A3B;
    UNIFORM_ARRAY_STRIDE = 0x8A3C;
    UNIFORM_MATRIX_STRIDE = 0x8A3D;
    UNIFORM_IS_ROW_MAJOR = 0x8A3E;
    UNIFORM_BLOCK_BINDING = 0x8A3F;
    UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
    UNIFORM_BLOCK_NAME_LENGTH = 0x8A41;
    UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
    UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
    UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
    UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
    INVALID_INDEX = 0xFFFFFFFF;
  };
  funcs = {
    {'DrawArraysInstanced';
      'BeginMode', 'mode';
      'Int32', 'first';
      'SizeI', 'count';
      'SizeI', 'primcount'};
    {'DrawElementsInstanced';
      'BeginMode', 'mode';
      'SizeI', 'count';
      'DrawElementsType', 'type';
      'const Void*', 'indices';
      'SizeI', 'primcount'};
    {'TexBuffer';
      'TextureTarget', 'target';
      'GLenum', 'internalformat';
      'UInt32', 'buffer'};
    {'PrimitiveRestartIndex';
      'UInt32', 'index'};
  };
}