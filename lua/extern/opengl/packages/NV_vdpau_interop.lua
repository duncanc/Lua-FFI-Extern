return {
  basicTypes = {
    GLvoid = "void";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLuint = "unsigned int";
    GLint = "int";
  };
  typeAliases = {
    Void = "GLvoid";
    vdpauSurfaceNV = "GLvdpauSurfaceNV";
    SizeI = "GLsizei";
    UInt32 = "GLuint";
    Int32 = "GLint";
  };
  magicNumbers = {
    SURFACE_STATE_NV = 0x86EB;
    SURFACE_REGISTERED_NV = 0x86FD;
    SURFACE_MAPPED_NV = 0x8700;
    WRITE_DISCARD_NV = 0x88BE;
  };
  funcs = {
    {'VDPAUInitNV';
      'Void', 'vdpDevice';
      'Void', 'getProcAddress'};
    {'VDPAUFiniNV'};
    {'VDPAURegisterVideoSurfaceNV', ret='vdpauSurfaceNV';
      'Void', 'vdpSurface';
      'GLenum', 'target';
      'SizeI', 'numTextureNames';
      'const UInt32*', 'textureNames'};
    {'VDPAURegisterOutputSurfaceNV', ret='vdpauSurfaceNV';
      'Void', 'vdpSurface';
      'GLenum', 'target';
      'SizeI', 'numTextureNames';
      'const UInt32*', 'textureNames'};
    {'VDPAUIsSurfaceNV';
      'vdpauSurfaceNV', 'surface'};
    {'VDPAUUnregisterSurfaceNV';
      'vdpauSurfaceNV', 'surface'};
    {'VDPAUGetSurfaceivNV';
      'vdpauSurfaceNV', 'surface';
      'GLenum', 'pname';
      'SizeI', 'bufSize';
      'SizeI', 'length';
      'Int32*', 'values'};
    {'VDPAUSurfaceAccessNV';
      'vdpauSurfaceNV', 'surface';
      'GLenum', 'access'};
    {'VDPAUMapSurfacesNV';
      'SizeI', 'numSurfaces';
      'const vdpauSurfaceNV*', 'surfaces'};
    {'VDPAUUnmapSurfacesNV';
      'SizeI', 'numSurface';
      'const vdpauSurfaceNV*', 'surfaces'};
  };
}
