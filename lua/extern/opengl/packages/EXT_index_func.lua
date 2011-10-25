return {
  basicTypes = {
    GLenum = "unsigned int";
    GLclampf = "float";
  };
  typeAliases = {
    IndexFunctionEXT = "GLenum";
    ClampedFloat32 = "GLclampf";
  };
  magicNumbers = {
    INDEX_TEST_EXT = 0x81B5;
    INDEX_TEST_FUNC_EXT = 0x81B6;
    INDEX_TEST_REF_EXT = 0x81B7;
  };
  funcs = {
    {'IndexFuncEXT';
      'IndexFunctionEXT', 'func';
      'ClampedFloat32', 'ref'};
  };
}
