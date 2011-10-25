
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.audio.types'

ffi.cdef [[

  sfSoundBuffer* sfSoundBuffer_CreateFromFile(const char* Filename);
  sfSoundBuffer* sfSoundBuffer_CreateFromMemory(const char* Data, size_t SizeInBytes);
  sfSoundBuffer* sfSoundBuffer_CreateFromSamples(const sfInt16* Samples, size_t SamplesCount, unsigned int ChannelsCount, unsigned int SampleRate);
  void sfSoundBuffer_Destroy(sfSoundBuffer* SoundBuffer);
  sfBool sfSoundBuffer_SaveToFile(sfSoundBuffer* SoundBuffer, const char* Filename);
  const sfInt16* sfSoundBuffer_GetSamples(sfSoundBuffer* SoundBuffer);
  size_t sfSoundBuffer_GetSamplesCount(sfSoundBuffer* SoundBuffer);
  unsigned int sfSoundBuffer_GetSampleRate(sfSoundBuffer* SoundBuffer);
  unsigned int sfSoundBuffer_GetChannelsCount(sfSoundBuffer* SoundBuffer);
  float sfSoundBuffer_GetDuration(sfSoundBuffer* SoundBuffer);

]]
