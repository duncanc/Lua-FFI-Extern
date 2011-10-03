return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLenum = "unsigned int";
    GLint = "int";
    GLfloat = "float";
  };
  typeAliases = {
    ColorTableTarget = "GLenum";
    PixelInternalFormat = "GLenum";
    SizeI = "GLsizei";
    PixelFormat = "GLenum";
    PixelType = "GLenum";
    Void = "GLvoid";
    GetColorTableParameterPName = "GLenum";
    Int32 = "GLint";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    COLOR_INDEX1_EXT = 0x80E2;
    COLOR_INDEX2_EXT = 0x80E3;
    COLOR_INDEX4_EXT = 0x80E4;
    COLOR_INDEX8_EXT = 0x80E5;
    COLOR_INDEX12_EXT = 0x80E6;
    COLOR_INDEX16_EXT = 0x80E7;
    TEXTURE_INDEX_SIZE_EXT = 0x80ED;
  };
  funcs = {
    {'ColorTableEXT';
      'ColorTableTarget', 'target';
      'PixelInternalFormat', 'internalFormat';
      'SizeI', 'width';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'table'};
    {'GetColorTableEXT';
      'ColorTableTarget', 'target';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'Void*', 'data'};
    {'GetColorTableParameterivEXT';
      'ColorTableTarget', 'target';
      'GetColorTableParameterPName', 'pname';
      'Int32*', 'params'};
    {'GetColorTableParameterfvEXT';
      'ColorTableTarget', 'target';
      'GetColorTableParameterPName', 'pname';
      'Float32*', 'params'};
  };
}
