return {
  basicTypes = {
    GLenum = "unsigned int";
    GLint = "int";
    GLintptr = "ptrdiff_t";
    GLsizeiptr = "ptrdiff_t";
  };
  magicNumbers = {
    BUFFER_SERIALIZED_MODIFY_APPLE = 0x8A12;
    BUFFER_FLUSHING_UNMAP_APPLE = 0x8A13;
  };
  funcs = {
    {'BufferParameteriAPPLE';
      'GLenum', 'target';
      'GLenum', 'pname';
      'Int32', 'param'};
    {'FlushMappedBufferRangeAPPLE';
      'GLenum', 'target';
      'BufferOffset', 'offset';
      'BufferSize', 'size'};
  };
}
