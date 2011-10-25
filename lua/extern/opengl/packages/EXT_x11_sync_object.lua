return {
  basicTypes = {
    GLsync = "struct __GLsync*";
    GLenum = "unsigned int";
    GLintptr = "ptrdiff_t";
    GLbitfield = "unsigned int";
  };
  typeAliases = {
    sync = "GLsync";
    Intptr = "GLintptr";
  };
  magicNumbers = {
    SYNC_X11_FENCE_EXT = 0x90E1;
  };
  funcs = {
    {'ImportSyncEXT', ret='sync';
      'GLenum', 'external_sync_type';
      'Intptr', 'external_sync';
      'GLbitfield', 'flags'};
  };
}
