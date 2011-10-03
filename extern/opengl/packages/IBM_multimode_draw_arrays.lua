return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLsizei = "int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    BeginMode = "GLenum";
    Int32 = "GLint";
    SizeI = "GLsizei";
    DrawElementsType = "GLenum";
    ConstVoidPointer = "GLvoid* const";
  };
  magicNumbers = {
    VERTEX_ARRAY_LIST_IBM = 103070;
    NORMAL_ARRAY_LIST_IBM = 103071;
    COLOR_ARRAY_LIST_IBM = 103072;
    INDEX_ARRAY_LIST_IBM = 103073;
    TEXTURE_COORD_ARRAY_LIST_IBM = 103074;
    EDGE_FLAG_ARRAY_LIST_IBM = 103075;
    FOG_COORDINATE_ARRAY_LIST_IBM = 103076;
    SECONDARY_COLOR_ARRAY_LIST_IBM = 103077;
    VERTEX_ARRAY_LIST_STRIDE_IBM = 103080;
    NORMAL_ARRAY_LIST_STRIDE_IBM = 103081;
    COLOR_ARRAY_LIST_STRIDE_IBM = 103082;
    INDEX_ARRAY_LIST_STRIDE_IBM = 103083;
    TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM = 103084;
    EDGE_FLAG_ARRAY_LIST_STRIDE_IBM = 103085;
    FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM = 103086;
    SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM = 103087;
  };
  funcs = {
    {'MultiModeDrawArraysIBM';
      'const BeginMode*', 'mode';
      'const Int32*', 'first';
      'const SizeI*', 'count';
      'SizeI', 'primcount';
      'Int32', 'modestride'};
    {'MultiModeDrawElementsIBM';
      'const BeginMode*', 'mode';
      'const SizeI*', 'count';
      'DrawElementsType', 'type';
      'const ConstVoidPointer*', 'indices';
      'SizeI', 'primcount';
      'Int32', 'modestride'};
  };
}
