return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLint = "int";
  };
  magicNumbers = {
    BUFFER_OBJECT_APPLE = 0x85B3;
    RELEASED_APPLE = 0x8A19;
    VOLATILE_APPLE = 0x8A1A;
    RETAINED_APPLE = 0x8A1B;
    UNDEFINED_APPLE = 0x8A1C;
    PURGEABLE_APPLE = 0x8A1D;
  };
  funcs = {
    {'ObjectPurgeableAPPLE', ret='GLenum';
      'GLenum', 'objectType';
      'UInt32', 'name';
      'GLenum', 'option'};
    {'ObjectUnpurgeableAPPLE', ret='GLenum';
      'GLenum', 'objectType';
      'UInt32', 'name';
      'GLenum', 'option'};
    {'GetObjectParameterivAPPLE';
      'GLenum', 'objectType';
      'UInt32', 'name';
      'GLenum', 'pname';
      'Int32*', 'params'};
  };
}
