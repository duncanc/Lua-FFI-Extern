return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLsizei = "int";
    GLfloat = "float";
  };
  typeAliases = {
    ProgramTargetARB = "GLenum";
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    BUFFER_SERIALIZED_MODIFY_APPLE = 0x8A12;
    BUFFER_FLUSHING_UNMAP_APPLE = 0x8A13;
  };
  funcs = {
    {'ProgramEnvParameters4fvEXT';
      'ProgramTargetARB', 'target';
      'UInt32', 'index';
      'SizeI', 'count';
      'const Float32*', 'params'};
    {'ProgramLocalParameters4fvEXT';
      'ProgramTargetARB', 'target';
      'UInt32', 'index';
      'SizeI', 'count';
      'const Float32*', 'params'};
  };
}
