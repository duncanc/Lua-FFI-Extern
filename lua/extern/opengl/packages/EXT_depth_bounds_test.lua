return {
  basicTypes = {
    GLclampd = "double";
  };
  typeAliases = {
    ClampedFloat64 = "GLclampd";
  };
  magicNumbers = {
    DEPTH_BOUNDS_TEST_EXT = 0x8890;
    DEPTH_BOUNDS_EXT = 0x8891;
  };
  funcs = {
    {'DepthBoundsEXT';
      'ClampedFloat64', 'zmin';
      'ClampedFloat64', 'zmax'};
  };
}
