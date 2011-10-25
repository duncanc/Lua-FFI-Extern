return {
  basicTypes = {
    GLenum = "unsigned int";
    GLfloat = "float";
  };
  typeAliases = {
    PointParameterNameARB = "GLenum";
    CheckedFloat32 = "GLfloat";
  };
  magicNumbers = {
    POINT_SIZE_MIN_EXT = 0x8126;
    POINT_SIZE_MAX_EXT = 0x8127;
    POINT_FADE_THRESHOLD_SIZE_EXT = 0x8128;
    DISTANCE_ATTENUATION_EXT = 0x8129;
  };
  funcs = {
    {'PointParameterfEXT';
      'PointParameterNameARB', 'pname';
      'CheckedFloat32', 'param'};
    {'PointParameterfvEXT';
      'PointParameterNameARB', 'pname';
      'const CheckedFloat32*', 'params'};
  };
}
