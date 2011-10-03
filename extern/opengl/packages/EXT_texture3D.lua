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
    PACK_SKIP_IMAGES_EXT = 0x806B;
    PACK_IMAGE_HEIGHT_EXT = 0x806C;
    UNPACK_SKIP_IMAGES_EXT = 0x806D;
    UNPACK_IMAGE_HEIGHT_EXT = 0x806E;
    TEXTURE_3D_EXT = 0x806F;
    PROXY_TEXTURE_3D_EXT = 0x8070;
    TEXTURE_DEPTH_EXT = 0x8071;
    TEXTURE_WRAP_R_EXT = 0x8072;
    MAX_3D_TEXTURE_SIZE_EXT = 0x8073;
  };
  funcs = {
    {'TexImage3DEXT';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'CheckedInt32', 'border';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'pixels'};
    {'TexSubImage3DEXT';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'CheckedInt32', 'yoffset';
      'CheckedInt32', 'zoffset';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'pixels'};
  };
}
