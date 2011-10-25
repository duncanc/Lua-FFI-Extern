return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  typeAliases = {
    BeginMode = "GLenum";
    Int32 = "GLint";
    SizeI = "GLsizei";
    DrawElementsType = "GLenum";
    VoidPointer = "GLvoid*";
  };
  magicNumbers = {
    FOG_COORDINATE_SOURCE_EXT = 0x8450;
    FOG_COORDINATE_EXT = 0x8451;
    FRAGMENT_DEPTH_EXT = 0x8452;
    CURRENT_FOG_COORDINATE_EXT = 0x8453;
    FOG_COORDINATE_ARRAY_TYPE_EXT = 0x8454;
    FOG_COORDINATE_ARRAY_STRIDE_EXT = 0x8455;
    FOG_COORDINATE_ARRAY_POINTER_EXT = 0x8456;
    FOG_COORDINATE_ARRAY_EXT = 0x8457;
  };
  funcs = {
    {'MultiDrawArraysEXT';
      'BeginMode', 'mode';
      'const Int32*', 'first';
      'const SizeI*', 'count';
      'SizeI', 'primcount'};
    {'MultiDrawElementsEXT';
      'BeginMode', 'mode';
      'const SizeI*', 'count';
      'DrawElementsType', 'type';
      'const VoidPointer*', 'indices';
      'SizeI', 'primcount'};
  };
}
