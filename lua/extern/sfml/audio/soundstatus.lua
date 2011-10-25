
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef enum {
    sfStopped,
    sfPaused,
    sfPlaying
  } sfSoundStatus;

]]
