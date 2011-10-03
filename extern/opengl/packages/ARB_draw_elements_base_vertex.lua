return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLint = "int";
    GLuint = "unsigned int";
    GLvoid = "void";
  };
  magicNumbers = {
    QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C;
    FIRST_VERTEX_CONVENTION = 0x8E4D;
    LAST_VERTEX_CONVENTION = 0x8E4E;
    PROVOKING_VERTEX = 0x8E4F;
  };
  funcs = {
    {'DrawElementsBaseVertex';
      'GLenum', 'mode';
      'SizeI', 'count';
      'DrawElementsType', 'type';
      'const Void*', 'indices';
      'Int32', 'basevertex'};
    {'DrawRangeElementsBaseVertex';
      'GLenum', 'mode';
      'UInt32', 'start';
      'UInt32', 'end';
      'SizeI', 'count';
      'DrawElementsType', 'type';
      'const Void*', 'indices';
      'Int32', 'basevertex'};
    {'DrawElementsInstancedBaseVertex';
      'GLenum', 'mode';
      'SizeI', 'count';
      'DrawElementsType', 'type';
      'const Void*', 'indices';
      'SizeI', 'primcount';
      'Int32', 'basevertex'};
    {'MultiDrawElementsBaseVertex';
      'GLenum', 'mode';
      'const SizeI*', 'count';
      'DrawElementsType', 'type';
      'const VoidPointer*', 'indices';
      'SizeI', 'primcount';
      'const Int32*', 'basevertex'};
  };
}
