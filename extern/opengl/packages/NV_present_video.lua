return {
  basicTypes = {
    GLuint = "unsigned int";
    GLuint64EXT = "uint64_t";
    GLenum = "unsigned int";
    GLint = "int";
    GLint64EXT = "int64_t";
  };
  typeAliases = {
    UInt32 = "GLuint";
    UInt64EXT = "GLuint64EXT";
    Int32 = "GLint";
    Int64EXT = "GLint64EXT";
  };
  magicNumbers = {
    FRAME_NV = 0x8E26;
    FIELDS_NV = 0x8E27;
    CURRENT_TIME_NV = 0x8E28;
    NUM_FILL_STREAMS_NV = 0x8E29;
    PRESENT_TIME_NV = 0x8E2A;
    PRESENT_DURATION_NV = 0x8E2B;
  };
  funcs = {
    {'PresentFrameKeyedNV';
      'UInt32', 'video_slot';
      'UInt64EXT', 'minPresentTime';
      'UInt32', 'beginPresentTimeId';
      'UInt32', 'presentDurationId';
      'GLenum', 'type';
      'GLenum', 'target0';
      'UInt32', 'fill0';
      'UInt32', 'key0';
      'GLenum', 'target1';
      'UInt32', 'fill1';
      'UInt32', 'key1'};
    {'PresentFrameDualFillNV';
      'UInt32', 'video_slot';
      'UInt64EXT', 'minPresentTime';
      'UInt32', 'beginPresentTimeId';
      'UInt32', 'presentDurationId';
      'GLenum', 'type';
      'GLenum', 'target0';
      'UInt32', 'fill0';
      'GLenum', 'target1';
      'UInt32', 'fill1';
      'GLenum', 'target2';
      'UInt32', 'fill2';
      'GLenum', 'target3';
      'UInt32', 'fill3'};
    {'GetVideoivNV';
      'UInt32', 'video_slot';
      'GLenum', 'pname';
      'Int32*', 'params'};
    {'GetVideouivNV';
      'UInt32', 'video_slot';
      'GLenum', 'pname';
      'UInt32*', 'params'};
    {'GetVideoi64vNV';
      'UInt32', 'video_slot';
      'GLenum', 'pname';
      'Int64EXT*', 'params'};
    {'GetVideoui64vNV';
      'UInt32', 'video_slot';
      'GLenum', 'pname';
      'UInt64EXT*', 'params'};
  };
}
