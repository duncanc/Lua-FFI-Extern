return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLfloat = "float";
  };
  typeAliases = {
    TextureTarget = "GLenum";
    SizeI = "GLsizei";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    DETAIL_TEXTURE_2D_SGIS = 0x8095;
    DETAIL_TEXTURE_2D_BINDING_SGIS = 0x8096;
    LINEAR_DETAIL_SGIS = 0x8097;
    LINEAR_DETAIL_ALPHA_SGIS = 0x8098;
    LINEAR_DETAIL_COLOR_SGIS = 0x8099;
    DETAIL_TEXTURE_LEVEL_SGIS = 0x809A;
    DETAIL_TEXTURE_MODE_SGIS = 0x809B;
    DETAIL_TEXTURE_FUNC_POINTS_SGIS = 0x809C;
  };
  funcs = {
    {'DetailTexFuncSGIS';
      'TextureTarget', 'target';
      'SizeI', 'n';
      'const Float32*', 'points'};
    {'GetDetailTexFuncSGIS';
      'TextureTarget', 'target';
      'Float32*', 'points'};
  };
}
