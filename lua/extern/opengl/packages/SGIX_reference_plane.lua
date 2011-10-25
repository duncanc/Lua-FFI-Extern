return {
  basicTypes = {
    GLdouble = "double";
  };
  typeAliases = {
    Float64 = "GLdouble";
  };
  magicNumbers = {
    REFERENCE_PLANE_SGIX = 0x817D;
    REFERENCE_PLANE_EQUATION_SGIX = 0x817E;
  };
  funcs = {
    {'ReferencePlaneSGIX';
      'const Float64*', 'equation'};
  };
}
