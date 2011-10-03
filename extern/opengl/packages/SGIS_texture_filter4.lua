return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLfloat = "float";
    GLsizei = "int";
  };
  typeAliases = {
    TextureTarget = "GLenum";
    TextureFilterSGIS = "GLenum";
    Float32 = "GLfloat";
    SizeI = "GLsizei";
  };
  magicNumbers = {
    FILTER4_SGIS = 0x8146;
    TEXTURE_FILTER4_SIZE_SGIS = 0x8147;
  };
  funcs = {
    {'GetTexFilterFuncSGIS';
      'TextureTarget', 'target';
      'TextureFilterSGIS', 'filter';
      'Float32*', 'weights'};
    {'TexFilterFuncSGIS';
      'TextureTarget', 'target';
      'TextureFilterSGIS', 'filter';
      'SizeI', 'n';
      'const Float32*', 'weights'};
  };
}
