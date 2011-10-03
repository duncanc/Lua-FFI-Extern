return {
  basicTypes = {
    GLsizei = "int";
    GLuint = "unsigned int";
    GLboolean = "unsigned char";
    GLenum = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    SizeI = "GLsizei";
    FenceNV = "GLuint";
    Boolean = "GLboolean";
    FenceParameterNameNV = "GLenum";
    Int32 = "GLint";
    FenceConditionNV = "GLenum";
  };
  magicNumbers = {
    ALL_COMPLETED_NV = 0x84F2;
    FENCE_STATUS_NV = 0x84F3;
    FENCE_CONDITION_NV = 0x84F4;
  };
  funcs = {
    {'DeleteFencesNV';
      'SizeI', 'n';
      'const FenceNV*', 'fences'};
    {'GenFencesNV';
      'SizeI', 'n';
      'FenceNV*', 'fences'};
    {'IsFenceNV', ret='Boolean';
      'FenceNV', 'fence'};
    {'TestFenceNV', ret='Boolean';
      'FenceNV', 'fence'};
    {'GetFenceivNV';
      'FenceNV', 'fence';
      'FenceParameterNameNV', 'pname';
      'Int32*', 'params'};
    {'FinishFenceNV';
      'FenceNV', 'fence'};
    {'SetFenceNV';
      'FenceNV', 'fence';
      'FenceConditionNV', 'condition'};
  };
}
