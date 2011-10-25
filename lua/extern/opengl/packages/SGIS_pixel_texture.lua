return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLfloat = "float";
  };
  typeAliases = {
    PixelTexGenParameterNameSGIS = "GLenum";
    CheckedInt32 = "GLint";
    CheckedFloat32 = "GLfloat";
  };
  magicNumbers = {
    PIXEL_TEXTURE_SGIS = 0x8353;
    PIXEL_FRAGMENT_RGB_SOURCE_SGIS = 0x8354;
    PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS = 0x8355;
    PIXEL_GROUP_COLOR_SGIS = 0x8356;
  };
  funcs = {
    {'PixelTexGenParameteriSGIS';
      'PixelTexGenParameterNameSGIS', 'pname';
      'CheckedInt32', 'param'};
    {'PixelTexGenParameterivSGIS';
      'PixelTexGenParameterNameSGIS', 'pname';
      'const CheckedInt32*', 'params'};
    {'PixelTexGenParameterfSGIS';
      'PixelTexGenParameterNameSGIS', 'pname';
      'CheckedFloat32', 'param'};
    {'PixelTexGenParameterfvSGIS';
      'PixelTexGenParameterNameSGIS', 'pname';
      'const CheckedFloat32*', 'params'};
    {'GetPixelTexGenParameterivSGIS';
      'PixelTexGenParameterNameSGIS', 'pname';
      'CheckedInt32*', 'params'};
    {'GetPixelTexGenParameterfvSGIS';
      'PixelTexGenParameterNameSGIS', 'pname';
      'CheckedFloat32*', 'params'};
  };
}
