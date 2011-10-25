
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.types'

ffi.cdef [[
  
  sfPostFX* sfPostFX_CreateFromFile(const char* Filename);
  sfPostFX* sfPostFX_CreateFromMemory(const char* Effect);
  void sfPostFX_Destroy(sfPostFX* PostFX);
  void sfPostFX_SetParameter1(sfPostFX* PostFX, const char* Name, float X);
  void sfPostFX_SetParameter2(sfPostFX* PostFX, const char* Name, float X, float Y);
  void sfPostFX_SetParameter3(sfPostFX* PostFX, const char* Name, float X, float Y, float Z);
  void sfPostFX_SetParameter4(sfPostFX* PostFX, const char* Name, float X, float Y, float Z, float W);
  void sfPostFX_SetTexture(sfPostFX* PostFX, const char* Name, sfImage* Texture);
  sfBool sfPostFX_CanUsePostFX();
  
]]
