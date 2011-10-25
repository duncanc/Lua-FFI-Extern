return {
  basicTypes = {
    GLuint = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLenum = "unsigned int";
    GLint = "int";
  };
  typeAliases = {
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    Void = "GLvoid";
    ProgramParameterPName = "GLenum";
    Int32 = "GLint";
  };
  magicNumbers = {
    PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257;
    PROGRAM_BINARY_LENGTH = 0x8741;
    NUM_PROGRAM_BINARY_FORMATS = 0x87FE;
    PROGRAM_BINARY_FORMATS = 0x87FF;
  };
  funcs = {
    {'GetProgramBinary';
      'UInt32', 'program';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'GLenum*', 'binaryFormat';
      'Void*', 'binary'};
    {'ProgramBinary';
      'UInt32', 'program';
      'GLenum', 'binaryFormat';
      'const Void*', 'binary';
      'SizeI', 'length'};
    {'ProgramParameteri';
      'UInt32', 'program';
      'ProgramParameterPName', 'pname';
      'Int32', 'value'};
  };
}
