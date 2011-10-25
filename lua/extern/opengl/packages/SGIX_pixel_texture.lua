return {
  basicTypes = {
    GLenum = "unsigned int";
  };
  typeAliases = {
    PixelTexGenModeSGIX = "GLenum";
  };
  magicNumbers = {
    PIXEL_TEX_GEN_SGIX = 0x8139;
    PIXEL_TEX_GEN_MODE_SGIX = 0x832B;
  };
  funcs = {
    {'PixelTexGenSGIX';
      'PixelTexGenModeSGIX', 'mode'};
  };
}
