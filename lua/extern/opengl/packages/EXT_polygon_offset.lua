return {
  basicTypes = {
    GLfloat = "float";
  };
  typeAliases = {
    Float32 = "GLfloat";
  };
  magicNumbers = {
    POLYGON_OFFSET_EXT = 0x8037;
    POLYGON_OFFSET_FACTOR_EXT = 0x8038;
    POLYGON_OFFSET_BIAS_EXT = 0x8039;
  };
  funcs = {
    {'PolygonOffsetEXT';
      'Float32', 'factor';
      'Float32', 'bias'};
  };
}
