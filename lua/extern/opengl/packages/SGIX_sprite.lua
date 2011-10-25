return {
  basicTypes = {
    GLenum = "unsigned int";
    GLfloat = "float";
    GLint = "int";
  };
  typeAliases = {
    SpriteParameterNameSGIX = "GLenum";
    CheckedFloat32 = "GLfloat";
    CheckedInt32 = "GLint";
  };
  magicNumbers = {
    SPRITE_SGIX = 0x8148;
    SPRITE_MODE_SGIX = 0x8149;
    SPRITE_AXIS_SGIX = 0x814A;
    SPRITE_TRANSLATION_SGIX = 0x814B;
    SPRITE_AXIAL_SGIX = 0x814C;
    SPRITE_OBJECT_ALIGNED_SGIX = 0x814D;
    SPRITE_EYE_ALIGNED_SGIX = 0x814E;
  };
  funcs = {
    {'SpriteParameterfSGIX';
      'SpriteParameterNameSGIX', 'pname';
      'CheckedFloat32', 'param'};
    {'SpriteParameterfvSGIX';
      'SpriteParameterNameSGIX', 'pname';
      'const CheckedFloat32*', 'params'};
    {'SpriteParameteriSGIX';
      'SpriteParameterNameSGIX', 'pname';
      'CheckedInt32', 'param'};
    {'SpriteParameterivSGIX';
      'SpriteParameterNameSGIX', 'pname';
      'const CheckedInt32*', 'params'};
  };
}
