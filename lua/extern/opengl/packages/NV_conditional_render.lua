return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    UInt32 = "GLuint";
    TypeEnum = "GLenum";
  };
  magicNumbers = {
    QUERY_WAIT_NV = 0x8E13;
    QUERY_NO_WAIT_NV = 0x8E14;
    QUERY_BY_REGION_WAIT_NV = 0x8E15;
    QUERY_BY_REGION_NO_WAIT_NV = 0x8E16;
  };
  funcs = {
    {'BeginConditionalRenderNV';
      'UInt32', 'id';
      'TypeEnum', 'mode'};
    {'EndConditionalRenderNV'};
  };
}
