return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    UInt32 = "GLuint";
  };
  magicNumbers = {
    TEXTURE_RANGE_LENGTH_APPLE = 0x85B7;
    TEXTURE_RANGE_POINTER_APPLE = 0x85B8;
    TEXTURE_STORAGE_HINT_APPLE = 0x85BC;
    STORAGE_PRIVATE_APPLE = 0x85BD;
    STORAGE_CACHED_APPLE = 0x85BE;
    STORAGE_SHARED_APPLE = 0x85BF;
  };
  funcs = {
    {'BlendFuncIndexedAMD';
      'UInt32', 'buf';
      'GLenum', 'src';
      'GLenum', 'dst'};
    {'BlendFuncSeparateIndexedAMD';
      'UInt32', 'buf';
      'GLenum', 'srcRGB';
      'GLenum', 'dstRGB';
      'GLenum', 'srcAlpha';
      'GLenum', 'dstAlpha'};
    {'BlendEquationIndexedAMD';
      'UInt32', 'buf';
      'GLenum', 'mode'};
    {'BlendEquationSeparateIndexedAMD';
      'UInt32', 'buf';
      'GLenum', 'modeRGB';
      'GLenum', 'modeAlpha'};
  };
}
