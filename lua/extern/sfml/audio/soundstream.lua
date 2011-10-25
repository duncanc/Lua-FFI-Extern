
require 'extern.sfml.config'
require 'extern.sfml.audio.soundstatus'
require 'extern.sfml.audio.types'

ffi.cdef [[

  typedef struct {
    sfInt16*     Samples;
    unsigned int NbSamples;
  } sfSoundStreamChunk;

  typedef sfBool (*sfSoundStreamStartCallback)(void*);
  typedef sfBool (*sfSoundStreamGetDataCallback)(sfSoundStreamChunk*, void*);

  sfSoundStream* sfSoundStream_Create(sfSoundStreamStartCallback   OnStart,
                                      sfSoundStreamGetDataCallback OnGetData,
                                      unsigned int                 ChannelsCount,
                                      unsigned int                 SampleRate,
                                      void*                        UserData);
  void sfSoundStream_Destroy(sfSoundStream* SoundStreamStream);
  void sfSoundStream_Play(sfSoundStream* SoundStream);
  void sfSoundStream_Pause(sfSoundStream* SoundStream);
  void sfSoundStream_Stop(sfSoundStream* SoundStream);
  sfSoundStatus sfSoundStream_GetStatus(sfSoundStream* SoundStream);
  unsigned int sfSoundStream_GetChannelsCount(sfSoundStream* SoundStream);
  unsigned int sfSoundStream_GetSampleRate(sfSoundStream* SoundStream);
  void sfSoundStream_SetPitch(sfSoundStream* SoundStream, float Pitch);
  void sfSoundStream_SetVolume(sfSoundStream* SoundStream, float Volume);
  void sfSoundStream_SetPosition(sfSoundStream* SoundStream, float X, float Y, float Z);
  void sfSoundStream_SetRelativeToListener(sfSoundStream* SoundStream, sfBool Relative);
  void sfSoundStream_SetMinDistance(sfSoundStream* SoundStream, float MinDistance);
  void sfSoundStream_SetAttenuation(sfSoundStream* SoundStream, float Attenuation);
  void sfSoundStream_SetLoop(sfSoundStream* SoundStream, sfBool Loop);
  float sfSoundStream_GetPitch(sfSoundStream* SoundStream);
  float sfSoundStream_GetVolume(sfSoundStream* SoundStream);
  void sfSoundStream_GetPosition(sfSoundStream* SoundStream, float* X, float* Y, float* Z);
  sfBool sfSoundStream_IsRelativeToListener(sfSoundStream* SoundStream);
  float sfSoundStream_GetMinDistance(sfSoundStream* SoundStream);
  float sfSoundStream_GetAttenuation(sfSoundStream* SoundStream);
  sfBool sfSoundStream_GetLoop(sfSoundStream* SoundStream);
  float sfSoundStream_GetPlayingOffset(sfSoundStream* SoundStream);

]]