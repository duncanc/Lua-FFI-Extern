return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLint = "int";
  };
  magicNumbers = {
    MAX_TRANSFORM_FEEDBACK_BUFFERS = 0x8E70;
    MAX_VERTEX_STREAMS = 0x8E71;
  };
  funcs = {
    {'DrawTransformFeedbackStream';
      'GLenum', 'mode';
      'UInt32', 'id';
      'UInt32', 'stream'};
    {'BeginQueryIndexed';
      'GLenum', 'target';
      'UInt32', 'index';
      'UInt32', 'id'};
    {'EndQueryIndexed';
      'GLenum', 'target';
      'UInt32', 'index'};
    {'GetQueryIndexediv';
      'GLenum', 'target';
      'UInt32', 'index';
      'GLenum', 'pname';
      'Int32*', 'params'};
  };
}
