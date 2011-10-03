return {
  basicTypes = {
    GLint = "int";
    GLsizei = "int";
    GLuint = "unsigned int";
    GLchar = "char";
    GLenum = "unsigned int";
    GLvoid = "void";
    GLboolean = "unsigned char";
  };
  typeAliases = {
    Int32 = "GLint";
    SizeI = "GLsizei";
    UInt32 = "GLuint";
    Char = "GLchar";
    Void = "GLvoid";
    Boolean = "GLboolean";
  };
  magicNumbers = {
    COUNTER_TYPE_AMD = 0x8BC0;
    COUNTER_RANGE_AMD = 0x8BC1;
    UNSIGNED_INT64_AMD = 0x8BC2;
    PERCENTAGE_AMD = 0x8BC3;
    PERFMON_RESULT_AVAILABLE_AMD = 0x8BC4;
    PERFMON_RESULT_SIZE_AMD = 0x8BC5;
    PERFMON_RESULT_AMD = 0x8BC6;
  };
  funcs = {
    {'GetPerfMonitorGroupsAMD';
      'Int32*', 'numGroups';
      'SizeI', 'groupsSize';
      'UInt32*', 'groups'};
    {'GetPerfMonitorCountersAMD';
      'UInt32', 'group';
      'Int32*', 'numCounters';
      'Int32*', 'maxActiveCounters';
      'SizeI', 'counterSize';
      'UInt32*', 'counters'};
    {'GetPerfMonitorGroupStringAMD';
      'UInt32', 'group';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'Char*', 'groupString'};
    {'GetPerfMonitorCounterStringAMD';
      'UInt32', 'group';
      'UInt32', 'counter';
      'SizeI', 'bufSize';
      'SizeI*', 'length';
      'Char*', 'counterString'};
    {'GetPerfMonitorCounterInfoAMD';
      'UInt32', 'group';
      'UInt32', 'counter';
      'GLenum', 'pname';
      'Void*', 'data'};
    {'GenPerfMonitorsAMD';
      'SizeI', 'n';
      'UInt32*', 'monitors'};
    {'DeletePerfMonitorsAMD';
      'SizeI', 'n';
      'UInt32*', 'monitors'};
    {'SelectPerfMonitorCountersAMD';
      'UInt32', 'monitor';
      'Boolean', 'enable';
      'UInt32', 'group';
      'Int32', 'numCounters';
      'UInt32*', 'counterList'};
    {'BeginPerfMonitorAMD';
      'UInt32', 'monitor'};
    {'EndPerfMonitorAMD';
      'UInt32', 'monitor'};
    {'GetPerfMonitorCounterDataAMD';
      'UInt32', 'monitor';
      'GLenum', 'pname';
      'SizeI', 'dataSize';
      'UInt32*', 'data';
      'Int32*', 'bytesWritten'};
  };
}
