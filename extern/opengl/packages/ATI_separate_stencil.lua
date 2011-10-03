return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLint = "int";
    GLuint = "unsigned int";
  };
  typeAliases = {
    StencilFaceDirection = "GLenum";
    StencilOp = "GLenum";
    StencilFunction = "GLenum";
    ClampedStencilValue = "GLint";
    MaskedStencilValue = "GLuint";
  };
  magicNumbers = {
    STENCIL_BACK_FUNC_ATI = 0x8800;
    STENCIL_BACK_FAIL_ATI = 0x8801;
    STENCIL_BACK_PASS_DEPTH_FAIL_ATI = 0x8802;
    STENCIL_BACK_PASS_DEPTH_PASS_ATI = 0x8803;
  };
  funcs = {
    {'StencilOpSeparateATI';
      'StencilFaceDirection', 'face';
      'StencilOp', 'sfail';
      'StencilOp', 'dpfail';
      'StencilOp', 'dppass'};
    {'StencilFuncSeparateATI';
      'StencilFunction', 'frontfunc';
      'StencilFunction', 'backfunc';
      'ClampedStencilValue', 'ref';
      'MaskedStencilValue', 'mask'};
  };
}
