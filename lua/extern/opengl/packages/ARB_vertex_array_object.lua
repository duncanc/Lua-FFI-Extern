return {
  basicTypes = {
    GLuint = "unsigned int";
    GLsizei = "int";
    GLboolean = "unsigned char";
  };
  typeAliases = {
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    Boolean = "GLboolean";
  };
  magicNumbers = {
    VERTEX_ARRAY_BINDING = 0x85B5;
  };
  funcs = {
    {'BindVertexArray';
      'UInt32', 'array'};
    {'DeleteVertexArrays';
      'SizeI', 'n';
      'const UInt32*', 'arrays'};
    {'GenVertexArrays';
      'SizeI', 'n';
      'UInt32*', 'arrays'};
    {'IsVertexArray', ret='Boolean';
      'UInt32', 'array'};
  };
}
