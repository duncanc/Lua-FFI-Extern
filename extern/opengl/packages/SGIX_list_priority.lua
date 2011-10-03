return {
  basicTypes = {
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLfloat = "float";
    GLint = "int";
  };
  typeAliases = {
    List = "GLuint";
    ListParameterName = "GLenum";
    CheckedFloat32 = "GLfloat";
    CheckedInt32 = "GLint";
  };
  magicNumbers = {
    LIST_PRIORITY_SGIX = 0x8182;
  };
  funcs = {
    {'GetListParameterfvSGIX';
      'List', 'list';
      'ListParameterName', 'pname';
      'CheckedFloat32*', 'params'};
    {'GetListParameterivSGIX';
      'List', 'list';
      'ListParameterName', 'pname';
      'CheckedInt32*', 'params'};
    {'ListParameterfSGIX';
      'List', 'list';
      'ListParameterName', 'pname';
      'CheckedFloat32', 'param'};
    {'ListParameterfvSGIX';
      'List', 'list';
      'ListParameterName', 'pname';
      'const CheckedFloat32*', 'params'};
    {'ListParameteriSGIX';
      'List', 'list';
      'ListParameterName', 'pname';
      'CheckedInt32', 'param'};
    {'ListParameterivSGIX';
      'List', 'list';
      'ListParameterName', 'pname';
      'const CheckedInt32*', 'params'};
  };
}
