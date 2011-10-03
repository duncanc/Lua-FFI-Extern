return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLfloat = "float";
  };
  magicNumbers = {
    SUBSAMPLE_DISTANCE_AMD = 0x883F;
  };
  funcs = {
    {'SetMultisamplefvAMD';
      'GLenum', 'pname';
      'UInt32', 'index';
      'const Float32*', 'val'};
  };
}
