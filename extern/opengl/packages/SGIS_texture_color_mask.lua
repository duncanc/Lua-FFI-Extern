return {
  basicTypes = {
    GLboolean = "unsigned char";
  };
  typeAliases = {
    Boolean = "GLboolean";
  };
  magicNumbers = {
    TEXTURE_COLOR_WRITEMASK_SGIS = 0x81EF;
  };
  funcs = {
    {'TextureColorMaskSGIS';
      'Boolean', 'red';
      'Boolean', 'green';
      'Boolean', 'blue';
      'Boolean', 'alpha'};
  };
}
