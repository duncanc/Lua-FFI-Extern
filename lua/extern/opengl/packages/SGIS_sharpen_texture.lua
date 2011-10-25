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
    LINEAR_SHARPEN_SGIS = 0x80AD;
    LINEAR_SHARPEN_ALPHA_SGIS = 0x80AE;
    LINEAR_SHARPEN_COLOR_SGIS = 0x80AF;
    SHARPEN_TEXTURE_FUNC_POINTS_SGIS = 0x80B0;
  };
  funcs = {
    {'SharpenTexFuncSGIS';
      'TextureTarget', 'target';
      'SizeI', 'n';
      'const Float32*', 'points'};
    {'GetSharpenTexFuncSGIS';
      'TextureTarget', 'target';
      'Float32*', 'points'};
  };
}
