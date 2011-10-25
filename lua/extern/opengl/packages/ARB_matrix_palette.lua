return {
  basicTypes = {
    GLint = "int";
    GLubyte = "unsigned char";
    GLushort = "unsigned short";
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    Int32 = "GLint";
    UInt8 = "GLubyte";
    UInt16 = "GLushort";
    UInt32 = "GLuint";
    MatrixIndexPointerTypeARB = "GLenum";
    SizeI = "GLsizei";
    Void = "GLvoid";
  };
  magicNumbers = {
    MATRIX_PALETTE_ARB = 0x8840;
    MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = 0x8841;
    MAX_PALETTE_MATRICES_ARB = 0x8842;
    CURRENT_PALETTE_MATRIX_ARB = 0x8843;
    MATRIX_INDEX_ARRAY_ARB = 0x8844;
    CURRENT_MATRIX_INDEX_ARB = 0x8845;
    MATRIX_INDEX_ARRAY_SIZE_ARB = 0x8846;
    MATRIX_INDEX_ARRAY_TYPE_ARB = 0x8847;
    MATRIX_INDEX_ARRAY_STRIDE_ARB = 0x8848;
    MATRIX_INDEX_ARRAY_POINTER_ARB = 0x8849;
  };
  funcs = {
    {'CurrentPaletteMatrixARB';
      'Int32', 'index'};
    {'MatrixIndexubvARB';
      'Int32', 'size';
      'const UInt8*', 'indices'};
    {'MatrixIndexusvARB';
      'Int32', 'size';
      'const UInt16*', 'indices'};
    {'MatrixIndexuivARB';
      'Int32', 'size';
      'const UInt32*', 'indices'};
    {'MatrixIndexPointerARB';
      'Int32', 'size';
      'MatrixIndexPointerTypeARB', 'type';
      'SizeI', 'stride';
      'const Void*', 'pointer'};
  };
}
