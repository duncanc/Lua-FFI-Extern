return {
  basicTypes = {
    GLsync = "struct __GLsync*";
    GLbitfield = "unsigned int";
  };
  typeAliases = {
    sync = "GLsync";
    cl_context = "struct _cl_context *";
    cl_event = "struct _cl_event *";
  };
  magicNumbers = {
    SYNC_CL_EVENT_ARB = 0x8240;
    SYNC_CL_EVENT_COMPLETE_ARB = 0x8241;
  };
  funcs = {
    {'CreateSyncFromCLeventARB', ret='sync';
      'cl_context', 'context';
      'cl_event', 'event';
      'GLbitfield', 'flags'};
  };
}
