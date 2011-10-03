return {
  basicTypes = {
    GLuint = "unsigned int";
    GLint = "int";
    GLintptr = "ptrdiff_t";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int32 = "GLint";
    BufferOffset = "GLintptr";
  };
  magicNumbers = {
    MAX_VERTEX_BINDABLE_UNIFORMS_EXT = 0x8DE2;
    MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT = 0x8DE3;
    MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT = 0x8DE4;
    MAX_BINDABLE_UNIFORM_SIZE_EXT = 0x8DED;
    UNIFORM_BUFFER_EXT = 0x8DEE;
    UNIFORM_BUFFER_BINDING_EXT = 0x8DEF;
  };
  funcs = {
    {'UniformBufferEXT';
      'UInt32', 'program';
      'Int32', 'location';
      'UInt32', 'buffer'};
    {'GetUniformBufferSizeEXT', ret='Int32';
      'UInt32', 'program';
      'Int32', 'location'};
    {'GetUniformOffsetEXT', ret='BufferOffset';
      'UInt32', 'program';
      'Int32', 'location'};
  };
}
