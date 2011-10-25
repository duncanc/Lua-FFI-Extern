return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  typeAliases = {
    TextureTarget = "GLenum";
    CheckedInt32 = "GLint";
    SizeI = "GLsizei";
    PixelFormat = "GLenum";
    PixelType = "GLenum";
    Void = "GLvoid";
  };
  magicNumbers = {
    HISTOGRAM_EXT = 0x8024;
    PROXY_HISTOGRAM_EXT = 0x8025;
    HISTOGRAM_WIDTH_EXT = 0x8026;
    HISTOGRAM_FORMAT_EXT = 0x8027;
    HISTOGRAM_RED_SIZE_EXT = 0x8028;
    HISTOGRAM_GREEN_SIZE_EXT = 0x8029;
    HISTOGRAM_BLUE_SIZE_EXT = 0x802A;
    HISTOGRAM_ALPHA_SIZE_EXT = 0x802B;
    HISTOGRAM_LUMINANCE_SIZE_EXT = 0x802C;
    HISTOGRAM_SINK_EXT = 0x802D;
    MINMAX_EXT = 0x802E;
    MINMAX_FORMAT_EXT = 0x802F;
    MINMAX_SINK_EXT = 0x8030;
    TABLE_TOO_LARGE_EXT = 0x8031;
  };
  funcs = {
    {'TexSubImage1DEXT';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'SizeI', 'width';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'pixels'};
    {'TexSubImage2DEXT';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'CheckedInt32', 'yoffset';
      'SizeI', 'width';
      'SizeI', 'height';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'pixels'};
  };
}
