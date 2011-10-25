return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    UInt32 = "GLuint";
    ProgramParameterPName = "GLenum";
    Int32 = "GLint";
    FramebufferTarget = "GLenum";
    FramebufferAttachment = "GLenum";
    Texture = "GLuint";
    CheckedInt32 = "GLint";
    TextureTarget = "GLenum";
  };
  magicNumbers = {
    LINES_ADJACENCY_ARB = 0x000A;
    LINE_STRIP_ADJACENCY_ARB = 0x000B;
    TRIANGLES_ADJACENCY_ARB = 0x000C;
    TRIANGLE_STRIP_ADJACENCY_ARB = 0x000D;
    PROGRAM_POINT_SIZE_ARB = 0x8642;
    MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = 0x8C29;
    FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = 0x8DA7;
    FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8;
    FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = 0x8DA9;
    GEOMETRY_SHADER_ARB = 0x8DD9;
    GEOMETRY_VERTICES_OUT_ARB = 0x8DDA;
    GEOMETRY_INPUT_TYPE_ARB = 0x8DDB;
    GEOMETRY_OUTPUT_TYPE_ARB = 0x8DDC;
    MAX_GEOMETRY_VARYING_COMPONENTS_ARB = 0x8DDD;
    MAX_VERTEX_VARYING_COMPONENTS_ARB = 0x8DDE;
    MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = 0x8DDF;
    MAX_GEOMETRY_OUTPUT_VERTICES_ARB = 0x8DE0;
    MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1;
    MAX_VARYING_COMPONENTS = 0x8B4B;
    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
  };
  funcs = {
    {'ProgramParameteriARB';
      'UInt32', 'program';
      'ProgramParameterPName', 'pname';
      'Int32', 'value'};
    {'FramebufferTextureARB';
      'FramebufferTarget', 'target';
      'FramebufferAttachment', 'attachment';
      'Texture', 'texture';
      'CheckedInt32', 'level'};
    {'FramebufferTextureLayerARB';
      'FramebufferTarget', 'target';
      'FramebufferAttachment', 'attachment';
      'Texture', 'texture';
      'CheckedInt32', 'level';
      'CheckedInt32', 'layer'};
    {'FramebufferTextureFaceARB';
      'FramebufferTarget', 'target';
      'FramebufferAttachment', 'attachment';
      'Texture', 'texture';
      'CheckedInt32', 'level';
      'TextureTarget', 'face'};
  };
}
