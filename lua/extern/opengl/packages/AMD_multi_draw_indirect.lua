return {
  basicTypes = {
    GLenum = "unsigned int";
    GLvoid = "void";
    GLsizei = "int";
  };
  funcs = {
    {'MultiDrawArraysIndirectAMD';
      'GLenum', 'mode';
      'const Void*', 'indirect';
      'SizeI', 'primcount';
      'SizeI', 'stride'};
    {'MultiDrawElementsIndirectAMD';
      'GLenum', 'mode';
      'GLenum', 'type';
      'const Void*', 'indirect';
      'SizeI', 'primcount';
      'SizeI', 'stride'};
  };
}
