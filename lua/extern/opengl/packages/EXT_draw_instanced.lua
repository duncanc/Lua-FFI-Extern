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
    Void = "GLvoid";
  };
  magicNumbers = {
    R11F_G11F_B10F_EXT = 0x8C3A;
    UNSIGNED_INT_10F_11F_11F_REV_EXT = 0x8C3B;
    RGBA_SIGNED_COMPONENTS_EXT = 0x8C3C;
  };
  funcs = {
    {'DrawArraysInstancedEXT';
      'BeginMode', 'mode';
      'Int32', 'start';
      'SizeI', 'count';
      'SizeI', 'primcount'};
    {'DrawElementsInstancedEXT';
      'BeginMode', 'mode';
      'SizeI', 'count';
      'DrawElementsType', 'type';
      'const Void*', 'indices';
      'SizeI', 'primcount'};
  };
}
