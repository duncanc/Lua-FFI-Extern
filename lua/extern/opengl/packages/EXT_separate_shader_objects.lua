return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLchar = "char";
  };
  magicNumbers = {
    ACTIVE_PROGRAM_EXT = 0x8B8D;
  };
  funcs = {
    {'UseShaderProgramEXT';
      'GLenum', 'type';
      'UInt32', 'program'};
    {'ActiveProgramEXT';
      'UInt32', 'program'};
    {'CreateShaderProgramEXT', ret='UInt32';
      'GLenum', 'type';
      'const Char*', 'string'};
  };
}
