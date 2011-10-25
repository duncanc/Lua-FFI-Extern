return {
  basicTypes = {
    GLenum = "unsigned int";
  };
  typeAliases = {
    BlendEquationModeEXT = "GLenum";
  };
  magicNumbers = {
    FUNC_ADD_EXT = 0x8006;
    MIN_EXT = 0x8007;
    MAX_EXT = 0x8008;
    BLEND_EQUATION_EXT = 0x8009;
  };
  funcs = {
    {'BlendEquationEXT';
      'BlendEquationModeEXT', 'mode'};
  };
}
