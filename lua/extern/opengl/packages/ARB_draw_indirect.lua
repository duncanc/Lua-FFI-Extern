return {
  basicTypes = {
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  magicNumbers = {
    DRAW_INDIRECT_BUFFER = 0x8F3F;
    DRAW_INDIRECT_BUFFER_BINDING = 0x8F43;
  };
  funcs = {
    {'DrawArraysIndirect';
      'GLenum', 'mode';
      'const Void*', 'indirect'};
    {'DrawElementsIndirect';
      'GLenum', 'mode';
      'GLenum', 'type';
      'const Void*', 'indirect'};
  };
}
