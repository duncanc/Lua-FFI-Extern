return {
  basicTypes = {
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    SizeI = "GLsizei";
    Void = "GLvoid";
  };
  magicNumbers = {
    VERTEX_ARRAY_RANGE_NV = 0x851D;
    VERTEX_ARRAY_RANGE_LENGTH_NV = 0x851E;
    VERTEX_ARRAY_RANGE_VALID_NV = 0x851F;
    MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = 0x8520;
    VERTEX_ARRAY_RANGE_POINTER_NV = 0x8521;
  };
  funcs = {
    {'FlushVertexArrayRangeNV'};
    {'VertexArrayRangeNV';
      'SizeI', 'length';
      'const Void*', 'pointer'};
  };
}
