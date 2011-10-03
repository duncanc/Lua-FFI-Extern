return {
  basicTypes = {
    GLint = "int";
    GLbitfield = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    Int32 = "GLint";
    ClearBufferMask = "GLbitfield";
  };
  magicNumbers = {
    READ_FRAMEBUFFER_EXT = 0x8CA8;
    DRAW_FRAMEBUFFER_EXT = 0x8CA9;
    DRAW_FRAMEBUFFER_BINDING_EXT = GL_FRAMEBUFFER_BINDING_EXT;
    READ_FRAMEBUFFER_BINDING_EXT = 0x8CAA;
  };
  funcs = {
    {'BlitFramebufferEXT';
      'Int32', 'srcX0';
      'Int32', 'srcY0';
      'Int32', 'srcX1';
      'Int32', 'srcY1';
      'Int32', 'dstX0';
      'Int32', 'dstY0';
      'Int32', 'dstX1';
      'Int32', 'dstY1';
      'ClearBufferMask', 'mask';
      'GLenum', 'filter'};
  };
}
