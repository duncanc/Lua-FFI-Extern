
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[
  
  void sfListener_SetGlobalVolume(float Volume);
  float sfListener_GetGlobalVolume();
  void sfListener_SetPosition(float PosX, float PosY, float PosZ);
  void sfListener_GetPosition(float* PosX, float* PosY, float* PosZ);
  void sfListener_SetTarget(float TargetX, float TargetY, float TargetZ);
  void sfListener_GetTarget(float* TargetX, float* TargetY, float* TargetZ);
  
]]
