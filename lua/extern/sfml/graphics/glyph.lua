
local ffi = require 'ffi'

require 'extern.sfml.graphics.rect'

ffi.cdef [[

  typedef struct {
    int         Advance;
    sfIntRect   Rectangle;
    sfFloatRect TexCoords;
  } sfGlyph;
  
]]
