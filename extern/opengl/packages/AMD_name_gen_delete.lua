return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLboolean = "unsigned char";
  };
  magicNumbers = {
    DATA_BUFFER_AMD = 0x9151;
    PERFORMANCE_MONITOR_AMD = 0x9152;
    QUERY_OBJECT_AMD = 0x9153;
    VERTEX_ARRAY_OBJECT_AMD = 0x9154;
    SAMPLER_OBJECT_AMD = 0x9155;
  };
  funcs = {
    {'GenNamesAMD';
      'GLenum', 'identifier';
      'UInt32', 'num';
      'UInt32*', 'names'};
    {'DeleteNamesAMD';
      'GLenum', 'identifier';
      'UInt32', 'num';
      'const UInt32*', 'names'};
    {'IsNameAMD', ret='Boolean';
      'GLenum', 'identifier';
      'UInt32', 'name'};
  };
}
