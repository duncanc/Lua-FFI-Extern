
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.audio.soundstatus'
require 'extern.sfml.audio.types'

ffi.cdef [[
  
  sfMusic* sfMusic_CreateFromFile(const char* Filename);
  sfMusic* sfMusic_CreateFromMemory(const char* Data, size_t SizeInBytes);
  void sfMusic_Destroy(sfMusic* Music);
  void sfMusic_SetLoop(sfMusic* Music, sfBool Loop);
  sfBool sfMusic_GetLoop(sfMusic* Music);
  float sfMusic_GetDuration(sfMusic* Music);
  void sfMusic_Play(sfMusic* Music);
  void sfMusic_Pause(sfMusic* Music);
  void sfMusic_Stop(sfMusic* Music);
  unsigned int sfMusic_GetChannelsCount(sfMusic* Music);
  unsigned int sfMusic_GetSampleRate(sfMusic* Music);
  sfSoundStatus sfMusic_GetStatus(sfMusic* Music);
  float sfMusic_GetPlayingOffset(sfMusic* Music);
  void sfMusic_SetPitch(sfMusic* Music, float Pitch);
  void sfMusic_SetVolume(sfMusic* Music, float Volume);
  void sfMusic_SetPosition(sfMusic* Music, float X, float Y, float Z);
  void sfMusic_SetRelativeToListener(sfMusic* Music, sfBool Relative);
  void sfMusic_SetMinDistance(sfMusic* Music, float MinDistance);
  void sfMusic_SetAttenuation(sfMusic* Music, float Attenuation);
  float sfMusic_GetPitch(sfMusic* Music);
  float sfMusic_GetVolume(sfMusic* Music);
  void sfMusic_GetPosition(sfMusic* Music, float* X, float* Y, float* Z);
  sfBool sfMusic_IsRelativeToListener(sfMusic* Music);
  float sfMusic_GetMinDistance(sfMusic* Music);
  float sfMusic_GetAttenuation(sfMusic* Music);
  
]]
