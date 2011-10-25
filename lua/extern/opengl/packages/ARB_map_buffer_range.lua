return {
  basicTypes = {
    GLvoid = "void";
    GLenum = "unsigned int";
    GLintptr = "ptrdiff_t";
    GLsizeiptr = "ptrdiff_t";
    GLbitfield = "unsigned int";
  };
  typeAliases = {
    VoidPointer = "GLvoid*";
    BufferTargetARB = "GLenum";
    BufferOffset = "GLintptr";
    BufferSize = "GLsizeiptr";
    BufferAccessMask = "GLbitfield";
  };
  magicNumbers = {
    MAP_READ_BIT = 0x0001;
    MAP_WRITE_BIT = 0x0002;
    MAP_INVALIDATE_RANGE_BIT = 0x0004;
    MAP_INVALIDATE_BUFFER_BIT = 0x0008;
    MAP_FLUSH_EXPLICIT_BIT = 0x0010;
    MAP_UNSYNCHRONIZED_BIT = 0x0020;
  };
  funcs = {
    {'MapBufferRange', ret='VoidPointer';
      'BufferTargetARB', 'target';
      'BufferOffset', 'offset';
      'BufferSize', 'length';
      'BufferAccessMask', 'access'};
    {'FlushMappedBufferRange';
      'BufferTargetARB', 'target';
      'BufferOffset', 'offset';
      'BufferSize', 'length'};
  };
}
