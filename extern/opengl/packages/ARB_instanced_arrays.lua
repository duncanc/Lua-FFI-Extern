return {
  basicTypes = {
    GLuint = "unsigned int";
  };
  typeAliases = {
    UInt32 = "GLuint";
  };
  magicNumbers = {
    VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = 0x88FE;
  };
  funcs = {
    {'VertexAttribDivisorARB';
      'UInt32', 'index';
      'UInt32', 'divisor'};
  };
}
