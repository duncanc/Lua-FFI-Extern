return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLint64EXT = "int64_t";
    GLuint64EXT = "uint64_t";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int64EXT = "GLint64EXT";
    UInt64EXT = "GLuint64EXT";
  };
  magicNumbers = {
    TIME_ELAPSED_EXT = 0x88BF;
  };
  funcs = {
    {'GetQueryObjecti64vEXT';
      'UInt32', 'id';
      'GLenum', 'pname';
      'Int64EXT*', 'params'};
    {'GetQueryObjectui64vEXT';
      'UInt32', 'id';
      'GLenum', 'pname';
      'UInt64EXT*', 'params'};
  };
}
