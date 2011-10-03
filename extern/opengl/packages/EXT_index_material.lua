return {
  basicTypes = {
    GLenum = "unsigned int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    MaterialFace = "GLenum";
    IndexMaterialParameterEXT = "GLenum";
  };
  magicNumbers = {
    INDEX_MATERIAL_EXT = 0x81B8;
    INDEX_MATERIAL_PARAMETER_EXT = 0x81B9;
    INDEX_MATERIAL_FACE_EXT = 0x81BA;
  };
  funcs = {
    {'IndexMaterialEXT';
      'MaterialFace', 'face';
      'IndexMaterialParameterEXT', 'mode'};
  };
}
