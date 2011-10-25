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
    POINT_SIZE_MIN_ARB = 0x8126;
    POINT_SIZE_MAX_ARB = 0x8127;
    POINT_FADE_THRESHOLD_SIZE_ARB = 0x8128;
    POINT_DISTANCE_ATTENUATION_ARB = 0x8129;
  };
  funcs = {
    {'PointParameterfARB';
      'PointParameterNameARB', 'pname';
      'CheckedFloat32', 'param'};
    {'PointParameterfvARB';
      'PointParameterNameARB', 'pname';
      'const CheckedFloat32*', 'params'};
  };
}
