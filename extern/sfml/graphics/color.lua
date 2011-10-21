
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef struct {
    sfUint8 r, g, b, a;
  } sfColor;

  sfColor sfBlack;
  sfColor sfWhite;
  sfColor sfRed;
  sfColor sfGreen;
  sfColor sfBlue;
  sfColor sfYellow;
  sfColor sfMagenta;
  sfColor sfCyan;

  sfColor sfColor_FromRGB(sfUint8 R, sfUint8 G, sfUint8 B);
  sfColor sfColor_FromRGBA(sfUint8 R, sfUint8 G, sfUint8 B, sfUint8 A);
  sfColor sfColor_Add(sfColor Color1, sfColor Color2);
  sfColor sfColor_Modulate(sfColor Color1, sfColor Color2);

]]
