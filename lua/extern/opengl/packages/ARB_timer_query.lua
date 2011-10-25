return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLint64 = "int64_t";
    GLuint64 = "uint64_t";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int64 = "GLint64";
    UInt64 = "GLuint64";
  };
  magicNumbers = {
    TIME_ELAPSED = 0x88BF;
    TIMESTAMP = 0x8E28;
  };
  funcs = {
    {'QueryCounter';
      'UInt32', 'id';
      'GLenum', 'target'};
    {'GetQueryObjecti64v';
      'UInt32', 'id';
      'GLenum', 'pname';
      'Int64*', 'params'};
    {'GetQueryObjectui64v';
      'UInt32', 'id';
      'GLenum', 'pname';
      'UInt64*', 'params'};
  };
}
