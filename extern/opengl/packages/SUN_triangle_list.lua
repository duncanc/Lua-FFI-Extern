return {
  basicTypes = {
    GLuint = "unsigned int";
    GLushort = "unsigned short";
    GLubyte = "unsigned char";
    GLenum = "unsigned int";
    GLsizei = "int";
    GLvoid = "void";
  };
  typeAliases = {
    UInt32 = "GLuint";
    UInt16 = "GLushort";
    UInt8 = "GLubyte";
    ReplacementCodeTypeSUN = "GLenum";
    SizeI = "GLsizei";
    VoidPointer = "GLvoid*";
  };
  magicNumbers = {
    RESTART_SUN = 0x0001;
    REPLACE_MIDDLE_SUN = 0x0002;
    REPLACE_OLDEST_SUN = 0x0003;
    TRIANGLE_LIST_SUN = 0x81D7;
    REPLACEMENT_CODE_SUN = 0x81D8;
    REPLACEMENT_CODE_ARRAY_SUN = 0x85C0;
    REPLACEMENT_CODE_ARRAY_TYPE_SUN = 0x85C1;
    REPLACEMENT_CODE_ARRAY_STRIDE_SUN = 0x85C2;
    REPLACEMENT_CODE_ARRAY_POINTER_SUN = 0x85C3;
    R1UI_V3F_SUN = 0x85C4;
    R1UI_C4UB_V3F_SUN = 0x85C5;
    R1UI_C3F_V3F_SUN = 0x85C6;
    R1UI_N3F_V3F_SUN = 0x85C7;
    R1UI_C4F_N3F_V3F_SUN = 0x85C8;
    R1UI_T2F_V3F_SUN = 0x85C9;
    R1UI_T2F_N3F_V3F_SUN = 0x85CA;
    R1UI_T2F_C4F_N3F_V3F_SUN = 0x85CB;
  };
  funcs = {
    {'ReplacementCodeuiSUN';
      'UInt32', 'code'};
    {'ReplacementCodeusSUN';
      'UInt16', 'code'};
    {'ReplacementCodeubSUN';
      'UInt8', 'code'};
    {'ReplacementCodeuivSUN';
      'const UInt32*', 'code'};
    {'ReplacementCodeusvSUN';
      'const UInt16*', 'code'};
    {'ReplacementCodeubvSUN';
      'const UInt8*', 'code'};
    {'ReplacementCodePointerSUN';
      'ReplacementCodeTypeSUN', 'type';
      'SizeI', 'stride';
      'const VoidPointer*', 'pointer'};
  };
}
