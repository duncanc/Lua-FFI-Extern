return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLint = "int";
    GLfloat = "float";
  };
  typeAliases = {
    PixelTransformTargetEXT = "GLenum";
    PixelTransformPNameEXT = "GLenum";
    Int32 = "GLint";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    PIXEL_TRANSFORM_2D_EXT = 0x8330;
    PIXEL_MAG_FILTER_EXT = 0x8331;
    PIXEL_MIN_FILTER_EXT = 0x8332;
    PIXEL_CUBIC_WEIGHT_EXT = 0x8333;
    CUBIC_EXT = 0x8334;
    AVERAGE_EXT = 0x8335;
    PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8336;
    MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8337;
    PIXEL_TRANSFORM_2D_MATRIX_EXT = 0x8338;
  };
  funcs = {
    {'PixelTransformParameteriEXT';
      'PixelTransformTargetEXT', 'target';
      'PixelTransformPNameEXT', 'pname';
      'Int32', 'param'};
    {'PixelTransformParameterfEXT';
      'PixelTransformTargetEXT', 'target';
      'PixelTransformPNameEXT', 'pname';
      'Float32', 'param'};
    {'PixelTransformParameterivEXT';
      'PixelTransformTargetEXT', 'target';
      'PixelTransformPNameEXT', 'pname';
      'const Int32*', 'params'};
    {'PixelTransformParameterfvEXT';
      'PixelTransformTargetEXT', 'target';
      'PixelTransformPNameEXT', 'pname';
      'const Float32*', 'params'};
  };
}
