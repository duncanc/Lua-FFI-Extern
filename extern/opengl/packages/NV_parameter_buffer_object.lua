return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLsizei = "int";
    GLfloat = "float";
    GLint = "int";
  };
  typeAliases = {
    ProgramTarget = "GLenum";
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    Float32 = "GLfloat";
    Int32 = "GLint";
  };
  magicNumbers = {
    MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV = 0x8DA0;
    MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV = 0x8DA1;
    VERTEX_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA2;
    GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA3;
    FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA4;
  };
  funcs = {
    {'ProgramBufferParametersfvNV';
      'ProgramTarget', 'target';
      'UInt32', 'buffer';
      'UInt32', 'index';
      'SizeI', 'count';
      'const Float32*', 'params'};
    {'ProgramBufferParametersIivNV';
      'ProgramTarget', 'target';
      'UInt32', 'buffer';
      'UInt32', 'index';
      'SizeI', 'count';
      'const Int32*', 'params'};
    {'ProgramBufferParametersIuivNV';
      'ProgramTarget', 'target';
      'UInt32', 'buffer';
      'UInt32', 'index';
      'SizeI', 'count';
      'const UInt32*', 'params'};
  };
}
