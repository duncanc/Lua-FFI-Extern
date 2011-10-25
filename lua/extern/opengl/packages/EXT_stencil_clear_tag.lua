return {
  basicTypes = {
    GLsizei = "int";
    GLuint = "unsigned int";
  };
  typeAliases = {
    SizeI = "GLsizei";
    UInt32 = "GLuint";
  };
  magicNumbers = {
    STENCIL_TAG_BITS_EXT = 0x88F2;
    STENCIL_CLEAR_TAG_VALUE_EXT = 0x88F3;
  };
  funcs = {
    {'StencilClearTagEXT';
      'SizeI', 'stencilTagBits';
      'UInt32', 'stencilClearTag'};
  };
}
