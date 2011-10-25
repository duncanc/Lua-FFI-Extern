return {
  basicTypes = {
    GLclampf = "float";
  };
  typeAliases = {
    ClampedColorF = "GLclampf";
  };
  magicNumbers = {
    CONSTANT_COLOR_EXT = 0x8001;
    ONE_MINUS_CONSTANT_COLOR_EXT = 0x8002;
    CONSTANT_ALPHA_EXT = 0x8003;
    ONE_MINUS_CONSTANT_ALPHA_EXT = 0x8004;
    BLEND_COLOR_EXT = 0x8005;
  };
  funcs = {
    {'BlendColorEXT';
      'ClampedColorF', 'red';
      'ClampedColorF', 'green';
      'ClampedColorF', 'blue';
      'ClampedColorF', 'alpha'};
  };
}
