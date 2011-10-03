return {
  basicTypes = {
    GLsync = "struct __GLsync*";
    GLenum = "unsigned int";
    GLbitfield = "unsigned int";
    GLboolean = "unsigned char";
    GLuint64 = "uint64_t";
    GLint64 = "int64_t";
    GLsizei = "int";
    GLint = "int";
  };
  typeAliases = {
    sync = "GLsync";
    Boolean = "GLboolean";
    UInt64 = "GLuint64";
    Int64 = "GLint64";
    SizeI = "GLsizei";
    Int32 = "GLint";
  };
  magicNumbers = {
    MAX_SERVER_WAIT_TIMEOUT = 0x9111;
    OBJECT_TYPE = 0x9112;
    SYNC_CONDITION = 0x9113;
    SYNC_STATUS = 0x9114;
    SYNC_FLAGS = 0x9115;
    SYNC_FENCE = 0x9116;
    SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
    UNSIGNALED = 0x9118;
    SIGNALED = 0x9119;
    ALREADY_SIGNALED = 0x911A;
    TIMEOUT_EXPIRED = 0x911B;
    CONDITION_SATISFIED = 0x911C;
    WAIT_FAILED = 0x911D;
    SYNC_FLUSH_COMMANDS_BIT = 0x00000001;
    TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFFull;
  };
  funcs = {
    {'FenceSync', ret='sync';
      'GLenum', 'condition';
      'GLbitfield', 'flags'};
    {'IsSync', ret='Boolean';
      'sync', 'sync'};
    {'DeleteSync';
      'sync', 'sync'};
    {'ClientWaitSync', ret='GLenum';
      'sync', 'sync';
      'GLbitfield', 'flags';
      'UInt64', 'timeout'};
    {'WaitSync';
      'sync', 'sync';
      'GLbitfield', 'flags';
      'UInt64', 'timeout'};
    {'GetInteger64v';
      'GLenum', 'pname';
      'Int64*', 'params'};
    {'GetSynciv';
      'sync', 'sync';
      'GLenum', 'pname';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'Int32*', 'values'};
  };
}
