
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.audio.types'

ffi.cdef [[

  typedef sfBool (*sfSoundRecorderStartCallback)(void*);
  typedef sfBool (*sfSoundRecorderProcessCallback)(const sfInt16*, size_t, void*);
  typedef void   (*sfSoundRecorderStopCallback)(void*);

  sfSoundRecorder* sfSoundRecorder_Create(sfSoundRecorderStartCallback   OnStart,
                                          sfSoundRecorderProcessCallback OnProcess,
                                          sfSoundRecorderStopCallback    OnStop,
                                          void*                          UserData);
  void sfSoundRecorder_Destroy(sfSoundRecorder* SoundRecorder);
  void sfSoundRecorder_Start(sfSoundRecorder* SoundRecorder, unsigned int SampleRate);
  void sfSoundRecorder_Stop(sfSoundRecorder* SoundRecorder);
  unsigned int sfSoundRecorder_GetSampleRate(sfSoundRecorder* SoundRecorder);
  sfBool sfSoundRecorder_CanCapture();

]]
