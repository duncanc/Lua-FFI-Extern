return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLenum = "unsigned int";
    GLfloat = "float";
    GLint = "int";
    GLint = "int";
    GLenum = "unsigned int";
    GLfloat = "float";
    GLint = "int";
  };
  typeAliases = {
    ColorTableTargetSGI = "GLenum";
    PixelInternalFormat = "GLenum";
    SizeI = "GLsizei";
    PixelFormat = "GLenum";
    PixelType = "GLenum";
    Void = "GLvoid";
    ColorTableParameterPNameSGI = "GLenum";
    CheckedFloat32 = "GLfloat";
    CheckedInt32 = "GLint";
    WinCoord = "GLint";
    GetColorTableParameterPNameSGI = "GLenum";
    Float32 = "GLfloat";
    Int32 = "GLint";
  };
  magicNumbers = {
    COLOR_TABLE_SGI = 0x80D0;
    POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D1;
    POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D2;
    PROXY_COLOR_TABLE_SGI = 0x80D3;
    PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D4;
    PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D5;
    COLOR_TABLE_SCALE_SGI = 0x80D6;
    COLOR_TABLE_BIAS_SGI = 0x80D7;
    COLOR_TABLE_FORMAT_SGI = 0x80D8;
    COLOR_TABLE_WIDTH_SGI = 0x80D9;
    COLOR_TABLE_RED_SIZE_SGI = 0x80DA;
    COLOR_TABLE_GREEN_SIZE_SGI = 0x80DB;
    COLOR_TABLE_BLUE_SIZE_SGI = 0x80DC;
    COLOR_TABLE_ALPHA_SIZE_SGI = 0x80DD;
    COLOR_TABLE_LUMINANCE_SIZE_SGI = 0x80DE;
    COLOR_TABLE_INTENSITY_SIZE_SGI = 0x80DF;
  };
  funcs = {
    {'ColorTableSGI';
      'ColorTableTargetSGI', 'target';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'table'};
    {'ColorTableParameterfvSGI';
      'ColorTableTargetSGI', 'target';
      'ColorTableParameterPNameSGI', 'pname';
      'const CheckedFloat32*', 'params'};
    {'ColorTableParameterivSGI';
      'ColorTableTargetSGI', 'target';
      'ColorTableParameterPNameSGI', 'pname';
      'const CheckedInt32*', 'params'};
    {'CopyColorTableSGI';
      'ColorTableTargetSGI', 'target';
      'PixelInternalFormat', 'internalformat';
      'WinCoord', 'x';
      'WinCoord', 'y';
      'SizeI', 'width'};
    {'GetColorTableSGI';
      'ColorTableTargetSGI', 'target';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'Void*', 'table'};
    {'GetColorTableParameterfvSGI';
      'ColorTableTargetSGI', 'target';
      'GetColorTableParameterPNameSGI', 'pname';
      'Float32*', 'params'};
    {'GetColorTableParameterivSGI';
      'ColorTableTargetSGI', 'target';
      'GetColorTableParameterPNameSGI', 'pname';
      'Int32*', 'params'};
  };
}
