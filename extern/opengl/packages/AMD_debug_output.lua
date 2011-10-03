return {
  basicTypes = {
    GLenum = "unsigned int";
    GLsizei = "int";
    GLuint = "unsigned int";
    GLboolean = "unsigned char";
    GLchar = "char";
    GLvoid = "void";
  };
  magicNumbers = {
    MAX_DEBUG_LOGGED_MESSAGES_AMD = 0x9144;
    DEBUG_LOGGED_MESSAGES_AMD = 0x9145;
    DEBUG_SEVERITY_HIGH_AMD = 0x9146;
    DEBUG_SEVERITY_MEDIUM_AMD = 0x9147;
    DEBUG_SEVERITY_LOW_AMD = 0x9148;
    DEBUG_CATEGORY_API_ERROR_AMD = 0x9149;
    DEBUG_CATEGORY_WINDOW_SYSTEM_AMD = 0x914A;
    DEBUG_CATEGORY_DEPRECATION_AMD = 0x914B;
    DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD = 0x914C;
    DEBUG_CATEGORY_PERFORMANCE_AMD = 0x914D;
    DEBUG_CATEGORY_SHADER_COMPILER_AMD = 0x914E;
    DEBUG_CATEGORY_APPLICATION_AMD = 0x914F;
    DEBUG_CATEGORY_OTHER_AMD = 0x9150;
  };
  funcs = {
    {'DebugMessageEnableAMD';
      'GLenum', 'category';
      'GLenum', 'severity';
      'SizeI', 'count';
      'const UInt32*', 'ids';
      'Boolean', 'enabled'};
    {'DebugMessageInsertAMD';
      'GLenum', 'category';
      'GLenum', 'severity';
      'UInt32', 'id';
      'SizeI', 'length';
      'const Char*', 'buf'};
    {'DebugMessageCallbackAMD';
      'GLDEBUGPROCAMD', 'callback';
      'Void', 'userParam'};
    {'GetDebugMessageLogAMD', ret='UInt32';
      'UInt32', 'count';
      'SizeI', 'bufsize';
      'GLenum*', 'categories';
      'UInt32*', 'severities';
      'UInt32*', 'ids';
      'SizeI*', 'lengths';
      'Char*', 'message'};
  };
}
