
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.audio.soundstatus'
require 'extern.sfml.audio.types'

ffi.cdef [[

  sfSound* sfSound_Create();
  void sfSound_Destroy(sfSound* Sound);
  void sfSound_Play(sfSound* Sound);
  void sfSound_Pause(sfSound* Sound);
  void sfSound_Stop(sfSound* Sound);
  void sfSound_SetBuffer(sfSound* Sound, sfSoundBuffer* Buffer);
  sfSoundBuffer* sfSound_GetBuffer(sfSound* Sound);
  void sfSound_SetLoop(sfSound* Sound, sfBool Loop);
  sfBool sfSound_GetLoop(sfSound* Sound);
  sfSoundStatus sfSound_GetStatus(sfSound* Sound);
  void sfSound_SetPitch(sfSound* Sound, float Pitch);
  void sfSound_SetVolume(sfSound* Sound, float Volume);
  void sfSound_SetPosition(sfSound* Sound, float X, float Y, float Z);
  void sfSound_SetRelativeToListener(sfSound* Sound, sfBool Relative);
  void sfSound_SetMinDistance(sfSound* Sound, float MinDistance);
  void sfSound_SetAttenuation(sfSound* Sound, float Attenuation);
  void sfSound_SetPlayingOffset(sfSound* Sound, float TimeOffset);
  float sfSound_GetPitch(sfSound* Sound);
  float sfSound_GetVolume(sfSound* Sound);
  void sfSound_GetPosition(sfSound* Sound, float* X, float* Y, float* Z);
  sfBool sfSound_IsRelativeToListener(sfSound* Sound);
  float sfSound_GetMinDistance(sfSound* Sound);
  float sfSound_GetAttenuation(sfSound* Sound);
  float sfSound_GetPlayingOffset(sfSound* Sound);

]]
