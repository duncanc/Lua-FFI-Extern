
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.system.types'

ffi.cdef [[

  sfMutex* sfMutex_Create();
  void sfMutex_Destroy(sfMutex* Mutex);
  void sfMutex_Lock(sfMutex* Mutex);
  void sfMutex_Unlock(sfMutex* Mutex);

]]
