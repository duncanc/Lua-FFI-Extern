return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    RenderbufferTarget = "GLenum";
    SizeI = "GLsizei";
    PixelInternalFormat = "GLenum";
  };
  magicNumbers = {
    RENDERBUFFER_COVERAGE_SAMPLES_NV = 0x8CAB;
    RENDERBUFFER_COLOR_SAMPLES_NV = 0x8E10;
    MAX_MULTISAMPLE_COVERAGE_MODES_NV = 0x8E11;
    MULTISAMPLE_COVERAGE_MODES_NV = 0x8E12;
  };
  funcs = {
    {'RenderbufferStorageMultisampleCoverageNV';
      'RenderbufferTarget', 'target';
      'SizeI', 'coverageSamples';
      'SizeI', 'colorSamples';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height'};
  };
}
