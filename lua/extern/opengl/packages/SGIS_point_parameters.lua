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
    POINT_SIZE_MIN_SGIS = 0x8126;
    POINT_SIZE_MAX_SGIS = 0x8127;
    POINT_FADE_THRESHOLD_SIZE_SGIS = 0x8128;
    DISTANCE_ATTENUATION_SGIS = 0x8129;
  };
  funcs = {
    {'PointParameterfSGIS';
      'PointParameterNameARB', 'pname';
      'CheckedFloat32', 'param'};
    {'PointParameterfvSGIS';
      'PointParameterNameARB', 'pname';
      'const CheckedFloat32*', 'params'};
  };
}
