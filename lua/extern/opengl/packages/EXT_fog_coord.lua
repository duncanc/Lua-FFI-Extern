return {
  basicTypes = {
    GLfloat = "float";
    GLdouble = "double";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    CoordF = "GLfloat";
    CoordD = "GLdouble";
    FogPointerTypeEXT = "GLenum";
    SizeI = "GLsizei";
    Void = "GLvoid";
  };
  magicNumbers = {
    FOG_COORDINATE_SOURCE_EXT = 0x8450;
    FOG_COORDINATE_EXT = 0x8451;
    FRAGMENT_DEPTH_EXT = 0x8452;
    CURRENT_FOG_COORDINATE_EXT = 0x8453;
    FOG_COORDINATE_ARRAY_TYPE_EXT = 0x8454;
    FOG_COORDINATE_ARRAY_STRIDE_EXT = 0x8455;
    FOG_COORDINATE_ARRAY_POINTER_EXT = 0x8456;
    FOG_COORDINATE_ARRAY_EXT = 0x8457;
  };
  funcs = {
    {'FogCoordfEXT';
      'CoordF', 'coord'};
    {'FogCoordfvEXT';
      'const CoordF*', 'coord'};
    {'FogCoorddEXT';
      'CoordD', 'coord'};
    {'FogCoorddvEXT';
      'const CoordD*', 'coord'};
    {'FogCoordPointerEXT';
      'FogPointerTypeEXT', 'type';
      'SizeI', 'stride';
      'const Void*', 'pointer'};
  };
}
