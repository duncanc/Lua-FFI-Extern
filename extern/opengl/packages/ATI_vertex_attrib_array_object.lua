return {
  basicTypes = {
    GLuint = "unsigned int";
    GLint = "int";
    GLenum = "unsigned int";
    GLboolean = "unsigned char";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLfloat = "float";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int32 = "GLint";
    VertexAttribPointerTypeARB = "GLenum";
    Boolean = "GLboolean";
    SizeI = "GLsizei";
    ArrayObjectPNameATI = "GLenum";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    IMPLEMENTATION_COLOR_READ_TYPE_OES = 0x8B9A;
    IMPLEMENTATION_COLOR_READ_FORMAT_OES = 0x8B9B;
  };
  funcs = {
    {'VertexAttribArrayObjectATI';
      'UInt32', 'index';
      'Int32', 'size';
      'VertexAttribPointerTypeARB', 'type';
      'Boolean', 'normalized';
      'SizeI', 'stride';
      'UInt32', 'buffer';
      'UInt32', 'offset'};
    {'GetVertexAttribArrayObjectfvATI';
      'UInt32', 'index';
      'ArrayObjectPNameATI', 'pname';
      'Float32*', 'params'};
    {'GetVertexAttribArrayObjectivATI';
      'UInt32', 'index';
      'ArrayObjectPNameATI', 'pname';
      'Int32*', 'params'};
  };
}
