
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.system.types'

ffi.cdef [[

  sfClock* sfClock_Create();
  void sfClock_Destroy(sfClock* Clock);
  float sfClock_GetTime(sfClock* Clock);
  void sfClock_Reset(sfClock* Clock);
  
]]
