return {
  basicTypes = {
    GLsizei = "int";
    GLuint = "unsigned int";
    GLboolean = "unsigned char";
    GLenum = "unsigned int";
    GLint = "int";
  };
  typeAliases = {
    SizeI = "GLsizei";
    UInt32 = "GLuint";
    Boolean = "GLboolean";
    OcclusionQueryParameterNameNV = "GLenum";
    Int32 = "GLint";
  };
  magicNumbers = {
    PIXEL_COUNTER_BITS_NV = 0x8864;
    CURRENT_OCCLUSION_QUERY_ID_NV = 0x8865;
    PIXEL_COUNT_NV = 0x8866;
    PIXEL_COUNT_AVAILABLE_NV = 0x8867;
  };
  funcs = {
    {'GenOcclusionQueriesNV';
      'SizeI', 'n';
      'UInt32*', 'ids'};
    {'DeleteOcclusionQueriesNV';
      'SizeI', 'n';
      'const UInt32*', 'ids'};
    {'IsOcclusionQueryNV', ret='Boolean';
      'UInt32', 'id'};
    {'BeginOcclusionQueryNV';
      'UInt32', 'id'};
    {'EndOcclusionQueryNV'};
    {'GetOcclusionQueryivNV';
      'UInt32', 'id';
      'OcclusionQueryParameterNameNV', 'pname';
      'Int32*', 'params'};
    {'GetOcclusionQueryuivNV';
      'UInt32', 'id';
      'OcclusionQueryParameterNameNV', 'pname';
      'UInt32*', 'params'};
  };
}
