return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLuint = "unsigned int";
  };
  typeAliases = {
    TextureTarget = "GLenum";
    UInt32 = "GLuint";
  };
  magicNumbers = {
    TEXTURE_BUFFER_ARB = 0x8C2A;
    MAX_TEXTURE_BUFFER_SIZE_ARB = 0x8C2B;
    TEXTURE_BINDING_BUFFER_ARB = 0x8C2C;
    TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = 0x8C2D;
    TEXTURE_BUFFER_FORMAT_ARB = 0x8C2E;
  };
  funcs = {
    {'TexBufferARB';
      'TextureTarget', 'target';
      'GLenum', 'internalformat';
      'UInt32', 'buffer'};
  };
}
