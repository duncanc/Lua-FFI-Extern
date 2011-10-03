return {
  basicTypes = {
    GLuint = "unsigned int";
    GLint = "int";
    GLsizei = "int";
    GLboolean = "unsigned char";
  };
  typeAliases = {
    UInt32 = "GLuint";
    Int32 = "GLint";
    SizeI = "GLsizei";
    Boolean = "GLboolean";
  };
  magicNumbers = {
    ASYNC_MARKER_SGIX = 0x8329;
  };
  funcs = {
    {'AsyncMarkerSGIX';
      'UInt32', 'marker'};
    {'FinishAsyncSGIX', ret='Int32';
      'UInt32*', 'markerp'};
    {'PollAsyncSGIX', ret='Int32';
      'UInt32*', 'markerp'};
    {'GenAsyncMarkersSGIX', ret='UInt32';
      'SizeI', 'range'};
    {'DeleteAsyncMarkersSGIX';
      'UInt32', 'marker';
      'SizeI', 'range'};
    {'IsAsyncMarkerSGIX', ret='Boolean';
      'UInt32', 'marker'};
  };
}
