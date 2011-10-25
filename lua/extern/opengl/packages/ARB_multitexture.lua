return {
  basicTypes = {
    GLenum = "unsigned int";
    GLdouble = "double";
    GLfloat = "float";
    GLint = "int";
    GLshort = "short";
  };
  typeAliases = {
    TextureUnit = "GLenum";
    CoordD = "GLdouble";
    CoordF = "GLfloat";
    CoordI = "GLint";
    CoordS = "GLshort";
  };
  magicNumbers = {
    TEXTURE0_ARB = 0x84C0;
    TEXTURE1_ARB = 0x84C1;
    TEXTURE2_ARB = 0x84C2;
    TEXTURE3_ARB = 0x84C3;
    TEXTURE4_ARB = 0x84C4;
    TEXTURE5_ARB = 0x84C5;
    TEXTURE6_ARB = 0x84C6;
    TEXTURE7_ARB = 0x84C7;
    TEXTURE8_ARB = 0x84C8;
    TEXTURE9_ARB = 0x84C9;
    TEXTURE10_ARB = 0x84CA;
    TEXTURE11_ARB = 0x84CB;
    TEXTURE12_ARB = 0x84CC;
    TEXTURE13_ARB = 0x84CD;
    TEXTURE14_ARB = 0x84CE;
    TEXTURE15_ARB = 0x84CF;
    TEXTURE16_ARB = 0x84D0;
    TEXTURE17_ARB = 0x84D1;
    TEXTURE18_ARB = 0x84D2;
    TEXTURE19_ARB = 0x84D3;
    TEXTURE20_ARB = 0x84D4;
    TEXTURE21_ARB = 0x84D5;
    TEXTURE22_ARB = 0x84D6;
    TEXTURE23_ARB = 0x84D7;
    TEXTURE24_ARB = 0x84D8;
    TEXTURE25_ARB = 0x84D9;
    TEXTURE26_ARB = 0x84DA;
    TEXTURE27_ARB = 0x84DB;
    TEXTURE28_ARB = 0x84DC;
    TEXTURE29_ARB = 0x84DD;
    TEXTURE30_ARB = 0x84DE;
    TEXTURE31_ARB = 0x84DF;
    ACTIVE_TEXTURE_ARB = 0x84E0;
    CLIENT_ACTIVE_TEXTURE_ARB = 0x84E1;
    MAX_TEXTURE_UNITS_ARB = 0x84E2;
  };
  funcs = {
    {'ActiveTextureARB';
      'TextureUnit', 'texture'};
    {'ClientActiveTextureARB';
      'TextureUnit', 'texture'};
    {'MultiTexCoord1dARB';
      'TextureUnit', 'target';
      'CoordD', 's'};
    {'MultiTexCoord1dvARB';
      'TextureUnit', 'target';
      'const CoordD*', 'v'};
    {'MultiTexCoord1fARB';
      'TextureUnit', 'target';
      'CoordF', 's'};
    {'MultiTexCoord1fvARB';
      'TextureUnit', 'target';
      'const CoordF*', 'v'};
    {'MultiTexCoord1iARB';
      'TextureUnit', 'target';
      'CoordI', 's'};
    {'MultiTexCoord1ivARB';
      'TextureUnit', 'target';
      'const CoordI*', 'v'};
    {'MultiTexCoord1sARB';
      'TextureUnit', 'target';
      'CoordS', 's'};
    {'MultiTexCoord1svARB';
      'TextureUnit', 'target';
      'const CoordS*', 'v'};
    {'MultiTexCoord2dARB';
      'TextureUnit', 'target';
      'CoordD', 's';
      'CoordD', 't'};
    {'MultiTexCoord2dvARB';
      'TextureUnit', 'target';
      'const CoordD*', 'v'};
    {'MultiTexCoord2fARB';
      'TextureUnit', 'target';
      'CoordF', 's';
      'CoordF', 't'};
    {'MultiTexCoord2fvARB';
      'TextureUnit', 'target';
      'const CoordF*', 'v'};
    {'MultiTexCoord2iARB';
      'TextureUnit', 'target';
      'CoordI', 's';
      'CoordI', 't'};
    {'MultiTexCoord2ivARB';
      'TextureUnit', 'target';
      'const CoordI*', 'v'};
    {'MultiTexCoord2sARB';
      'TextureUnit', 'target';
      'CoordS', 's';
      'CoordS', 't'};
    {'MultiTexCoord2svARB';
      'TextureUnit', 'target';
      'const CoordS*', 'v'};
    {'MultiTexCoord3dARB';
      'TextureUnit', 'target';
      'CoordD', 's';
      'CoordD', 't';
      'CoordD', 'r'};
    {'MultiTexCoord3dvARB';
      'TextureUnit', 'target';
      'const CoordD*', 'v'};
    {'MultiTexCoord3fARB';
      'TextureUnit', 'target';
      'CoordF', 's';
      'CoordF', 't';
      'CoordF', 'r'};
    {'MultiTexCoord3fvARB';
      'TextureUnit', 'target';
      'const CoordF*', 'v'};
    {'MultiTexCoord3iARB';
      'TextureUnit', 'target';
      'CoordI', 's';
      'CoordI', 't';
      'CoordI', 'r'};
    {'MultiTexCoord3ivARB';
      'TextureUnit', 'target';
      'const CoordI*', 'v'};
    {'MultiTexCoord3sARB';
      'TextureUnit', 'target';
      'CoordS', 's';
      'CoordS', 't';
      'CoordS', 'r'};
    {'MultiTexCoord3svARB';
      'TextureUnit', 'target';
      'const CoordS*', 'v'};
    {'MultiTexCoord4dARB';
      'TextureUnit', 'target';
      'CoordD', 's';
      'CoordD', 't';
      'CoordD', 'r';
      'CoordD', 'q'};
    {'MultiTexCoord4dvARB';
      'TextureUnit', 'target';
      'const CoordD*', 'v'};
    {'MultiTexCoord4fARB';
      'TextureUnit', 'target';
      'CoordF', 's';
      'CoordF', 't';
      'CoordF', 'r';
      'CoordF', 'q'};
    {'MultiTexCoord4fvARB';
      'TextureUnit', 'target';
      'const CoordF*', 'v'};
    {'MultiTexCoord4iARB';
      'TextureUnit', 'target';
      'CoordI', 's';
      'CoordI', 't';
      'CoordI', 'r';
      'CoordI', 'q'};
    {'MultiTexCoord4ivARB';
      'TextureUnit', 'target';
      'const CoordI*', 'v'};
    {'MultiTexCoord4sARB';
      'TextureUnit', 'target';
      'CoordS', 's';
      'CoordS', 't';
      'CoordS', 'r';
      'CoordS', 'q'};
    {'MultiTexCoord4svARB';
      'TextureUnit', 'target';
      'const CoordS*', 'v'};
  };
}