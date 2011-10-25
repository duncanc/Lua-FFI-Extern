return {
  basicTypes = {
    GLsizei = "int";
    GLvoid = "void";
    GLenum = "unsigned int";
    GLint = "int";
  };
  typeAliases = {
    SizeI = "GLsizei";
    Void = "GLvoid";
    VertexArrayPNameAPPLE = "GLenum";
    Int32 = "GLint";
  };
  magicNumbers = {
    VERTEX_ARRAY_RANGE_APPLE = 0x851D;
    VERTEX_ARRAY_RANGE_LENGTH_APPLE = 0x851E;
    VERTEX_ARRAY_STORAGE_HINT_APPLE = 0x851F;
    VERTEX_ARRAY_RANGE_POINTER_APPLE = 0x8521;
    STORAGE_CLIENT_APPLE = 0x85B4;
    STORAGE_CACHED_APPLE = 0x85BE;
    STORAGE_SHARED_APPLE = 0x85BF;
  };
  funcs = {
    {'VertexArrayRangeAPPLE';
      'SizeI', 'length';
      'Void*', 'pointer'};
    {'FlushVertexArrayRangeAPPLE';
      'SizeI', 'length';
      'Void*', 'pointer'};
    {'VertexArrayParameteriAPPLE';
      'VertexArrayPNameAPPLE', 'pname';
      'Int32', 'param'};
  };
}
