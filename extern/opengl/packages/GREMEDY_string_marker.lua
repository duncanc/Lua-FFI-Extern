return {
  basicTypes = {
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    SizeI = "GLsizei";
    Void = "GLvoid";
  };
  magicNumbers = {
    DEPTH_STENCIL_EXT = 0x84F9;
    UNSIGNED_INT_24_8_EXT = 0x84FA;
    DEPTH24_STENCIL8_EXT = 0x88F0;
    TEXTURE_STENCIL_SIZE_EXT = 0x88F1;
  };
  funcs = {
    {'StringMarkerGREMEDY';
      'SizeI', 'len';
      'const Void*', 'string'};
  };
}
