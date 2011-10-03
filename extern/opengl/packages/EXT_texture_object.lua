return {
  basicTypes = {
    GLboolean = "unsigned char";
    GLsizei = "int";
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLclampf = "float";
  };
  typeAliases = {
    Boolean = "GLboolean";
    SizeI = "GLsizei";
    Texture = "GLuint";
    TextureTarget = "GLenum";
    ClampedFloat32 = "GLclampf";
  };
  magicNumbers = {
    TEXTURE_PRIORITY_EXT = 0x8066;
    TEXTURE_RESIDENT_EXT = 0x8067;
    TEXTURE_1D_BINDING_EXT = 0x8068;
    TEXTURE_2D_BINDING_EXT = 0x8069;
    TEXTURE_3D_BINDING_EXT = 0x806A;
  };
  funcs = {
    {'AreTexturesResidentEXT', ret='Boolean';
      'SizeI', 'n';
      'const Texture*', 'textures';
      'Boolean*', 'residences'};
    {'BindTextureEXT';
      'TextureTarget', 'target';
      'Texture', 'texture'};
    {'DeleteTexturesEXT';
      'SizeI', 'n';
      'const Texture*', 'textures'};
    {'GenTexturesEXT';
      'SizeI', 'n';
      'Texture*', 'textures'};
    {'IsTextureEXT', ret='Boolean';
      'Texture', 'texture'};
    {'PrioritizeTexturesEXT';
      'SizeI', 'n';
      'const Texture*', 'textures';
      'const ClampedFloat32*', 'priorities'};
  };
}
