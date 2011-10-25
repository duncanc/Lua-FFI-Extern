return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLsizei = "int";
  };
  typeAliases = {
    BeginMode = "GLenum";
    Int32 = "GLint";
    SizeI = "GLsizei";
  };
  magicNumbers = {
    QUAD_MESH_SUN = 0x8614;
    TRIANGLE_MESH_SUN = 0x8615;
  };
  funcs = {
    {'DrawMeshArraysSUN';
      'BeginMode', 'mode';
      'Int32', 'first';
      'SizeI', 'count';
      'SizeI', 'width'};
  };
}
