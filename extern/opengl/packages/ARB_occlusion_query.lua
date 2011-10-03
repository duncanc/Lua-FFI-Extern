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
    Int32 = "GLint";
  };
  magicNumbers = {
    QUERY_COUNTER_BITS_ARB = 0x8864;
    CURRENT_QUERY_ARB = 0x8865;
    QUERY_RESULT_ARB = 0x8866;
    QUERY_RESULT_AVAILABLE_ARB = 0x8867;
    SAMPLES_PASSED_ARB = 0x8914;
  };
  funcs = {
    {'GenQueriesARB';
      'SizeI', 'n';
      'UInt32*', 'ids'};
    {'DeleteQueriesARB';
      'SizeI', 'n';
      'const UInt32*', 'ids'};
    {'IsQueryARB', ret='Boolean';
      'UInt32', 'id'};
    {'BeginQueryARB';
      'GLenum', 'target';
      'UInt32', 'id'};
    {'EndQueryARB';
      'GLenum', 'target'};
    {'GetQueryivARB';
      'GLenum', 'target';
      'GLenum', 'pname';
      'Int32*', 'params'};
    {'GetQueryObjectivARB';
      'UInt32', 'id';
      'GLenum', 'pname';
      'Int32*', 'params'};
    {'GetQueryObjectuivARB';
      'UInt32', 'id';
      'GLenum', 'pname';
      'UInt32*', 'params'};
  };
}
