return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLenum = "unsigned int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLint = "int";
  };
  typeAliases = {
    ColorTableTarget = "GLenum";
    SizeI = "GLsizei";
    PixelFormat = "GLenum";
    PixelType = "GLenum";
    Void = "GLvoid";
    WinCoord = "GLint";
  };
  magicNumbers = {
    VERTEX_DATA_HINT_PGI = 0x1A22A;
    VERTEX_CONSISTENT_HINT_PGI = 0x1A22B;
    MATERIAL_SIDE_HINT_PGI = 0x1A22C;
    MAX_VERTEX_HINT_PGI = 0x1A22D;
    COLOR3_BIT_PGI = 0x00010000;
    COLOR4_BIT_PGI = 0x00020000;
    EDGEFLAG_BIT_PGI = 0x00040000;
    INDEX_BIT_PGI = 0x00080000;
    MAT_AMBIENT_BIT_PGI = 0x00100000;
    MAT_AMBIENT_AND_DIFFUSE_BIT_PGI = 0x00200000;
    MAT_DIFFUSE_BIT_PGI = 0x00400000;
    MAT_EMISSION_BIT_PGI = 0x00800000;
    MAT_COLOR_INDEXES_BIT_PGI = 0x01000000;
    MAT_SHININESS_BIT_PGI = 0x02000000;
    MAT_SPECULAR_BIT_PGI = 0x04000000;
    NORMAL_BIT_PGI = 0x08000000;
    TEXCOORD1_BIT_PGI = 0x10000000;
    TEXCOORD2_BIT_PGI = 0x20000000;
    TEXCOORD3_BIT_PGI = 0x40000000;
    TEXCOORD4_BIT_PGI = 0x80000000;
    VERTEX23_BIT_PGI = 0x00000004;
    VERTEX4_BIT_PGI = 0x00000008;
  };
  funcs = {
    {'ColorSubTableEXT';
      'ColorTableTarget', 'target';
      'SizeI', 'start';
      'SizeI', 'count';
      'PixelFormat', 'format';
      'PixelType', 'type';
      'const Void*', 'data'};
    {'CopyColorSubTableEXT';
      'ColorTableTarget', 'target';
      'SizeI', 'start';
      'WinCoord', 'x';
      'WinCoord', 'y';
      'SizeI', 'width'};
  };
}
