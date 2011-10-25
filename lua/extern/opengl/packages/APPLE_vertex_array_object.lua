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
    VERTEX_ARRAY_BINDING_APPLE = 0x85B5;
  };
  funcs = {
    {'BindVertexArrayAPPLE';
      'UInt32', 'array'};
    {'DeleteVertexArraysAPPLE';
      'SizeI', 'n';
      'const UInt32*', 'arrays'};
    {'GenVertexArraysAPPLE';
      'SizeI', 'n';
      'UInt32*', 'arrays'};
    {'IsVertexArrayAPPLE', ret='Boolean';
      'UInt32', 'array'};
  };
}
