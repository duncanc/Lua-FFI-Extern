return {
  basicTypes = {
    GLuint = "unsigned int";
    GLsizei = "int";
    GLubyte = "unsigned char";
    GLfloat = "float";
    GLdouble = "double";
  };
  typeAliases = {
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    UInt8 = "GLubyte";
    Float32 = "GLfloat";
    Float64 = "GLdouble";
  };
  magicNumbers = {
    MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV = 0x8868;
    FRAGMENT_PROGRAM_NV = 0x8870;
    MAX_TEXTURE_COORDS_NV = 0x8871;
    MAX_TEXTURE_IMAGE_UNITS_NV = 0x8872;
    FRAGMENT_PROGRAM_BINDING_NV = 0x8873;
    PROGRAM_ERROR_STRING_NV = 0x8874;
  };
  funcs = {
    {'ProgramNamedParameter4fNV';
      'UInt32', 'id';
      'SizeI', 'len';
      'const UInt8*', 'name';
      'Float32', 'x';
      'Float32', 'y';
      'Float32', 'z';
      'Float32', 'w'};
    {'ProgramNamedParameter4dNV';
      'UInt32', 'id';
      'SizeI', 'len';
      'const UInt8*', 'name';
      'Float64', 'x';
      'Float64', 'y';
      'Float64', 'z';
      'Float64', 'w'};
    {'ProgramNamedParameter4fvNV';
      'UInt32', 'id';
      'SizeI', 'len';
      'const UInt8*', 'name';
      'const Float32*', 'v'};
    {'ProgramNamedParameter4dvNV';
      'UInt32', 'id';
      'SizeI', 'len';
      'const UInt8*', 'name';
      'const Float64*', 'v'};
    {'GetProgramNamedParameterfvNV';
      'UInt32', 'id';
      'SizeI', 'len';
      'const UInt8*', 'name';
      'Float32*', 'params'};
    {'GetProgramNamedParameterdvNV';
      'UInt32', 'id';
      'SizeI', 'len';
      'const UInt8*', 'name';
      'Float64*', 'params'};
  };
}
