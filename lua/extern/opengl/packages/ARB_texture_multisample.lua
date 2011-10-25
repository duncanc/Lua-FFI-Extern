return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLint = "int";
    GLboolean = "unsigned char";
    GLuint = "unsigned int";
    GLfloat = "float";
    GLbitfield = "unsigned int";
  };
  magicNumbers = {
    SAMPLE_POSITION = 0x8E50;
    SAMPLE_MASK = 0x8E51;
    SAMPLE_MASK_VALUE = 0x8E52;
    MAX_SAMPLE_MASK_WORDS = 0x8E59;
    TEXTURE_2D_MULTISAMPLE = 0x9100;
    PROXY_TEXTURE_2D_MULTISAMPLE = 0x9101;
    TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102;
    PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103;
    TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104;
    TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105;
    TEXTURE_SAMPLES = 0x9106;
    TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107;
    SAMPLER_2D_MULTISAMPLE = 0x9108;
    INT_SAMPLER_2D_MULTISAMPLE = 0x9109;
    UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A;
    SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B;
    INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C;
    UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D;
    MAX_COLOR_TEXTURE_SAMPLES = 0x910E;
    MAX_DEPTH_TEXTURE_SAMPLES = 0x910F;
    MAX_INTEGER_SAMPLES = 0x9110;
  };
  funcs = {
    {'TexImage2DMultisample';
      'GLenum', 'target';
      'SizeI', 'samples';
      'Int32', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height';
      'Boolean', 'fixedsamplelocations'};
    {'TexImage3DMultisample';
      'GLenum', 'target';
      'SizeI', 'samples';
      'Int32', 'internalformat';
      'SizeI', 'width';
      'SizeI', 'height';
      'SizeI', 'depth';
      'Boolean', 'fixedsamplelocations'};
    {'GetMultisamplefv';
      'GLenum', 'pname';
      'UInt32', 'index';
      'Float32*', 'val'};
    {'SampleMaski';
      'UInt32', 'index';
      'GLbitfield', 'mask'};
  };
}
