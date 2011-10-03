return {
  basicTypes = {
    GLfloat = "float";
    GLdouble = "double";
  };
  typeAliases = {
    Float32 = "GLfloat";
    Float64 = "GLdouble";
  };
  magicNumbers = {
    TRANSPOSE_MODELVIEW_MATRIX_ARB = 0x84E3;
    TRANSPOSE_PROJECTION_MATRIX_ARB = 0x84E4;
    TRANSPOSE_TEXTURE_MATRIX_ARB = 0x84E5;
    TRANSPOSE_COLOR_MATRIX_ARB = 0x84E6;
  };
  funcs = {
    {'LoadTransposeMatrixfARB';
      'const Float32*', 'm'};
    {'LoadTransposeMatrixdARB';
      'const Float64*', 'm'};
    {'MultTransposeMatrixfARB';
      'const Float32*', 'm'};
    {'MultTransposeMatrixdARB';
      'const Float64*', 'm'};
  };
}
