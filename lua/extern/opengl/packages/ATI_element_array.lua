return {
  basicTypes = {
    GLenum = "unsigned int";
    GLvoid = "void";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLuint = "unsigned int";
  };
  typeAliases = {
    ElementPointerTypeATI = "GLenum";
    Void = "GLvoid";
    BeginMode = "GLenum";
    SizeI = "GLsizei";
    UInt32 = "GLuint";
  };
  magicNumbers = {
    ELEMENT_ARRAY_ATI = 0x8768;
    ELEMENT_ARRAY_TYPE_ATI = 0x8769;
    ELEMENT_ARRAY_POINTER_ATI = 0x876A;
  };
  funcs = {
    {'ElementPointerATI';
      'ElementPointerTypeATI', 'type';
      'const Void*', 'pointer'};
    {'DrawElementArrayATI';
      'BeginMode', 'mode';
      'SizeI', 'count'};
    {'DrawRangeElementArrayATI';
      'BeginMode', 'mode';
      'UInt32', 'start';
      'UInt32', 'end';
      'SizeI', 'count'};
  };
}
