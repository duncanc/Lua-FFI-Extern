
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef enum {
    sfBlendAlpha,
    sfBlendAdd,
    sfBlendMultiply,
    sfBlendNone
  } sfBlendMode;

]]
