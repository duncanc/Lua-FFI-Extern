return {
  basicTypes = {
    GLuint = "unsigned int";
    GLint = "int";
    GLbyte = "signed char";
    GLshort = "short";
    GLubyte = "unsigned char";
    GLushort = "unsigned short";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int32 = "GLint";
    Int8 = "GLbyte";
    Int16 = "GLshort";
    UInt8 = "GLubyte";
    UInt16 = "GLushort";
    VertexAttribEnum = "GLenum";
    SizeI = "GLsizei";
    Void = "GLvoid";
  };
  magicNumbers = {
    VERTEX_ATTRIB_ARRAY_INTEGER_NV = 0x88FD;
  };
  funcs = {
    {'VertexAttribI1iEXT';
      'UInt32', 'index';
      'Int32', 'x'};
    {'VertexAttribI2iEXT';
      'UInt32', 'index';
      'Int32', 'x';
      'Int32', 'y'};
    {'VertexAttribI3iEXT';
      'UInt32', 'index';
      'Int32', 'x';
      'Int32', 'y';
      'Int32', 'z'};
    {'VertexAttribI4iEXT';
      'UInt32', 'index';
      'Int32', 'x';
      'Int32', 'y';
      'Int32', 'z';
      'Int32', 'w'};
    {'VertexAttribI1uiEXT';
      'UInt32', 'index';
      'UInt32', 'x'};
    {'VertexAttribI2uiEXT';
      'UInt32', 'index';
      'UInt32', 'x';
      'UInt32', 'y'};
    {'VertexAttribI3uiEXT';
      'UInt32', 'index';
      'UInt32', 'x';
      'UInt32', 'y';
      'UInt32', 'z'};
    {'VertexAttribI4uiEXT';
      'UInt32', 'index';
      'UInt32', 'x';
      'UInt32', 'y';
      'UInt32', 'z';
      'UInt32', 'w'};
    {'VertexAttribI1ivEXT';
      'UInt32', 'index';
      'const Int32*', 'v'};
    {'VertexAttribI2ivEXT';
      'UInt32', 'index';
      'const Int32*', 'v'};
    {'VertexAttribI3ivEXT';
      'UInt32', 'index';
      'const Int32*', 'v'};
    {'VertexAttribI4ivEXT';
      'UInt32', 'index';
      'const Int32*', 'v'};
    {'VertexAttribI1uivEXT';
      'UInt32', 'index';
      'const UInt32*', 'v'};
    {'VertexAttribI2uivEXT';
      'UInt32', 'index';
      'const UInt32*', 'v'};
    {'VertexAttribI3uivEXT';
      'UInt32', 'index';
      'const UInt32*', 'v'};
    {'VertexAttribI4uivEXT';
      'UInt32', 'index';
      'const UInt32*', 'v'};
    {'VertexAttribI4bvEXT';
      'UInt32', 'index';
      'const Int8*', 'v'};
    {'VertexAttribI4svEXT';
      'UInt32', 'index';
      'const Int16*', 'v'};
    {'VertexAttribI4ubvEXT';
      'UInt32', 'index';
      'const UInt8*', 'v'};
    {'VertexAttribI4usvEXT';
      'UInt32', 'index';
      'const UInt16*', 'v'};
    {'VertexAttribIPointerEXT';
      'UInt32', 'index';
      'Int32', 'size';
      'VertexAttribEnum', 'type';
      'SizeI', 'stride';
      'const Void*', 'pointer'};
    {'GetVertexAttribIivEXT';
      'UInt32', 'index';
      'VertexAttribEnum', 'pname';
      'Int32*', 'params'};
    {'GetVertexAttribIuivEXT';
      'UInt32', 'index';
      'VertexAttribEnum', 'pname';
      'UInt32*', 'params'};
  };
}
