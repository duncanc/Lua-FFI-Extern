
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  void sfRandom_SetSeed(unsigned int Seed);
  unsigned int sfRandom_GetSeed();
  float sfRandom_Float(float Begin, float End);
  int sfRandom_Int(int Begin, int End);

]]
