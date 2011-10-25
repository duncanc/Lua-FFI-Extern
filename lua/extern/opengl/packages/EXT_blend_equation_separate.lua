return {
  basicTypes = {
    GLenum = "unsigned int";
  };
  typeAliases = {
    BlendEquationModeEXT = "GLenum";
  };
  magicNumbers = {
    BLEND_EQUATION_RGB_EXT = 0x8009;
    BLEND_EQUATION_ALPHA_EXT = 0x883D;
  };
  funcs = {
    {'BlendEquationSeparateEXT';
      'BlendEquationModeEXT', 'modeRGB';
      'BlendEquationModeEXT', 'modeAlpha'};
  };
}
