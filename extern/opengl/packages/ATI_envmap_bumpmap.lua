return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLfloat = "float";
    GLenum = "unsigned int";
  };
  typeAliases = {
    TexBumpParameterATI = "GLenum";
    Int32 = "GLint";
    Float32 = "GLfloat";
    GetTexBumpParameterATI = "GLenum";
  };
  magicNumbers = {
    BUMP_ROT_MATRIX_ATI = 0x8775;
    BUMP_ROT_MATRIX_SIZE_ATI = 0x8776;
    BUMP_NUM_TEX_UNITS_ATI = 0x8777;
    BUMP_TEX_UNITS_ATI = 0x8778;
    DUDV_ATI = 0x8779;
    DU8DV8_ATI = 0x877A;
    BUMP_ENVMAP_ATI = 0x877B;
    BUMP_TARGET_ATI = 0x877C;
  };
  funcs = {
    {'TexBumpParameterivATI';
      'TexBumpParameterATI', 'pname';
      'const Int32*', 'param'};
    {'TexBumpParameterfvATI';
      'TexBumpParameterATI', 'pname';
      'const Float32*', 'param'};
    {'GetTexBumpParameterivATI';
      'GetTexBumpParameterATI', 'pname';
      'Int32*', 'param'};
    {'GetTexBumpParameterfvATI';
      'GetTexBumpParameterATI', 'pname';
      'Float32*', 'param'};
  };
}
