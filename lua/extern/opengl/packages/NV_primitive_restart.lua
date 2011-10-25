return {
  basicTypes = {
    GLuint = "unsigned int";
  };
  typeAliases = {
    UInt32 = "GLuint";
  };
  magicNumbers = {
    PRIMITIVE_RESTART_NV = 0x8558;
    PRIMITIVE_RESTART_INDEX_NV = 0x8559;
  };
  funcs = {
    {'PrimitiveRestartNV'};
    {'PrimitiveRestartIndexNV';
      'UInt32', 'index'};
  };
}
