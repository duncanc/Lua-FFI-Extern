return {
  basicTypes = {
    GLenum = "unsigned int";
    GLintptr = "ptrdiff_t";
    GLsizeiptr = "ptrdiff_t";
  };
  magicNumbers = {
    COPY_READ_BUFFER = 0x8F36;
    COPY_WRITE_BUFFER = 0x8F37;
  };
  funcs = {
    {'CopyBufferSubData';
      'GLenum', 'readTarget';
      'GLenum', 'writeTarget';
      'BufferOffset', 'readOffset';
      'BufferOffset', 'writeOffset';
      'BufferSize', 'size'};
  };
}
