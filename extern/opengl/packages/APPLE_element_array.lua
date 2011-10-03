return {
  basicTypes = {
    GLenum = "unsigned int";
    GLvoid = "void";
    GLenum = "unsigned int";
    GLint = "int";
    GLsizei = "int";
    GLuint = "unsigned int";
  };
  typeAliases = {
    ElementPointerTypeATI = "GLenum";
    Void = "GLvoid";
    BeginMode = "GLenum";
    Int32 = "GLint";
    SizeI = "GLsizei";
    UInt32 = "GLuint";
  };
  magicNumbers = {
    ELEMENT_ARRAY_APPLE = 0x8A0C;
    ELEMENT_ARRAY_TYPE_APPLE = 0x8A0D;
    ELEMENT_ARRAY_POINTER_APPLE = 0x8A0E;
  };
  funcs = {
    {'ElementPointerAPPLE';
      'ElementPointerTypeATI', 'type';
      'const Void*', 'pointer'};
    {'DrawElementArrayAPPLE';
      'BeginMode', 'mode';
      'Int32', 'first';
      'SizeI', 'count'};
    {'DrawRangeElementArrayAPPLE';
      'BeginMode', 'mode';
      'UInt32', 'start';
      'UInt32', 'end';
      'Int32', 'first';
      'SizeI', 'count'};
    {'MultiDrawElementArrayAPPLE';
      'BeginMode', 'mode';
      'const Int32*', 'first';
      'const SizeI*', 'count';
      'SizeI', 'primcount'};
    {'MultiDrawRangeElementArrayAPPLE';
      'BeginMode', 'mode';
      'UInt32', 'start';
      'UInt32', 'end';
      'const Int32*', 'first';
      'const SizeI*', 'count';
      'SizeI', 'primcount'};
  };
}
