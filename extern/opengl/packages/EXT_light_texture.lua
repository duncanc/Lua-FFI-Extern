return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    LightTextureModeEXT = "GLenum";
    LightTexturePNameEXT = "GLenum";
    MaterialFace = "GLenum";
    MaterialParameter = "GLenum";
  };
  magicNumbers = {
    FRAGMENT_MATERIAL_EXT = 0x8349;
    FRAGMENT_NORMAL_EXT = 0x834A;
    FRAGMENT_COLOR_EXT = 0x834C;
    ATTENUATION_EXT = 0x834D;
    SHADOW_ATTENUATION_EXT = 0x834E;
    TEXTURE_APPLICATION_MODE_EXT = 0x834F;
    TEXTURE_LIGHT_EXT = 0x8350;
    TEXTURE_MATERIAL_FACE_EXT = 0x8351;
    TEXTURE_MATERIAL_PARAMETER_EXT = 0x8352;
    FRAGMENT_DEPTH_EXT = 0x8452;
  };
  funcs = {
    {'ApplyTextureEXT';
      'LightTextureModeEXT', 'mode'};
    {'TextureLightEXT';
      'LightTexturePNameEXT', 'pname'};
    {'TextureMaterialEXT';
      'MaterialFace', 'face';
      'MaterialParameter', 'mode'};
  };
}
