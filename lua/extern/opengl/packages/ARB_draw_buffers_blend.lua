return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    UInt32 = "GLuint";
  };
  magicNumbers = {
    SAMPLE_SHADING_ARB = 0x8C36;
    MIN_SAMPLE_SHADING_VALUE_ARB = 0x8C37;
  };
  funcs = {
    {'BlendEquationiARB';
      'UInt32', 'buf';
      'GLenum', 'mode'};
    {'BlendEquationSeparateiARB';
      'UInt32', 'buf';
      'GLenum', 'modeRGB';
      'GLenum', 'modeAlpha'};
    {'BlendFunciARB';
      'UInt32', 'buf';
      'GLenum', 'src';
      'GLenum', 'dst'};
    {'BlendFuncSeparateiARB';
      'UInt32', 'buf';
      'GLenum', 'srcRGB';
      'GLenum', 'dstRGB';
      'GLenum', 'srcAlpha';
      'GLenum', 'dstAlpha'};
  };
}
