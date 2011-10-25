return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLuint = "unsigned int";
  };
  magicNumbers = {
    MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV = 0x8E5A;
    MIN_FRAGMENT_INTERPOLATION_OFFSET_NV = 0x8E5B;
    MAX_FRAGMENT_INTERPOLATION_OFFSET_NV = 0x8E5C;
    FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV = 0x8E5D;
    MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV = 0x8E5E;
    MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV = 0x8E5F;
    MAX_PROGRAM_SUBROUTINE_PARAMETERS_NV = 0x8F44;
    MAX_PROGRAM_SUBROUTINE_NUM_NV = 0x8F45;
  };
  funcs = {
    {'ProgramSubroutineParametersuivNV';
      'GLenum', 'target';
      'SizeI', 'count';
      'const UInt32*', 'params'};
    {'GetProgramSubroutineParameteruivNV';
      'GLenum', 'target';
      'UInt32', 'index';
      'UInt32*', 'param'};
  };
}
