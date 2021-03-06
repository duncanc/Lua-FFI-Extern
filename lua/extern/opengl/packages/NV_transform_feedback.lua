return {
  basicTypes = {
    GLenum = "unsigned int";
    GLuint = "unsigned int";
    GLint = "int";
    GLintptr = "ptrdiff_t";
    GLsizeiptr = "ptrdiff_t";
    GLsizei = "int";
    GLchar = "char";
  };
  magicNumbers = {
    BACK_PRIMARY_COLOR_NV = 0x8C77;
    BACK_SECONDARY_COLOR_NV = 0x8C78;
    TEXTURE_COORD_NV = 0x8C79;
    CLIP_DISTANCE_NV = 0x8C7A;
    VERTEX_ID_NV = 0x8C7B;
    PRIMITIVE_ID_NV = 0x8C7C;
    GENERIC_ATTRIB_NV = 0x8C7D;
    TRANSFORM_FEEDBACK_ATTRIBS_NV = 0x8C7E;
    TRANSFORM_FEEDBACK_BUFFER_MODE_NV = 0x8C7F;
    MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV = 0x8C80;
    ACTIVE_VARYINGS_NV = 0x8C81;
    ACTIVE_VARYING_MAX_LENGTH_NV = 0x8C82;
    TRANSFORM_FEEDBACK_VARYINGS_NV = 0x8C83;
    TRANSFORM_FEEDBACK_BUFFER_START_NV = 0x8C84;
    TRANSFORM_FEEDBACK_BUFFER_SIZE_NV = 0x8C85;
    TRANSFORM_FEEDBACK_RECORD_NV = 0x8C86;
    PRIMITIVES_GENERATED_NV = 0x8C87;
    TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV = 0x8C88;
    RASTERIZER_DISCARD_NV = 0x8C89;
    MAX_TRANSFORM_FEEDBACK_INTERLEAVED_ATTRIBS_NV = 0x8C8A;
    MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV = 0x8C8B;
    INTERLEAVED_ATTRIBS_NV = 0x8C8C;
    SEPARATE_ATTRIBS_NV = 0x8C8D;
    TRANSFORM_FEEDBACK_BUFFER_NV = 0x8C8E;
    TRANSFORM_FEEDBACK_BUFFER_BINDING_NV = 0x8C8F;
    LAYER_NV = 0x8DAA;
    NEXT_BUFFER_NV = -2;
    SKIP_COMPONENTS4_NV = -3;
    SKIP_COMPONENTS3_NV = -4;
    SKIP_COMPONENTS2_NV = -5;
    SKIP_COMPONENTS1_NV = -6;
  };
  funcs = {
    {'BeginTransformFeedbackNV';
      'GLenum', 'primitiveMode'};
    {'EndTransformFeedbackNV'};
    {'TransformFeedbackAttribsNV';
      'UInt32', 'count';
      'const Int32*', 'attribs';
      'GLenum', 'bufferMode'};
    {'BindBufferRangeNV';
      'GLenum', 'target';
      'UInt32', 'index';
      'UInt32', 'buffer';
      'BufferOffset', 'offset';
      'BufferSize', 'size'};
    {'BindBufferOffsetNV';
      'GLenum', 'target';
      'UInt32', 'index';
      'UInt32', 'buffer';
      'BufferOffset', 'offset'};
    {'BindBufferBaseNV';
      'GLenum', 'target';
      'UInt32', 'index';
      'UInt32', 'buffer'};
    {'TransformFeedbackVaryingsNV';
      'UInt32', 'program';
      'SizeI', 'count';
      'const Int32*', 'locations';
      'GLenum', 'bufferMode'};
    {'ActiveVaryingNV';
      'UInt32', 'program';
      'const Char*', 'name'};
    {'GetVaryingLocationNV', ret='Int32';
      'UInt32', 'program';
      'const Char*', 'name'};
    {'GetActiveVaryingNV';
      'UInt32', 'program';
      'UInt32', 'index';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'SizeI*', 'size';
      'GLenum*', 'type';
      'Char*', 'name'};
    {'GetTransformFeedbackVaryingNV';
      'UInt32', 'program';
      'UInt32', 'index';
      'Int32*', 'location'};
    {'TransformFeedbackStreamAttribsNV';
      'SizeI', 'count';
      'const Int32*', 'attribs';
      'SizeI', 'nbuffers';
      'const Int32*', 'bufstreams';
      'GLenum', 'bufferMode'};
  };
}
