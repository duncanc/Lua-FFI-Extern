return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    ProgramTarget = "GLenum";
    Int32 = "GLint";
    FramebufferTarget = "GLenum";
    FramebufferAttachment = "GLenum";
    Texture = "GLuint";
    CheckedInt32 = "GLint";
    TextureTarget = "GLenum";
  };
  magicNumbers = {
    LINES_ADJACENCY_EXT = 0x000A;
    LINE_STRIP_ADJACENCY_EXT = 0x000B;
    TRIANGLES_ADJACENCY_EXT = 0x000C;
    TRIANGLE_STRIP_ADJACENCY_EXT = 0x000D;
    GEOMETRY_PROGRAM_NV = 0x8C26;
    MAX_PROGRAM_OUTPUT_VERTICES_NV = 0x8C27;
    MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV = 0x8C28;
    GEOMETRY_VERTICES_OUT_EXT = 0x8DDA;
    GEOMETRY_INPUT_TYPE_EXT = 0x8DDB;
    GEOMETRY_OUTPUT_TYPE_EXT = 0x8DDC;
    MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT = 0x8C29;
    FRAMEBUFFER_ATTACHMENT_LAYERED_EXT = 0x8DA7;
    FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT = 0x8DA8;
    FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT = 0x8DA9;
    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = 0x8CD4;
    PROGRAM_POINT_SIZE_EXT = 0x8642;
  };
  funcs = {
    {'ProgramVertexLimitNV';
      'ProgramTarget', 'target';
      'Int32', 'limit'};
    {'FramebufferTextureEXT';
      'FramebufferTarget', 'target';
      'FramebufferAttachment', 'attachment';
      'Texture', 'texture';
      'CheckedInt32', 'level'};
    {'FramebufferTextureLayerEXT';
      'FramebufferTarget', 'target';
      'FramebufferAttachment', 'attachment';
      'Texture', 'texture';
      'CheckedInt32', 'level';
      'CheckedInt32', 'layer'};
    {'FramebufferTextureFaceEXT';
      'FramebufferTarget', 'target';
      'FramebufferAttachment', 'attachment';
      'Texture', 'texture';
      'CheckedInt32', 'level';
      'TextureTarget', 'face'};
  };
}
