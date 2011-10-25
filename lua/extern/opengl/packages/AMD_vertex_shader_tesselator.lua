return {
  basicTypes = {
    GLfloat = "float";
    GLenum = "unsigned int";
  };
  typeAliases = {
    Float32 = "GLfloat";
  };
  magicNumbers = {
    SAMPLER_BUFFER_AMD = 0x9001;
    INT_SAMPLER_BUFFER_AMD = 0x9002;
    UNSIGNED_INT_SAMPLER_BUFFER_AMD = 0x9003;
    TESSELLATION_MODE_AMD = 0x9004;
    TESSELLATION_FACTOR_AMD = 0x9005;
    DISCRETE_AMD = 0x9006;
    CONTINUOUS_AMD = 0x9007;
  };
  funcs = {
    {'TessellationFactorAMD';
      'Float32', 'factor'};
    {'TessellationModeAMD';
      'GLenum', 'mode'};
  };
}
