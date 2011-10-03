return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  typeAliases = {
    BeginMode = "GLenum";
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    DrawElementsType = "GLenum";
    Void = "GLvoid";
  };
  magicNumbers = {
    MAX_ELEMENTS_VERTICES_EXT = 0x80E8;
    MAX_ELEMENTS_INDICES_EXT = 0x80E9;
  };
  funcs = {
    {'DrawRangeElementsEXT';
      'BeginMode', 'mode';
      'UInt32', 'start';
      'UInt32', 'end';
      'SizeI', 'count';
      'DrawElementsType', 'type';
      'const Void*', 'indices'};
  };
}
