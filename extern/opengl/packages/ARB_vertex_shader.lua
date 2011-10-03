return {
  basicTypes = {
    GLhandleARB = "unsigned int";
    GLuint = "unsigned int";
    GLcharARB = "char";
    GLsizei = "int";
    GLint = "int";
    GLenum = "unsigned int";
  };
  typeAliases = {
    handleARB = "GLhandleARB";
    UInt32 = "GLuint";
    charARB = "GLcharARB";
    SizeI = "GLsizei";
    Int32 = "GLint";
  };
  magicNumbers = {
    VERTEX_SHADER_ARB = 0x8B31;
    MAX_VERTEX_UNIFORM_COMPONENTS_ARB = 0x8B4A;
    MAX_VARYING_FLOATS_ARB = 0x8B4B;
    MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = 0x8B4C;
    MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB = 0x8B4D;
    OBJECT_ACTIVE_ATTRIBUTES_ARB = 0x8B89;
    OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB = 0x8B8A;
  };
  funcs = {
    {'BindAttribLocationARB';
      'handleARB', 'programObj';
      'UInt32', 'index';
      'const charARB*', 'name'};
    {'GetActiveAttribARB';
      'handleARB', 'programObj';
      'UInt32', 'index';
      'SizeI', 'maxLength';
      'SizeI*', 'length';
      'Int32*', 'size';
      'GLenum*', 'type';
      'charARB*', 'name'};
    {'GetAttribLocationARB', ret='Int32';
      'handleARB', 'programObj';
      'const charARB*', 'name'};
  };
}
