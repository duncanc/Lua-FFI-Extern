return {
  basicTypes = {
    GLfloat = "float";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  typeAliases = {
    Float32 = "GLfloat";
    SizeI = "GLsizei";
    VertexWeightPointerTypeEXT = "GLenum";
    Void = "GLvoid";
  };
  magicNumbers = {
    MODELVIEW0_STACK_DEPTH_EXT = GL_MODELVIEW_STACK_DEPTH;
    MODELVIEW1_STACK_DEPTH_EXT = 0x8502;
    MODELVIEW0_MATRIX_EXT = GL_MODELVIEW_MATRIX;
    MODELVIEW1_MATRIX_EXT = 0x8506;
    VERTEX_WEIGHTING_EXT = 0x8509;
    MODELVIEW0_EXT = GL_MODELVIEW;
    MODELVIEW1_EXT = 0x850A;
    CURRENT_VERTEX_WEIGHT_EXT = 0x850B;
    VERTEX_WEIGHT_ARRAY_EXT = 0x850C;
    VERTEX_WEIGHT_ARRAY_SIZE_EXT = 0x850D;
    VERTEX_WEIGHT_ARRAY_TYPE_EXT = 0x850E;
    VERTEX_WEIGHT_ARRAY_STRIDE_EXT = 0x850F;
    VERTEX_WEIGHT_ARRAY_POINTER_EXT = 0x8510;
  };
  funcs = {
    {'VertexWeightfEXT';
      'Float32', 'weight'};
    {'VertexWeightfvEXT';
      'const Float32*', 'weight'};
    {'VertexWeightPointerEXT';
      'SizeI', 'size';
      'VertexWeightPointerTypeEXT', 'type';
      'SizeI', 'stride';
      'const Void*', 'pointer'};
  };
}
