return {
  basicTypes = {
    GLenum = "unsigned int";
    GLdouble = "double";
    GLfloat = "float";
  };
  typeAliases = {
    CullParameterEXT = "GLenum";
    Float64 = "GLdouble";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    CULL_VERTEX_EXT = 0x81AA;
    CULL_VERTEX_EYE_POSITION_EXT = 0x81AB;
    CULL_VERTEX_OBJECT_POSITION_EXT = 0x81AC;
  };
  funcs = {
    {'CullParameterdvEXT';
      'CullParameterEXT', 'pname';
      'Float64*', 'params'};
    {'CullParameterfvEXT';
      'CullParameterEXT', 'pname';
      'Float32*', 'params'};
  };
}
