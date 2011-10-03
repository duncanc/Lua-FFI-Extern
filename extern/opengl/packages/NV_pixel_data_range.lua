return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    PixelDataRangeTargetNV = "GLenum";
    SizeI = "GLsizei";
    Void = "GLvoid";
  };
  magicNumbers = {
    WRITE_PIXEL_DATA_RANGE_NV = 0x8878;
    READ_PIXEL_DATA_RANGE_NV = 0x8879;
    WRITE_PIXEL_DATA_RANGE_LENGTH_NV = 0x887A;
    READ_PIXEL_DATA_RANGE_LENGTH_NV = 0x887B;
    WRITE_PIXEL_DATA_RANGE_POINTER_NV = 0x887C;
    READ_PIXEL_DATA_RANGE_POINTER_NV = 0x887D;
  };
  funcs = {
    {'PixelDataRangeNV';
      'PixelDataRangeTargetNV', 'target';
      'SizeI', 'length';
      'Void*', 'pointer'};
    {'FlushPixelDataRangeNV';
      'PixelDataRangeTargetNV', 'target'};
  };
}
