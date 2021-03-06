return {
  basicTypes = {
    GLuint = "unsigned int";
    GLsizei = "int";
    GLchar = "char";
    GLenum = "unsigned int";
    GLint = "int";
    GLchar = "char";
  };
  typeAliases = {
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    CharPointer = "GLchar*";
    Int32 = "GLint";
    Char = "GLchar";
  };
  magicNumbers = {
    UNIFORM_BUFFER = 0x8A11;
    UNIFORM_BUFFER_BINDING = 0x8A28;
    UNIFORM_BUFFER_START = 0x8A29;
    UNIFORM_BUFFER_SIZE = 0x8A2A;
    MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
    MAX_GEOMETRY_UNIFORM_BLOCKS = 0x8A2C;
    MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
    MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
    MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
    MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
    MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
    MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32;
    MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
    UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
    ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35;
    ACTIVE_UNIFORM_BLOCKS = 0x8A36;
    UNIFORM_TYPE = 0x8A37;
    UNIFORM_SIZE = 0x8A38;
    UNIFORM_NAME_LENGTH = 0x8A39;
    UNIFORM_BLOCK_INDEX = 0x8A3A;
    UNIFORM_OFFSET = 0x8A3B;
    UNIFORM_ARRAY_STRIDE = 0x8A3C;
    UNIFORM_MATRIX_STRIDE = 0x8A3D;
    UNIFORM_IS_ROW_MAJOR = 0x8A3E;
    UNIFORM_BLOCK_BINDING = 0x8A3F;
    UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
    UNIFORM_BLOCK_NAME_LENGTH = 0x8A41;
    UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
    UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
    UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
    UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45;
    UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
    INVALID_INDEX = 0xFFFFFFFF;
  };
  funcs = {
    {'GetUniformIndices';
      'UInt32', 'program';
      'SizeI', 'uniformCount';
      'const CharPointer*', 'uniformNames';
      'UInt32*', 'uniformIndices'};
    {'GetActiveUniformsiv';
      'UInt32', 'program';
      'SizeI', 'uniformCount';
      'const UInt32*', 'uniformIndices';
      'GLenum', 'pname';
      'Int32*', 'params'};
    {'GetActiveUniformName';
      'UInt32', 'program';
      'UInt32', 'uniformIndex';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'Char*', 'uniformName'};
    {'GetUniformBlockIndex', ret='UInt32';
      'UInt32', 'program';
      'const Char*', 'uniformBlockName'};
    {'GetActiveUniformBlockiv';
      'UInt32', 'program';
      'UInt32', 'uniformBlockIndex';
      'GLenum', 'pname';
      'Int32*', 'params'};
    {'GetActiveUniformBlockName';
      'UInt32', 'program';
      'UInt32', 'uniformBlockIndex';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'Char*', 'uniformBlockName'};
    {'UniformBlockBinding';
      'UInt32', 'program';
      'UInt32', 'uniformBlockIndex';
      'UInt32', 'uniformBlockBinding'};
  };
}
