return {
  basicTypes = {
    GLbyte = "signed char";
    GLshort = "short";
    GLint = "int";
    GLfloat = "float";
    GLdouble = "double";
    GLubyte = "unsigned char";
    GLushort = "unsigned short";
    GLuint = "unsigned int";
  };
  typeAliases = {
    Int8 = "GLbyte";
    Int16 = "GLshort";
    Int32 = "GLint";
    Float32 = "GLfloat";
    Float64 = "GLdouble";
    UInt8 = "GLubyte";
    UInt16 = "GLushort";
    UInt32 = "GLuint";
  };
  magicNumbers = {
    GLOBAL_ALPHA_SUN = 0x81D9;
    GLOBAL_ALPHA_FACTOR_SUN = 0x81DA;
  };
  funcs = {
    {'GlobalAlphaFactorbSUN';
      'Int8', 'factor'};
    {'GlobalAlphaFactorsSUN';
      'Int16', 'factor'};
    {'GlobalAlphaFactoriSUN';
      'Int32', 'factor'};
    {'GlobalAlphaFactorfSUN';
      'Float32', 'factor'};
    {'GlobalAlphaFactordSUN';
      'Float64', 'factor'};
    {'GlobalAlphaFactorubSUN';
      'UInt8', 'factor'};
    {'GlobalAlphaFactorusSUN';
      'UInt16', 'factor'};
    {'GlobalAlphaFactoruiSUN';
      'UInt32', 'factor'};
  };
}
