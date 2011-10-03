return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLvoid = "void";
    GLenum = "unsigned int";
  };
  typeAliases = {
    TextureTarget = "GLenum";
    CheckedInt32 = "GLint";
    PixelInternalFormat = "GLenum";
    SizeI = "GLsizei";
    CompressedTextureARB = "GLvoid";
    PixelFormat = "GLenum";
  };
  magicNumbers = {
    COMPRESSED_ALPHA_ARB = 0x84E9;
    COMPRESSED_LUMINANCE_ARB = 0x84EA;
    COMPRESSED_LUMINANCE_ALPHA_ARB = 0x84EB;
    COMPRESSED_INTENSITY_ARB = 0x84EC;
    COMPRESSED_RGB_ARB = 0x84ED;
    COMPRESSED_RGBA_ARB = 0x84EE;
    TEXTURE_COMPRESSION_HINT_ARB = 0x84EF;
    TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = 0x86A0;
    TEXTURE_COMPRESSED_ARB = 0x86A1;
    NUM_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A2;
    COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A3;
  };
  funcs = {
    {'CompressedTexImage3DARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'CheckedInt32', 'border';
      'SizeI', 'imageSize';
      'const CompressedTextureARB*', 'data'};
    {'CompressedTexImage2DARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height';
      'CheckedInt32', 'border';
      'SizeI', 'imageSize';
      'const CompressedTextureARB*', 'data'};
    {'CompressedTexImage1DARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'PixelInternalFormat', 'internalformat';
      'SizeI', 'width';
      'CheckedInt32', 'border';
      'SizeI', 'imageSize';
      'const CompressedTextureARB*', 'data'};
    {'CompressedTexSubImage3DARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'CheckedInt32', 'yoffset';
      'CheckedInt32', 'zoffset';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'PixelFormat', 'format';
      'SizeI', 'imageSize';
      'const CompressedTextureARB*', 'data'};
    {'CompressedTexSubImage2DARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'CheckedInt32', 'yoffset';
      'SizeI', 'width';
      'SizeI', 'height';
      'PixelFormat', 'format';
      'SizeI', 'imageSize';
      'const CompressedTextureARB*', 'data'};
    {'CompressedTexSubImage1DARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CheckedInt32', 'xoffset';
      'SizeI', 'width';
      'PixelFormat', 'format';
      'SizeI', 'imageSize';
      'const CompressedTextureARB*', 'data'};
    {'GetCompressedTexImageARB';
      'TextureTarget', 'target';
      'CheckedInt32', 'level';
      'CompressedTextureARB*', 'img'};
  };
}
