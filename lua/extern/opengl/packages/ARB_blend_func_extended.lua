return {
  basicTypes = {
    GLuint = "unsigned int";
    GLchar = "char";
    GLint = "int";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Char = "GLchar";
    Int32 = "GLint";
  };
  magicNumbers = {
    SRC1_COLOR = 0x88F9;
    SRC1_ALPHA = 0x8589;
    ONE_MINUS_SRC1_COLOR = 0x88FA;
    ONE_MINUS_SRC1_ALPHA = 0x88FB;
    MAX_DUAL_SOURCE_DRAW_BUFFERS = 0x88FC;
  };
  funcs = {
    {'BindFragDataLocationIndexed';
      'UInt32', 'program';
      'UInt32', 'colorNumber';
      'UInt32', 'index';
      'const Char*', 'name'};
    {'GetFragDataIndex', ret='Int32';
      'UInt32', 'program';
      'const Char*', 'name'};
  };
}
