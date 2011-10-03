return {
  basicTypes = {
    GLsizei = "int";
    GLuint = "unsigned int";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLint = "int";
    GLclampf = "float";
  };
  typeAliases = {
    SizeI = "GLsizei";
    UInt32 = "GLuint";
    Void = "GLvoid";
    Int32 = "GLint";
    ClampedFloat32 = "GLclampf";
  };
  magicNumbers = {
    FIXED = 0x140C;
    IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
    IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
    LOW_FLOAT = 0x8DF0;
    MEDIUM_FLOAT = 0x8DF1;
    HIGH_FLOAT = 0x8DF2;
    LOW_INT = 0x8DF3;
    MEDIUM_INT = 0x8DF4;
    HIGH_INT = 0x8DF5;
    SHADER_COMPILER = 0x8DFA;
    NUM_SHADER_BINARY_FORMATS = 0x8DF9;
    MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
    MAX_VARYING_VECTORS = 0x8DFC;
    MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
  };
  funcs = {
    {'ReleaseShaderCompiler'};
    {'ShaderBinary';
      'SizeI', 'count';
      'const UInt32*', 'shaders';
      'GLenum', 'binaryformat';
      'const Void*', 'binary';
      'SizeI', 'length'};
    {'GetShaderPrecisionFormat';
      'GLenum', 'shadertype';
      'GLenum', 'precisiontype';
      'Int32*', 'range';
      'Int32*', 'precision'};
    {'DepthRangef';
      'ClampedFloat32', 'n';
      'ClampedFloat32', 'f'};
    {'ClearDepthf';
      'ClampedFloat32', 'd'};
  };
}
