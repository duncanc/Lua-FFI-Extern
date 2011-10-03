return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    ClampColorTargetARB = "GLenum";
    ClampColorModeARB = "GLenum";
  };
  magicNumbers = {
    RGBA_FLOAT_MODE_ARB = 0x8820;
    CLAMP_VERTEX_COLOR_ARB = 0x891A;
    CLAMP_FRAGMENT_COLOR_ARB = 0x891B;
    CLAMP_READ_COLOR_ARB = 0x891C;
    FIXED_ONLY_ARB = 0x891D;
  };
  funcs = {
    {'ClampColorARB';
      'ClampColorTargetARB', 'target';
      'ClampColorModeARB', 'clamp'};
  };
}
