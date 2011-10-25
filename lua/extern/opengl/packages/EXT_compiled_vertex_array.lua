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
    ARRAY_ELEMENT_LOCK_FIRST_EXT = 0x81A8;
    ARRAY_ELEMENT_LOCK_COUNT_EXT = 0x81A9;
  };
  funcs = {
    {'LockArraysEXT';
      'Int32', 'first';
      'SizeI', 'count'};
    {'UnlockArraysEXT'};
  };
}
