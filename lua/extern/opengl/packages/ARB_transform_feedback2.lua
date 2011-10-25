return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLsizei = "int";
    GLboolean = "unsigned char";
  };
  magicNumbers = {
    TRANSFORM_FEEDBACK = 0x8E22;
    TRANSFORM_FEEDBACK_BUFFER_PAUSED = 0x8E23;
    TRANSFORM_FEEDBACK_BUFFER_ACTIVE = 0x8E24;
    TRANSFORM_FEEDBACK_BINDING = 0x8E25;
  };
  funcs = {
    {'BindTransformFeedback';
      'GLenum', 'target';
      'UInt32', 'id'};
    {'DeleteTransformFeedbacks';
      'SizeI', 'n';
      'const UInt32*', 'ids'};
    {'GenTransformFeedbacks';
      'SizeI', 'n';
      'UInt32*', 'ids'};
    {'IsTransformFeedback', ret='Boolean';
      'UInt32', 'id'};
    {'PauseTransformFeedback'};
    {'ResumeTransformFeedback'};
    {'DrawTransformFeedback';
      'GLenum', 'mode';
      'UInt32', 'id'};
  };
}
