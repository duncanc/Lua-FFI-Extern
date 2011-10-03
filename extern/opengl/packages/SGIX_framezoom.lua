return {
  basicTypes = {
    GLint = "int";
  };
  typeAliases = {
    CheckedInt32 = "GLint";
  };
  magicNumbers = {
    FRAMEZOOM_SGIX = 0x818B;
    FRAMEZOOM_FACTOR_SGIX = 0x818C;
    MAX_FRAMEZOOM_FACTOR_SGIX = 0x818D;
  };
  funcs = {
    {'FrameZoomSGIX';
      'CheckedInt32', 'factor'};
  };
}
