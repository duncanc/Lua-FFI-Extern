return {
  basicTypes = {
    GLsizei = "int";
    GLfloat = "float";
  };
  typeAliases = {
    SizeI = "GLsizei";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    FOG_FUNC_SGIS = 0x812A;
    FOG_FUNC_POINTS_SGIS = 0x812B;
    MAX_FOG_FUNC_POINTS_SGIS = 0x812C;
  };
  funcs = {
    {'FogFuncSGIS';
      'SizeI', 'n';
      'const Float32*', 'points'};
    {'GetFogFuncSGIS';
      'Float32*', 'points'};
  };
}
