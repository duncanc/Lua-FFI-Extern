return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLchar = "char";
    GLuint = "unsigned int";
    GLsizei = "int";
    GLchar = "char";
    GLboolean = "unsigned char";
  };
  magicNumbers = {
    SHADER_INCLUDE_ARB = 0x8DAE;
    NAMED_STRING_LENGTH_ARB = 0x8DE9;
    NAMED_STRING_TYPE_ARB = 0x8DEA;
  };
  funcs = {
    {'NamedStringARB';
      'GLenum', 'type';
      'Int32', 'namelen';
      'const Char*', 'name';
      'Int32', 'stringlen';
      'const Char*', 'string'};
    {'DeleteNamedStringARB';
      'Int32', 'namelen';
      'const Char*', 'name'};
    {'CompileShaderIncludeARB';
      'UInt32', 'shader';
      'SizeI', 'count';
      'const CharPointer*', 'path';
      'const Int32*', 'length'};
    {'IsNamedStringARB', ret='Boolean';
      'Int32', 'namelen';
      'const Char*', 'name'};
    {'GetNamedStringARB';
      'Int32', 'namelen';
      'const Char*', 'name';
      'SizeI', 'bufSize';
      'Int32*', 'stringlen';
      'Char*', 'string'};
    {'GetNamedStringivARB';
      'Int32', 'namelen';
      'const Char*', 'name';
      'GLenum', 'pname';
      'Int32*', 'params'};
  };
}
