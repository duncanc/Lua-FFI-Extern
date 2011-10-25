
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef struct {
    unsigned int Width, Height, BitsPerPixel;
  } sfVideoMode;

  sfVideoMode sfVideoMode_GetDesktopMode();
  sfVideoMode sfVideoMode_GetMode(size_t Index);
  size_t sfVideoMode_GetModesCount();
  sfBool sfVideoMode_IsValid(sfVideoMode Mode);
  
]]
