return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLint = "int";
    GLsizei = "int";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int32 = "GLint";
    SizeI = "GLsizei";
  };
  magicNumbers = {
    ACTIVE_PROGRAM_EXT = 0x8B8D;
  };
  funcs = {
    {'CopyImageSubDataNV';
      'UInt32', 'srcName';
      'GLenum', 'srcTarget';
      'Int32', 'srcLevel';
      'Int32', 'srcX';
      'Int32', 'srcY';
      'Int32', 'srcZ';
      'UInt32', 'dstName';
      'GLenum', 'dstTarget';
      'Int32', 'dstLevel';
      'Int32', 'dstX';
      'Int32', 'dstY';
      'Int32', 'dstZ';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth'};
  };
}
