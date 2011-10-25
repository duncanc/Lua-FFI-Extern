return {
  basicTypes = {
    GLenum = "unsigned int";
  };
  typeAliases = {
    BlendFuncSeparateParameterEXT = "GLenum";
  };
  magicNumbers = {
    BLEND_DST_RGB_EXT = 0x80C8;
    BLEND_SRC_RGB_EXT = 0x80C9;
    BLEND_DST_ALPHA_EXT = 0x80CA;
    BLEND_SRC_ALPHA_EXT = 0x80CB;
  };
  funcs = {
    {'BlendFuncSeparateEXT';
      'BlendFuncSeparateParameterEXT', 'sfactorRGB';
      'BlendFuncSeparateParameterEXT', 'dfactorRGB';
      'BlendFuncSeparateParameterEXT', 'sfactorAlpha';
      'BlendFuncSeparateParameterEXT', 'dfactorAlpha'};
  };
}
