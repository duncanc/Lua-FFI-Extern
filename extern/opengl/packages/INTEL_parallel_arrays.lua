return {
  basicTypes = {
    GLint = "int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLenum = "unsigned int";
  };
  typeAliases = {
    Int32 = "GLint";
    VertexPointerType = "GLenum";
    VoidPointer = "GLvoid*";
    NormalPointerType = "GLenum";
  };
  magicNumbers = {
    PARALLEL_ARRAYS_INTEL = 0x83F4;
    VERTEX_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F5;
    NORMAL_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F6;
    COLOR_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F7;
    TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F8;
  };
  funcs = {
    {'VertexPointervINTEL';
      'Int32', 'size';
      'VertexPointerType', 'type';
      'const VoidPointer*', 'pointer'};
    {'NormalPointervINTEL';
      'NormalPointerType', 'type';
      'const VoidPointer*', 'pointer'};
    {'ColorPointervINTEL';
      'Int32', 'size';
      'VertexPointerType', 'type';
      'const VoidPointer*', 'pointer'};
    {'TexCoordPointervINTEL';
      'Int32', 'size';
      'VertexPointerType', 'type';
      'const VoidPointer*', 'pointer'};
  };
}
