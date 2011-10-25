
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.system.types'

ffi.cdef [[

  sfThread* sfThread_Create(void (*Function)(void*), void* UserData);
  void sfThread_Destroy(sfThread* Thread);
  void sfThread_Launch(sfThread* Thread);
  void sfThread_Wait(sfThread* Thread);
  void sfThread_Terminate(sfThread* Thread);
  
]]
