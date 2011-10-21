
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  void sfSleep(float Duration);

]]
