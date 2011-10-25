return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  typeAliases = {
    TextureTarget = "GLenum";
    CheckedInt32 = "GLint";
    PixelInternalFormat = "GLenum";
    SizeI = "GLsizei";
    PixelFormat = "GLenum";
    PixelType = "GLenum";
    Void = "GLvoid";
  };
  magicNumbers = {
    PACK_SKIP_VOLUMES_SGIS = 0x8130;
    PACK_IMAGE_DEPTH_SGIS = 0x8131;
    UNPACK_SKIP_VOLUMES_SGIS = 0x8132;
    UNPACK_IMAGE_DEPTH_SGIS = 0x8133;
    TEXTURE_4D_SGIS = 0x8134;
    PROXY_TEXTURE_4D_SGIS = 0x8135;
    TEXTURE_4DSIZE_SGIS = 0x8136;
    TEXTURE_WRAP_Q_SGIS = 0x8137;
    MAX_4D_TEXTURE_SIZE_SGIS = 0x8138;
    TEXTURE_4D_BINDING_SGIS = 0x814F;
  };
  funcs = {
    {'TexImage4DSGIS';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'SizeI', 'size4d';
      'CheckedInt32', 'border';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'pixels'};
    {'TexSubImage4DSGIS';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'CheckedInt32', 'yoffset';
      'CheckedInt32', 'zoffset';
      'CheckedInt32', 'woffset';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'SizeI', 'size4d';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'pixels'};
  };
}
