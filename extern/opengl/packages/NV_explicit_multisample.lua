return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLfloat = "float";
    GLbitfield = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    GetMultisamplePNameNV = "GLenum";
    UInt32 = "GLuint";
    Float32 = "GLfloat";
    SampleMaskNV = "GLbitfield";
    TextureTarget = "GLenum";
  };
  magicNumbers = {
    SAMPLE_POSITION_NV = 0x8E50;
    SAMPLE_MASK_NV = 0x8E51;
    SAMPLE_MASK_VALUE_NV = 0x8E52;
    TEXTURE_BINDING_RENDERBUFFER_NV = 0x8E53;
    TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV = 0x8E54;
    TEXTURE_RENDERBUFFER_NV = 0x8E55;
    SAMPLER_RENDERBUFFER_NV = 0x8E56;
    INT_SAMPLER_RENDERBUFFER_NV = 0x8E57;
    UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV = 0x8E58;
    MAX_SAMPLE_MASK_WORDS_NV = 0x8E59;
  };
  funcs = {
    {'GetMultisamplefvNV';
      'GetMultisamplePNameNV', 'pname';
      'UInt32', 'index';
      'Float32*', 'val'};
    {'SampleMaskIndexedNV';
      'UInt32', 'index';
      'SampleMaskNV', 'mask'};
    {'TexRenderbufferNV';
      'TextureTarget', 'target';
      'UInt32', 'renderbuffer'};
  };
}
