return {
  basicTypes = {
    GLvoid = "void";
    GLuint = "unsigned int";
  };
  typeAliases = {
    VoidPointer = "GLvoid*";
    UInt32 = "GLuint";
  };
  magicNumbers = {
    STENCIL_BACK_FUNC_ATI = 0x8800;
    STENCIL_BACK_FAIL_ATI = 0x8801;
    STENCIL_BACK_PASS_DEPTH_FAIL_ATI = 0x8802;
    STENCIL_BACK_PASS_DEPTH_PASS_ATI = 0x8803;
  };
  funcs = {
    {'MapObjectBufferATI', ret='VoidPointer';
      'UInt32', 'buffer'};
    {'UnmapObjectBufferATI';
      'UInt32', 'buffer'};
  };
}
