return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
  };
  typeAliases = {
    PointParameterNameARB = "GLenum";
    Int32 = "GLint";
  };
  magicNumbers = {
    POINT_SPRITE_NV = 0x8861;
    COORD_REPLACE_NV = 0x8862;
    POINT_SPRITE_R_MODE_NV = 0x8863;
  };
  funcs = {
    {'PointParameteriNV';
      'PointParameterNameARB', 'pname';
      'Int32', 'param'};
    {'PointParameterivNV';
      'PointParameterNameARB', 'pname';
      'const Int32*', 'params'};
  };
}
