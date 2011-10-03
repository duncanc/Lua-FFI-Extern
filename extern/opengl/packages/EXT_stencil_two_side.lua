return {
  basicTypes = {
    GLenum = "unsigned int";
  };
  typeAliases = {
    StencilFaceDirection = "GLenum";
  };
  magicNumbers = {
    STENCIL_TEST_TWO_SIDE_EXT = 0x8910;
    ACTIVE_STENCIL_FACE_EXT = 0x8911;
  };
  funcs = {
    {'ActiveStencilFaceEXT';
      'StencilFaceDirection', 'face'};
  };
}
