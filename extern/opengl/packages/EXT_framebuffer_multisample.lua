return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
  };
  magicNumbers = {
    RENDERBUFFER_SAMPLES_EXT = 0x8CAB;
    FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT = 0x8D56;
    MAX_SAMPLES_EXT = 0x8D57;
  };
  funcs = {
    {'RenderbufferStorageMultisampleEXT';
      'GLenum', 'target';
      'SizeI', 'samples';
      'GLenum', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height'};
  };
}
