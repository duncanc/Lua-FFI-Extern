return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLint = "int";
    GLfloat = "float";
  };
  typeAliases = {
    ImageTransformTargetHP = "GLenum";
    ImageTransformPNameHP = "GLenum";
    Int32 = "GLint";
    Float32 = "GLfloat";
  };
  magicNumbers = {
    IMAGE_SCALE_X_HP = 0x8155;
    IMAGE_SCALE_Y_HP = 0x8156;
    IMAGE_TRANSLATE_X_HP = 0x8157;
    IMAGE_TRANSLATE_Y_HP = 0x8158;
    IMAGE_ROTATE_ANGLE_HP = 0x8159;
    IMAGE_ROTATE_ORIGIN_X_HP = 0x815A;
    IMAGE_ROTATE_ORIGIN_Y_HP = 0x815B;
    IMAGE_MAG_FILTER_HP = 0x815C;
    IMAGE_MIN_FILTER_HP = 0x815D;
    IMAGE_CUBIC_WEIGHT_HP = 0x815E;
    CUBIC_HP = 0x815F;
    AVERAGE_HP = 0x8160;
    IMAGE_TRANSFORM_2D_HP = 0x8161;
    POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8162;
    PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8163;
  };
  funcs = {
    {'ImageTransformParameteriHP';
      'ImageTransformTargetHP', 'target';
      'ImageTransformPNameHP', 'pname';
      'Int32', 'param'};
    {'ImageTransformParameterfHP';
      'ImageTransformTargetHP', 'target';
      'ImageTransformPNameHP', 'pname';
      'Float32', 'param'};
    {'ImageTransformParameterivHP';
      'ImageTransformTargetHP', 'target';
      'ImageTransformPNameHP', 'pname';
      'const Int32*', 'params'};
    {'ImageTransformParameterfvHP';
      'ImageTransformTargetHP', 'target';
      'ImageTransformPNameHP', 'pname';
      'const Float32*', 'params'};
    {'GetImageTransformParameterivHP';
      'ImageTransformTargetHP', 'target';
      'ImageTransformPNameHP', 'pname';
      'Int32*', 'params'};
    {'GetImageTransformParameterfvHP';
      'ImageTransformTargetHP', 'target';
      'ImageTransformPNameHP', 'pname';
      'Float32*', 'params'};
  };
}
