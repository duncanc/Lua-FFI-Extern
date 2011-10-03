return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLsizei = "int";
    GLboolean = "unsigned char";
    GLenum = "unsigned int";
  };
  typeAliases = {
    BufferTargetARB = "GLenum";
    UInt32 = "GLuint";
    SizeI = "GLsizei";
    Boolean = "GLboolean";
  };
  magicNumbers = {
    TRANSFORM_FEEDBACK_NV = 0x8E22;
    TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV = 0x8E23;
    TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV = 0x8E24;
    TRANSFORM_FEEDBACK_BINDING_NV = 0x8E25;
  };
  funcs = {
    {'BindTransformFeedbackNV';
      'BufferTargetARB', 'target';
      'UInt32', 'id'};
    {'DeleteTransformFeedbacksNV';
      'SizeI', 'n';
      'const UInt32*', 'ids'};
    {'GenTransformFeedbacksNV';
      'SizeI', 'n';
      'UInt32*', 'ids'};
    {'IsTransformFeedbackNV', ret='Boolean';
      'UInt32', 'id'};
    {'PauseTransformFeedbackNV'};
    {'ResumeTransformFeedbackNV'};
    {'DrawTransformFeedbackNV';
      'GLenum', 'mode';
      'UInt32', 'id'};
  };
}
