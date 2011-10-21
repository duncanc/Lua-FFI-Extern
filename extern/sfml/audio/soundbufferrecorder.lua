
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.audio.types'

ffi.cdef [[

  sfSoundBufferRecorder* sfSoundBufferRecorder_Create();
  void sfSoundBufferRecorder_Destroy(sfSoundBufferRecorder*);
  void sfSoundBufferRecorder_Start(sfSoundBufferRecorder*, unsigned int SampleRate);
  void sfSoundBufferRecorder_Stop(sfSoundBufferRecorder*);
  unsigned int sfSoundBufferRecorder_GetSampleRate(sfSoundBufferRecorder*);
  sfSoundBuffer* sfSoundBufferRecorder_GetBuffer(sfSoundBufferRecorder*);

]]
