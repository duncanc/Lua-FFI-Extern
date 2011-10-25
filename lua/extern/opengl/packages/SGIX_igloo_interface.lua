return {
  basicTypes = {
    GLenum = "unsigned int";
    GLvoid = "void";
  };
  typeAliases = {
    IglooFunctionSelectSGIX = "GLenum";
    IglooParameterSGIX = "GLvoid";
  };
  funcs = {
    {'IglooInterfaceSGIX';
      'IglooFunctionSelectSGIX', 'pname';
      'const IglooParameterSGIX*', 'params'};
  };
}
