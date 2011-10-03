return {
  basicTypes = {
    GLint = "int";
    GLsizei = "int";
  };
  typeAliases = {
    Int32 = "GLint";
    SizeI = "GLsizei";
  };
  magicNumbers = {
    INSTRUMENT_BUFFER_POINTER_SGIX = 0x8180;
    INSTRUMENT_MEASUREMENTS_SGIX = 0x8181;
  };
  funcs = {
    {'GetInstrumentsSGIX', ret='Int32'};
    {'InstrumentsBufferSGIX';
      'SizeI', 'size';
      'Int32*', 'buffer'};
    {'PollInstrumentsSGIX', ret='Int32';
      'Int32*', 'marker_p'};
    {'ReadInstrumentsSGIX';
      'Int32', 'marker'};
    {'StartInstrumentsSGIX'};
    {'StopInstrumentsSGIX';
      'Int32', 'marker'};
  };
}
