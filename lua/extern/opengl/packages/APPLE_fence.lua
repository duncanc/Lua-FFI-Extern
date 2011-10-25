return {
  basicTypes = {
    GLsizei = "int";
    GLuint = "unsigned int";
    GLboolean = "unsigned char";
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLint = "int";
  };
  typeAliases = {
    SizeI = "GLsizei";
    FenceNV = "GLuint";
    Boolean = "GLboolean";
    ObjectTypeAPPLE = "GLenum";
    UInt32 = "GLuint";
    Int32 = "GLint";
  };
  magicNumbers = {
    DRAW_PIXELS_APPLE = 0x8A0A;
    FENCE_APPLE = 0x8A0B;
  };
  funcs = {
    {'GenFencesAPPLE';
      'SizeI', 'n';
      'FenceNV*', 'fences'};
    {'DeleteFencesAPPLE';
      'SizeI', 'n';
      'const FenceNV*', 'fences'};
    {'SetFenceAPPLE';
      'FenceNV', 'fence'};
    {'IsFenceAPPLE', ret='Boolean';
      'FenceNV', 'fence'};
    {'TestFenceAPPLE', ret='Boolean';
      'FenceNV', 'fence'};
    {'FinishFenceAPPLE';
      'FenceNV', 'fence'};
    {'TestObjectAPPLE', ret='Boolean';
      'ObjectTypeAPPLE', 'object';
      'UInt32', 'name'};
    {'FinishObjectAPPLE';
      'ObjectTypeAPPLE', 'object';
      'Int32', 'name'};
  };
}
