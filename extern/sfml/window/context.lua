
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.window.types'

ffi.cdef [[

  sfContext* sfContext_Create();
  void sfContext_Destroy(sfContext* Context);
  void sfContext_SetActive(sfContext* Context, sfBool Active);

]]
