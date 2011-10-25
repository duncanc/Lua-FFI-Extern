return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLfloat = "float";
    GLfloat = "float";
  };
  typeAliases = {
    CombinerStageNV = "GLenum";
    CombinerParameterNV = "GLenum";
    CheckedFloat32 = "GLfloat";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    PER_STAGE_CONSTANTS_NV = 0x8535;
  };
  funcs = {
    {'CombinerStageParameterfvNV';
      'CombinerStageNV', 'stage';
      'CombinerParameterNV', 'pname';
      'const CheckedFloat32*', 'params'};
    {'GetCombinerStageParameterfvNV';
      'CombinerStageNV', 'stage';
      'CombinerParameterNV', 'pname';
      'Float32*', 'params'};
  };
}
