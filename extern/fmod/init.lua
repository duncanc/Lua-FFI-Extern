
local ffi = require 'ffi'

ffi.cdef [[

  enum { FMOD_VERSION = 0x00043604 };

  typedef int                       FMOD_BOOL;
  typedef struct FMOD_SYSTEM        FMOD_SYSTEM;
  typedef struct FMOD_SOUND         FMOD_SOUND;
  typedef struct FMOD_CHANNEL       FMOD_CHANNEL;
  typedef struct FMOD_CHANNELGROUP  FMOD_CHANNELGROUP;
  typedef struct FMOD_SOUNDGROUP    FMOD_SOUNDGROUP;
  typedef struct FMOD_REVERB        FMOD_REVERB;
  typedef struct FMOD_DSP           FMOD_DSP;
  typedef struct FMOD_DSPCONNECTION FMOD_DSPCONNECTION;
  typedef struct FMOD_POLYGON		  FMOD_POLYGON;
  typedef struct FMOD_GEOMETRY	  FMOD_GEOMETRY;
  typedef struct FMOD_SYNCPOINT	  FMOD_SYNCPOINT;
  typedef unsigned int              FMOD_MODE;
  typedef unsigned int              FMOD_TIMEUNIT;
  typedef unsigned int              FMOD_INITFLAGS;
  typedef unsigned int              FMOD_CAPS;
  typedef unsigned int              FMOD_DEBUGLEVEL;
  typedef unsigned int              FMOD_MEMORY_TYPE;

  typedef enum {
    FMOD_OK,
    FMOD_ERR_ALREADYLOCKED,
    FMOD_ERR_BADCOMMAND,
    FMOD_ERR_CDDA_DRIVERS,
    FMOD_ERR_CDDA_INIT,
    FMOD_ERR_CDDA_INVALID_DEVICE,
    FMOD_ERR_CDDA_NOAUDIO,
    FMOD_ERR_CDDA_NODEVICES,
    FMOD_ERR_CDDA_NODISC,
    FMOD_ERR_CDDA_READ,
    FMOD_ERR_CHANNEL_ALLOC,
    FMOD_ERR_CHANNEL_STOLEN,
    FMOD_ERR_COM,
    FMOD_ERR_DMA,
    FMOD_ERR_DSP_CONNECTION,
    FMOD_ERR_DSP_FORMAT,
    FMOD_ERR_DSP_NOTFOUND,
    FMOD_ERR_DSP_RUNNING,
    FMOD_ERR_DSP_TOOMANYCONNECTIONS,
    FMOD_ERR_FILE_BAD,
    FMOD_ERR_FILE_COULDNOTSEEK,
    FMOD_ERR_FILE_DISKEJECTED,
    FMOD_ERR_FILE_EOF,
    FMOD_ERR_FILE_NOTFOUND,
    FMOD_ERR_FILE_UNWANTED,
    FMOD_ERR_FORMAT,
    FMOD_ERR_HTTP,
    FMOD_ERR_HTTP_ACCESS,
    FMOD_ERR_HTTP_PROXY_AUTH,
    FMOD_ERR_HTTP_SERVER_ERROR,
    FMOD_ERR_HTTP_TIMEOUT,
    FMOD_ERR_INITIALIZATION,
    FMOD_ERR_INITIALIZED,
    FMOD_ERR_INTERNAL,
    FMOD_ERR_INVALID_ADDRESS,
    FMOD_ERR_INVALID_FLOAT,
    FMOD_ERR_INVALID_HANDLE,
    FMOD_ERR_INVALID_PARAM,
    FMOD_ERR_INVALID_POSITION,
    FMOD_ERR_INVALID_SPEAKER,
    FMOD_ERR_INVALID_SYNCPOINT,
    FMOD_ERR_INVALID_VECTOR,
    FMOD_ERR_MAXAUDIBLE,
    FMOD_ERR_MEMORY,
    FMOD_ERR_MEMORY_CANTPOINT,
    FMOD_ERR_MEMORY_SRAM,
    FMOD_ERR_NEEDS2D,
    FMOD_ERR_NEEDS3D,
    FMOD_ERR_NEEDSHARDWARE,
    FMOD_ERR_NEEDSSOFTWARE,
    FMOD_ERR_NET_CONNECT,
    FMOD_ERR_NET_SOCKET_ERROR,
    FMOD_ERR_NET_URL,
    FMOD_ERR_NET_WOULD_BLOCK,
    FMOD_ERR_NOTREADY,
    FMOD_ERR_OUTPUT_ALLOCATED,
    FMOD_ERR_OUTPUT_CREATEBUFFER,
    FMOD_ERR_OUTPUT_DRIVERCALL,
    FMOD_ERR_OUTPUT_ENUMERATION,
    FMOD_ERR_OUTPUT_FORMAT,
    FMOD_ERR_OUTPUT_INIT,
    FMOD_ERR_OUTPUT_NOHARDWARE,
    FMOD_ERR_OUTPUT_NOSOFTWARE,
    FMOD_ERR_PAN,
    FMOD_ERR_PLUGIN,
    FMOD_ERR_PLUGIN_INSTANCES,
    FMOD_ERR_PLUGIN_MISSING,
    FMOD_ERR_PLUGIN_RESOURCE,
    FMOD_ERR_PRELOADED,
    FMOD_ERR_PROGRAMMERSOUND,
    FMOD_ERR_RECORD,
    FMOD_ERR_REVERB_INSTANCE,
    FMOD_ERR_SUBSOUND_ALLOCATED,
    FMOD_ERR_SUBSOUND_CANTMOVE,
    FMOD_ERR_SUBSOUND_MODE,
    FMOD_ERR_SUBSOUNDS,
    FMOD_ERR_TAGNOTFOUND,
    FMOD_ERR_TOOMANYCHANNELS,
    FMOD_ERR_UNIMPLEMENTED,
    FMOD_ERR_UNINITIALIZED,
    FMOD_ERR_UNSUPPORTED,
    FMOD_ERR_UPDATE,
    FMOD_ERR_VERSION,

    FMOD_ERR_EVENT_FAILED,
    FMOD_ERR_EVENT_INFOONLY,
    FMOD_ERR_EVENT_INTERNAL,
    FMOD_ERR_EVENT_MAXSTREAMS,
    FMOD_ERR_EVENT_MISMATCH,
    FMOD_ERR_EVENT_NAMECONFLICT,
    FMOD_ERR_EVENT_NOTFOUND,
    FMOD_ERR_EVENT_NEEDSSIMPLE,
    FMOD_ERR_EVENT_GUIDCONFLICT,
    FMOD_ERR_EVENT_ALREADY_LOADED,

    FMOD_ERR_MUSIC_UNINITIALIZED,
    FMOD_ERR_MUSIC_NOTFOUND,
    FMOD_ERR_MUSIC_NOCALLBACK,

    FMOD_RESULT_FORCEINT = 65536
  } FMOD_RESULT;

  typedef struct {
    float x, y, z;
  } FMOD_VECTOR;

  typedef struct {
    unsigned int   Data1;
    unsigned short Data2;
    unsigned short Data3;
    unsigned char  Data4[8];
  } FMOD_GUID;

  typedef struct {
    void           *handle;
    unsigned int    offset;
    unsigned int    sizebytes;
    int             priority;

    void           *buffer;
    unsigned int    bytesread;
    FMOD_RESULT     result;

    void           *userdata;
  } FMOD_ASYNCREADINFO;

  typedef enum {
    FMOD_OUTPUTTYPE_AUTODETECT,

    FMOD_OUTPUTTYPE_UNKNOWN,
    FMOD_OUTPUTTYPE_NOSOUND,
    FMOD_OUTPUTTYPE_WAVWRITER,
    FMOD_OUTPUTTYPE_NOSOUND_NRT,
    FMOD_OUTPUTTYPE_WAVWRITER_NRT,

    FMOD_OUTPUTTYPE_DSOUND,
    FMOD_OUTPUTTYPE_WINMM,
    FMOD_OUTPUTTYPE_WASAPI,
    FMOD_OUTPUTTYPE_ASIO,
    FMOD_OUTPUTTYPE_OSS,
    FMOD_OUTPUTTYPE_ALSA,
    FMOD_OUTPUTTYPE_ESD,
    FMOD_OUTPUTTYPE_PULSEAUDIO,
    FMOD_OUTPUTTYPE_COREAUDIO,
    FMOD_OUTPUTTYPE_XBOX360,
    FMOD_OUTPUTTYPE_PSP,
    FMOD_OUTPUTTYPE_PS3,
    FMOD_OUTPUTTYPE_NGP,
    FMOD_OUTPUTTYPE_WII,			
    FMOD_OUTPUTTYPE_3DS,
    FMOD_OUTPUTTYPE_AUDIOTRACK,
    FMOD_OUTPUTTYPE_OPENSL,

    FMOD_OUTPUTTYPE_MAX,
    FMOD_OUTPUTTYPE_FORCEINT = 65536
  } FMOD_OUTPUTTYPE;

  enum {
    FMOD_CAPS_NONE                   = 0x00000000,
    FMOD_CAPS_HARDWARE               = 0x00000001,
    FMOD_CAPS_HARDWARE_EMULATED      = 0x00000002,
    FMOD_CAPS_OUTPUT_MULTICHANNEL    = 0x00000004,
    FMOD_CAPS_OUTPUT_FORMAT_PCM8     = 0x00000008,
    FMOD_CAPS_OUTPUT_FORMAT_PCM16    = 0x00000010,
    FMOD_CAPS_OUTPUT_FORMAT_PCM24    = 0x00000020,
    FMOD_CAPS_OUTPUT_FORMAT_PCM32    = 0x00000040,
    FMOD_CAPS_OUTPUT_FORMAT_PCMFLOAT = 0x00000080,
    FMOD_CAPS_REVERB_LIMITED         = 0x00002000,

    FMOD_DEBUG_LEVEL_NONE           = 0x00000000,
    FMOD_DEBUG_LEVEL_LOG            = 0x00000001,
    FMOD_DEBUG_LEVEL_ERROR          = 0x00000002,
    FMOD_DEBUG_LEVEL_WARNING        = 0x00000004,
    FMOD_DEBUG_LEVEL_HINT           = 0x00000008,
    FMOD_DEBUG_LEVEL_ALL            = 0x000000FF,
    FMOD_DEBUG_TYPE_MEMORY          = 0x00000100,
    FMOD_DEBUG_TYPE_THREAD          = 0x00000200,
    FMOD_DEBUG_TYPE_FILE            = 0x00000400,
    FMOD_DEBUG_TYPE_NET             = 0x00000800,
    FMOD_DEBUG_TYPE_EVENT           = 0x00001000,
    FMOD_DEBUG_TYPE_ALL             = 0x0000FFFF,
    FMOD_DEBUG_DISPLAY_TIMESTAMPS   = 0x01000000,
    FMOD_DEBUG_DISPLAY_LINENUMBERS  = 0x02000000,
    FMOD_DEBUG_DISPLAY_COMPRESS     = 0x04000000,
    FMOD_DEBUG_DISPLAY_THREAD       = 0x08000000,
    FMOD_DEBUG_DISPLAY_ALL          = 0x0F000000,
    FMOD_DEBUG_ALL                  = 0xFFFFFFFF,

    FMOD_MEMORY_NORMAL             = 0x00000000,
    FMOD_MEMORY_STREAM_FILE        = 0x00000001,
    FMOD_MEMORY_STREAM_DECODE      = 0x00000002,
    FMOD_MEMORY_SAMPLEDATA         = 0x00000004,
    FMOD_MEMORY_DSP_OUTPUTBUFFER   = 0x00000008,
    FMOD_MEMORY_XBOX360_PHYSICAL   = 0x00100000,
    FMOD_MEMORY_PERSISTENT         = 0x00200000,
    FMOD_MEMORY_SECONDARY          = 0x00400000,
    FMOD_MEMORY_ALL                = 0xFFFFFFFF
  };

  typedef enum {
    FMOD_SPEAKERMODE_RAW,
    FMOD_SPEAKERMODE_MONO,
    FMOD_SPEAKERMODE_STEREO,
    FMOD_SPEAKERMODE_QUAD,
    FMOD_SPEAKERMODE_SURROUND,
    FMOD_SPEAKERMODE_5POINT1,
    FMOD_SPEAKERMODE_7POINT1,

    FMOD_SPEAKERMODE_PROLOGIC,
    FMOD_SPEAKERMODE_MYEARS,

    FMOD_SPEAKERMODE_MAX,
    FMOD_SPEAKERMODE_FORCEINT = 65536
  } FMOD_SPEAKERMODE;

  typedef enum {
    FMOD_SPEAKER_FRONT_LEFT,
    FMOD_SPEAKER_FRONT_RIGHT,
    FMOD_SPEAKER_FRONT_CENTER,
    FMOD_SPEAKER_LOW_FREQUENCY,
    FMOD_SPEAKER_BACK_LEFT,
    FMOD_SPEAKER_BACK_RIGHT,
    FMOD_SPEAKER_SIDE_LEFT,
    FMOD_SPEAKER_SIDE_RIGHT,

    FMOD_SPEAKER_MAX,
    FMOD_SPEAKER_MONO        = FMOD_SPEAKER_FRONT_LEFT,
    FMOD_SPEAKER_NULL        = FMOD_SPEAKER_MAX,
    FMOD_SPEAKER_SBL         = FMOD_SPEAKER_SIDE_LEFT,
    FMOD_SPEAKER_SBR         = FMOD_SPEAKER_SIDE_RIGHT,
    FMOD_SPEAKER_FORCEINT    = 65536
  } FMOD_SPEAKER;

  typedef enum {
    FMOD_PLUGINTYPE_OUTPUT,
    FMOD_PLUGINTYPE_CODEC,
    FMOD_PLUGINTYPE_DSP,

    FMOD_PLUGINTYPE_MAX,
    FMOD_PLUGINTYPE_FORCEINT = 65536
  } FMOD_PLUGINTYPE;
  
  enum {
    FMOD_INIT_NORMAL                     = 0x00000000,
    FMOD_INIT_STREAM_FROM_UPDATE         = 0x00000001,
    FMOD_INIT_3D_RIGHTHANDED             = 0x00000002,
    FMOD_INIT_SOFTWARE_DISABLE           = 0x00000004,
    FMOD_INIT_SOFTWARE_OCCLUSION         = 0x00000008,
    FMOD_INIT_SOFTWARE_HRTF              = 0x00000010,
    FMOD_INIT_DISTANCE_FILTERING         = 0x00000200,
    FMOD_INIT_SOFTWARE_REVERB_LOWMEM     = 0x00000040,
    FMOD_INIT_ENABLE_PROFILE             = 0x00000020,
    FMOD_INIT_VOL0_BECOMES_VIRTUAL       = 0x00000080,
    FMOD_INIT_WASAPI_EXCLUSIVE           = 0x00000100,
    FMOD_INIT_PS3_PREFERDTS              = 0x00800000,
    FMOD_INIT_PS3_FORCE2CHLPCM           = 0x01000000,
    FMOD_INIT_DISABLEDOLBY               = 0x00100000,
    FMOD_INIT_SYSTEM_MUSICMUTENOTPAUSE   = 0x00200000,
    FMOD_INIT_SYNCMIXERWITHUPDATE        = 0x00400000,
    FMOD_INIT_GEOMETRY_USECLOSEST        = 0x04000000,
    FMOD_INIT_DISABLE_MYEARS_AUTODETECT  = 0x08000000
  };

  typedef enum {
    FMOD_SOUND_TYPE_UNKNOWN,
    FMOD_SOUND_TYPE_AIFF,
    FMOD_SOUND_TYPE_ASF,
    FMOD_SOUND_TYPE_AT3,
    FMOD_SOUND_TYPE_CDDA,
    FMOD_SOUND_TYPE_DLS,
    FMOD_SOUND_TYPE_FLAC,
    FMOD_SOUND_TYPE_FSB,
    FMOD_SOUND_TYPE_GCADPCM,
    FMOD_SOUND_TYPE_IT,
    FMOD_SOUND_TYPE_MIDI,
    FMOD_SOUND_TYPE_MOD,
    FMOD_SOUND_TYPE_MPEG,
    FMOD_SOUND_TYPE_OGGVORBIS,
    FMOD_SOUND_TYPE_PLAYLIST,
    FMOD_SOUND_TYPE_RAW,
    FMOD_SOUND_TYPE_S3M,
    FMOD_SOUND_TYPE_SF2,
    FMOD_SOUND_TYPE_USER,
    FMOD_SOUND_TYPE_WAV,
    FMOD_SOUND_TYPE_XM,
    FMOD_SOUND_TYPE_XMA,
    FMOD_SOUND_TYPE_VAG,
    FMOD_SOUND_TYPE_AUDIOQUEUE,
    FMOD_SOUND_TYPE_XWMA,
    FMOD_SOUND_TYPE_BCWAV,
    FMOD_SOUND_TYPE_AT9,

    FMOD_SOUND_TYPE_MAX,
    FMOD_SOUND_TYPE_FORCEINT = 65536
  } FMOD_SOUND_TYPE;

  typedef enum {
    FMOD_SOUND_FORMAT_NONE,
    FMOD_SOUND_FORMAT_PCM8,
    FMOD_SOUND_FORMAT_PCM16,
    FMOD_SOUND_FORMAT_PCM24,
    FMOD_SOUND_FORMAT_PCM32,
    FMOD_SOUND_FORMAT_PCMFLOAT,
    FMOD_SOUND_FORMAT_GCADPCM,
    FMOD_SOUND_FORMAT_IMAADPCM,
    FMOD_SOUND_FORMAT_VAG,
    FMOD_SOUND_FORMAT_HEVAG,
    FMOD_SOUND_FORMAT_XMA,
    FMOD_SOUND_FORMAT_MPEG,
    FMOD_SOUND_FORMAT_CELT,

    FMOD_SOUND_FORMAT_MAX,
    FMOD_SOUND_FORMAT_FORCEINT = 65536
  } FMOD_SOUND_FORMAT;

  enum {
    FMOD_DEFAULT                   = 0x00000000,
    FMOD_LOOP_OFF                  = 0x00000001,
    FMOD_LOOP_NORMAL               = 0x00000002,
    FMOD_LOOP_BIDI                 = 0x00000004,
    FMOD_2D                        = 0x00000008,
    FMOD_3D                        = 0x00000010,
    FMOD_HARDWARE                  = 0x00000020,
    FMOD_SOFTWARE                  = 0x00000040,
    FMOD_CREATESTREAM              = 0x00000080,
    FMOD_CREATESAMPLE              = 0x00000100,
    FMOD_CREATECOMPRESSEDSAMPLE    = 0x00000200,
    FMOD_OPENUSER                  = 0x00000400,
    FMOD_OPENMEMORY                = 0x00000800,
    FMOD_OPENMEMORY_POINT          = 0x10000000,
    FMOD_OPENRAW                   = 0x00001000,
    FMOD_OPENONLY                  = 0x00002000,
    FMOD_ACCURATETIME              = 0x00004000,
    FMOD_MPEGSEARCH                = 0x00008000,
    FMOD_NONBLOCKING               = 0x00010000,
    FMOD_UNIQUE                    = 0x00020000,
    FMOD_3D_HEADRELATIVE           = 0x00040000,
    FMOD_3D_WORLDRELATIVE          = 0x00080000,
    FMOD_3D_INVERSEROLLOFF         = 0x00100000,
    FMOD_3D_LINEARROLLOFF          = 0x00200000,
    FMOD_3D_LINEARSQUAREROLLOFF    = 0x00400000,
    FMOD_3D_CUSTOMROLLOFF          = 0x04000000,
    FMOD_3D_IGNOREGEOMETRY         = 0x40000000,
    FMOD_UNICODE                   = 0x01000000,
    FMOD_IGNORETAGS                = 0x02000000,
    FMOD_LOWMEM                    = 0x08000000,
    FMOD_LOADSECONDARYRAM          = 0x20000000,
    FMOD_VIRTUAL_PLAYFROMSTART     = 0x80000000
  };

  typedef enum {
    FMOD_OPENSTATE_READY = 0,
    FMOD_OPENSTATE_LOADING,
    FMOD_OPENSTATE_ERROR,
    FMOD_OPENSTATE_CONNECTING,
    FMOD_OPENSTATE_BUFFERING,
    FMOD_OPENSTATE_SEEKING,
    FMOD_OPENSTATE_PLAYING,
    FMOD_OPENSTATE_SETPOSITION,

    FMOD_OPENSTATE_MAX,
    FMOD_OPENSTATE_FORCEINT = 65536
  } FMOD_OPENSTATE;

  typedef enum {
    FMOD_SOUNDGROUP_BEHAVIOR_FAIL,
    FMOD_SOUNDGROUP_BEHAVIOR_MUTE,
    FMOD_SOUNDGROUP_BEHAVIOR_STEALLOWEST,

    FMOD_SOUNDGROUP_BEHAVIOR_MAX,
    FMOD_SOUNDGROUP_BEHAVIOR_FORCEINT = 65536
  } FMOD_SOUNDGROUP_BEHAVIOR;

  typedef enum {
    FMOD_CHANNEL_CALLBACKTYPE_END,
    FMOD_CHANNEL_CALLBACKTYPE_VIRTUALVOICE,
    FMOD_CHANNEL_CALLBACKTYPE_SYNCPOINT,
    FMOD_CHANNEL_CALLBACKTYPE_OCCLUSION,

    FMOD_CHANNEL_CALLBACKTYPE_MAX,
    FMOD_CHANNEL_CALLBACKTYPE_FORCEINT = 65536
  } FMOD_CHANNEL_CALLBACKTYPE;
  
  typedef enum {
    FMOD_SYSTEM_CALLBACKTYPE_DEVICELISTCHANGED,
    FMOD_SYSTEM_CALLBACKTYPE_DEVICELOST,
    FMOD_SYSTEM_CALLBACKTYPE_MEMORYALLOCATIONFAILED,
    FMOD_SYSTEM_CALLBACKTYPE_THREADCREATED,
    FMOD_SYSTEM_CALLBACKTYPE_BADDSPCONNECTION,
    FMOD_SYSTEM_CALLBACKTYPE_BADDSPLEVEL,

    FMOD_SYSTEM_CALLBACKTYPE_MAX,
    FMOD_SYSTEM_CALLBACKTYPE_FORCEINT = 65536
  } FMOD_SYSTEM_CALLBACKTYPE;

  typedef FMOD_RESULT ( *FMOD_SYSTEM_CALLBACK)       (FMOD_SYSTEM *system, FMOD_SYSTEM_CALLBACKTYPE type, void *commanddata1, void *commanddata2);

  typedef FMOD_RESULT ( *FMOD_CHANNEL_CALLBACK)      (FMOD_CHANNEL *channel, FMOD_CHANNEL_CALLBACKTYPE type, void *commanddata1, void *commanddata2);

  typedef FMOD_RESULT ( *FMOD_SOUND_NONBLOCKCALLBACK)(FMOD_SOUND *sound, FMOD_RESULT result);
  typedef FMOD_RESULT ( *FMOD_SOUND_PCMREADCALLBACK)(FMOD_SOUND *sound, void *data, unsigned int datalen);
  typedef FMOD_RESULT ( *FMOD_SOUND_PCMSETPOSCALLBACK)(FMOD_SOUND *sound, int subsound, unsigned int position, FMOD_TIMEUNIT postype);

  typedef FMOD_RESULT ( *FMOD_FILE_OPENCALLBACK)     (const char *name, int unicode, unsigned int *filesize, void **handle, void **userdata);
  typedef FMOD_RESULT ( *FMOD_FILE_CLOSECALLBACK)    (void *handle, void *userdata);
  typedef FMOD_RESULT ( *FMOD_FILE_READCALLBACK)     (void *handle, void *buffer, unsigned int sizebytes, unsigned int *bytesread, void *userdata);
  typedef FMOD_RESULT ( *FMOD_FILE_SEEKCALLBACK)     (void *handle, unsigned int pos, void *userdata);
  typedef FMOD_RESULT ( *FMOD_FILE_ASYNCREADCALLBACK)(FMOD_ASYNCREADINFO *info, void *userdata);
  typedef FMOD_RESULT ( *FMOD_FILE_ASYNCCANCELCALLBACK)(void *handle, void *userdata);

  typedef void *      ( *FMOD_MEMORY_ALLOCCALLBACK)  (unsigned int size, FMOD_MEMORY_TYPE type, const char *sourcestr);
  typedef void *      ( *FMOD_MEMORY_REALLOCCALLBACK)(void *ptr, unsigned int size, FMOD_MEMORY_TYPE type, const char *sourcestr);
  typedef void        ( *FMOD_MEMORY_FREECALLBACK)   (void *ptr, FMOD_MEMORY_TYPE type, const char *sourcestr);

  typedef float       ( *FMOD_3D_ROLLOFFCALLBACK)    (FMOD_CHANNEL *channel, float distance);

  typedef enum {
    FMOD_DSP_FFT_WINDOW_RECT,
    FMOD_DSP_FFT_WINDOW_TRIANGLE,
    FMOD_DSP_FFT_WINDOW_HAMMING,
    FMOD_DSP_FFT_WINDOW_HANNING,
    FMOD_DSP_FFT_WINDOW_BLACKMAN,
    FMOD_DSP_FFT_WINDOW_BLACKMANHARRIS,

    FMOD_DSP_FFT_WINDOW_MAX,
    FMOD_DSP_FFT_WINDOW_FORCEINT = 65536
  } FMOD_DSP_FFT_WINDOW;

  typedef enum {
    FMOD_DSP_RESAMPLER_NOINTERP,
    FMOD_DSP_RESAMPLER_LINEAR,
    FMOD_DSP_RESAMPLER_CUBIC,
    FMOD_DSP_RESAMPLER_SPLINE,

    FMOD_DSP_RESAMPLER_MAX,
    FMOD_DSP_RESAMPLER_FORCEINT = 65536
  } FMOD_DSP_RESAMPLER;

  typedef enum {
    FMOD_TAGTYPE_UNKNOWN = 0,
    FMOD_TAGTYPE_ID3V1,
    FMOD_TAGTYPE_ID3V2,
    FMOD_TAGTYPE_VORBISCOMMENT,
    FMOD_TAGTYPE_SHOUTCAST,
    FMOD_TAGTYPE_ICECAST,
    FMOD_TAGTYPE_ASF,
    FMOD_TAGTYPE_MIDI,
    FMOD_TAGTYPE_PLAYLIST,
    FMOD_TAGTYPE_FMOD,
    FMOD_TAGTYPE_USER,

    FMOD_TAGTYPE_MAX,
    FMOD_TAGTYPE_FORCEINT = 65536
  } FMOD_TAGTYPE;

  typedef enum {
    FMOD_TAGDATATYPE_BINARY = 0,
    FMOD_TAGDATATYPE_INT,
    FMOD_TAGDATATYPE_FLOAT,
    FMOD_TAGDATATYPE_STRING,
    FMOD_TAGDATATYPE_STRING_UTF16,
    FMOD_TAGDATATYPE_STRING_UTF16BE,
    FMOD_TAGDATATYPE_STRING_UTF8,
    FMOD_TAGDATATYPE_CDTOC,

    FMOD_TAGDATATYPE_MAX,
    FMOD_TAGDATATYPE_FORCEINT = 65536
  } FMOD_TAGDATATYPE;

  typedef enum {
    FMOD_DELAYTYPE_END_MS,
    FMOD_DELAYTYPE_DSPCLOCK_START,
    FMOD_DELAYTYPE_DSPCLOCK_END,
    FMOD_DELAYTYPE_DSPCLOCK_PAUSE,

    FMOD_DELAYTYPE_MAX,
    FMOD_DELAYTYPE_FORCEINT = 65536
  } FMOD_DELAYTYPE;

  /*
  #define FMOD_64BIT_ADD(_hi1, _lo1, _hi2, _lo2) _hi1 += ((_hi2) + ((((_lo1) + (_lo2)) < (_lo1)) ? 1 : 0)); (_lo1) += (_lo2);
  #define FMOD_64BIT_SUB(_hi1, _lo1, _hi2, _lo2) _hi1 -= ((_hi2) + ((((_lo1) - (_lo2)) > (_lo1)) ? 1 : 0)); (_lo1) -= (_lo2);
  */

  typedef struct FMOD_TAG {
    FMOD_TAGTYPE      type;
    FMOD_TAGDATATYPE  datatype;
    char             *name;
    void             *data;
    unsigned int      datalen;
    FMOD_BOOL         updated;
  } FMOD_TAG;

  typedef struct FMOD_CDTOC {
    int numtracks;
    int min[100];
    int sec[100];
    int frame[100];
  } FMOD_CDTOC;

  enum {
    FMOD_TIMEUNIT_MS                = 0x00000001,
    FMOD_TIMEUNIT_PCM               = 0x00000002,
    FMOD_TIMEUNIT_PCMBYTES          = 0x00000004,
    FMOD_TIMEUNIT_RAWBYTES          = 0x00000008,
    FMOD_TIMEUNIT_PCMFRACTION       = 0x00000010,
    FMOD_TIMEUNIT_MODORDER          = 0x00000100,
    FMOD_TIMEUNIT_MODROW            = 0x00000200,
    FMOD_TIMEUNIT_MODPATTERN        = 0x00000400,
    FMOD_TIMEUNIT_SENTENCE_MS       = 0x00010000,
    FMOD_TIMEUNIT_SENTENCE_PCM      = 0x00020000,
    FMOD_TIMEUNIT_SENTENCE_PCMBYTES = 0x00040000,
    FMOD_TIMEUNIT_SENTENCE          = 0x00080000,
    FMOD_TIMEUNIT_SENTENCE_SUBSOUND = 0x00100000,
    FMOD_TIMEUNIT_BUFFERED          = 0x10000000
  };

  typedef enum {
    FMOD_SPEAKERMAPTYPE_DEFAULT,
    FMOD_SPEAKERMAPTYPE_ALLMONO,
    FMOD_SPEAKERMAPTYPE_ALLSTEREO,
    FMOD_SPEAKERMAPTYPE_51_PROTOOLS
  } FMOD_SPEAKERMAPTYPE;

  typedef struct FMOD_CREATESOUNDEXINFO {
    int                            cbsize;
    unsigned int                   length;
    unsigned int                   fileoffset;
    int                            numchannels;
    int                            defaultfrequency;
    FMOD_SOUND_FORMAT              format;
    unsigned int                   decodebuffersize;
    int                            initialsubsound;
    int                            numsubsounds;
    int                           *inclusionlist;
    int                            inclusionlistnum;
    FMOD_SOUND_PCMREADCALLBACK     pcmreadcallback;
    FMOD_SOUND_PCMSETPOSCALLBACK   pcmsetposcallback;
    FMOD_SOUND_NONBLOCKCALLBACK    nonblockcallback;
    const char                    *dlsname;
    const char                    *encryptionkey;
    int                            maxpolyphony;
    void                          *userdata;
    FMOD_SOUND_TYPE                suggestedsoundtype;
    FMOD_FILE_OPENCALLBACK         useropen;
    FMOD_FILE_CLOSECALLBACK        userclose;
    FMOD_FILE_READCALLBACK         userread;
    FMOD_FILE_SEEKCALLBACK         userseek;
    FMOD_FILE_ASYNCREADCALLBACK    userasyncread;
    FMOD_FILE_ASYNCCANCELCALLBACK  userasynccancel;
    FMOD_SPEAKERMAPTYPE            speakermap;
    FMOD_SOUNDGROUP               *initialsoundgroup;
    unsigned int                   initialseekposition;
    FMOD_TIMEUNIT                  initialseekpostype;
    int                            ignoresetfilesystem;
    int                            cddaforceaspi;
    unsigned int                   audioqueuepolicy;
    unsigned int                   minmidigranularity;
    int                            nonblockthreadid;
  } FMOD_CREATESOUNDEXINFO;

  typedef struct FMOD_REVERB_PROPERTIES {
    int          Instance;
    int          Environment;
    float        EnvDiffusion;
    int          Room;
    int          RoomHF;
    int          RoomLF;
    float        DecayTime;
    float        DecayHFRatio;
    float        DecayLFRatio;
    int          Reflections;
    float        ReflectionsDelay;
    int          Reverb;
    float        ReverbDelay;
    float        ModulationTime;
    float        ModulationDepth;
    float        HFReference;
    float        LFReference;
    float        Diffusion;
    float        Density;
    unsigned int Flags;
  } FMOD_REVERB_PROPERTIES;

  enum {
    FMOD_REVERB_FLAGS_HIGHQUALITYREVERB     = 0x00000400,
    FMOD_REVERB_FLAGS_HIGHQUALITYDPL2REVERB = 0x00000800,
    FMOD_REVERB_FLAGS_DEFAULT               = 0x00000000
  };

  /*
  #define FMOD_PRESET_OFF              {  0, -1,  1.00f, -10000, -10000, 0,   1.00f,  1.00f, 1.0f,  -2602, 0.007f,   200, 0.011f, 0.25f, 0.000f, 5000.0f, 250.0f,   0.0f,   0.0f, 0x33f }
  #define FMOD_PRESET_GENERIC          {  0,  0,  1.00f, -1000,  -100,   0,   1.49f,  0.83f, 1.0f,  -2602, 0.007f,   200, 0.011f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_PADDEDCELL       {  0,  1,  1.00f, -1000,  -6000,  0,   0.17f,  0.10f, 1.0f,  -1204, 0.001f,   207, 0.002f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_ROOM             {  0,  2,  1.00f, -1000,  -454,   0,   0.40f,  0.83f, 1.0f,  -1646, 0.002f,    53, 0.003f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_BATHROOM         {  0,  3,  1.00f, -1000,  -1200,  0,   1.49f,  0.54f, 1.0f,   -370, 0.007f,  1030, 0.011f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f,  60.0f, 0x3f }
  #define FMOD_PRESET_LIVINGROOM       {  0,  4,  1.00f, -1000,  -6000,  0,   0.50f,  0.10f, 1.0f,  -1376, 0.003f, -1104, 0.004f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_STONEROOM        {  0,  5,  1.00f, -1000,  -300,   0,   2.31f,  0.64f, 1.0f,   -711, 0.012f,    83, 0.017f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_AUDITORIUM       {  0,  6,  1.00f, -1000,  -476,   0,   4.32f,  0.59f, 1.0f,   -789, 0.020f,  -289, 0.030f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_CONCERTHALL      {  0,  7,  1.00f, -1000,  -500,   0,   3.92f,  0.70f, 1.0f,  -1230, 0.020f,    -2, 0.029f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_CAVE             {  0,  8,  1.00f, -1000,  0,      0,   2.91f,  1.30f, 1.0f,   -602, 0.015f,  -302, 0.022f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x1f }
  #define FMOD_PRESET_ARENA            {  0,  9,  1.00f, -1000,  -698,   0,   7.24f,  0.33f, 1.0f,  -1166, 0.020f,    16, 0.030f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_HANGAR           {  0,  10, 1.00f, -1000,  -1000,  0,   10.05f, 0.23f, 1.0f,   -602, 0.020f,   198, 0.030f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_CARPETTEDHALLWAY {  0,  11, 1.00f, -1000,  -4000,  0,   0.30f,  0.10f, 1.0f,  -1831, 0.002f, -1630, 0.030f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_HALLWAY          {  0,  12, 1.00f, -1000,  -300,   0,   1.49f,  0.59f, 1.0f,  -1219, 0.007f,   441, 0.011f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_STONECORRIDOR    {  0,  13, 1.00f, -1000,  -237,   0,   2.70f,  0.79f, 1.0f,  -1214, 0.013f,   395, 0.020f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_ALLEY            {  0,  14, 0.30f, -1000,  -270,   0,   1.49f,  0.86f, 1.0f,  -1204, 0.007f,    -4, 0.011f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_FOREST           {  0,  15, 0.30f, -1000,  -3300,  0,   1.49f,  0.54f, 1.0f,  -2560, 0.162f,  -229, 0.088f, 0.25f, 0.000f, 5000.0f, 250.0f,  79.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_CITY             {  0,  16, 0.50f, -1000,  -800,   0,   1.49f,  0.67f, 1.0f,  -2273, 0.007f, -1691, 0.011f, 0.25f, 0.000f, 5000.0f, 250.0f,  50.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_MOUNTAINS        {  0,  17, 0.27f, -1000,  -2500,  0,   1.49f,  0.21f, 1.0f,  -2780, 0.300f, -1434, 0.100f, 0.25f, 0.000f, 5000.0f, 250.0f,  27.0f, 100.0f, 0x1f }
  #define FMOD_PRESET_QUARRY           {  0,  18, 1.00f, -1000,  -1000,  0,   1.49f,  0.83f, 1.0f, -10000, 0.061f,   500, 0.025f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_PLAIN            {  0,  19, 0.21f, -1000,  -2000,  0,   1.49f,  0.50f, 1.0f,  -2466, 0.179f, -1926, 0.100f, 0.25f, 0.000f, 5000.0f, 250.0f,  21.0f, 100.0f, 0x3f }
  #define FMOD_PRESET_PARKINGLOT       {  0,  20, 1.00f, -1000,  0,      0,   1.65f,  1.50f, 1.0f,  -1363, 0.008f, -1153, 0.012f, 0.25f, 0.000f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x1f }
  #define FMOD_PRESET_SEWERPIPE        {  0,  21, 0.80f, -1000,  -1000,  0,   2.81f,  0.14f, 1.0f,    429, 0.014f,  1023, 0.021f, 0.25f, 0.000f, 5000.0f, 250.0f,  80.0f,  60.0f, 0x3f }
  #define FMOD_PRESET_UNDERWATER       {  0,  22, 1.00f, -1000,  -4000,  0,   1.49f,  0.10f, 1.0f,   -449, 0.007f,  1700, 0.011f, 1.18f, 0.348f, 5000.0f, 250.0f, 100.0f, 100.0f, 0x3f }


  #define FMOD_PRESET_PSP_ROOM         {  0,  1,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_STUDIO_A     {  0,  2,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_STUDIO_B     {  0,  3,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_STUDIO_C     {  0,  4,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_HALL         {  0,  5,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_SPACE        {  0,  6,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_ECHO         {  0,  7,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_DELAY        {  0,  8,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  #define FMOD_PRESET_PSP_PIPE         {  0,  9,  0,     0,      0,      0,   0.0f,   0.0f,  0.0f,     0,  0.000f,     0, 0.000f, 0.00f, 0.000f, 0000.0f,   0.0f,  0.0f,    0.0f, 0x31f }
  */

  typedef struct FMOD_REVERB_CHANNELPROPERTIES {
    int          Direct;
    int          Room;
    unsigned int Flags;
    FMOD_DSP    *ConnectionPoint;
  } FMOD_REVERB_CHANNELPROPERTIES;

  enum {
    FMOD_REVERB_CHANNELFLAGS_INSTANCE0     = 0x00000010,
    FMOD_REVERB_CHANNELFLAGS_INSTANCE1     = 0x00000020,
    FMOD_REVERB_CHANNELFLAGS_INSTANCE2     = 0x00000040,
    FMOD_REVERB_CHANNELFLAGS_INSTANCE3     = 0x00000080,

    FMOD_REVERB_CHANNELFLAGS_DEFAULT       = FMOD_REVERB_CHANNELFLAGS_INSTANCE0
  };

  typedef struct FMOD_ADVANCEDSETTINGS {
    int             cbsize;
    int             maxMPEGcodecs;
    int             maxADPCMcodecs;
    int             maxXMAcodecs;
    int             maxCELTcodecs;
    int             maxPCMcodecs;
    int             ASIONumChannels;
    char          **ASIOChannelList;
    FMOD_SPEAKER   *ASIOSpeakerList;
    int             max3DReverbDSPs;
    float           HRTFMinAngle;
    float           HRTFMaxAngle;
    float           HRTFFreq;
    float           vol0virtualvol;
    int             eventqueuesize;
    unsigned int    defaultDecodeBufferSize;
    char           *debugLogFilename;
    unsigned short  profileport;
    unsigned int    geometryMaxFadeTime;
    unsigned int    maxSpectrumWaveDataBuffers;
    unsigned int    musicSystemCacheDelay;
    float           distanceFilterCentreFreq;
  } FMOD_ADVANCEDSETTINGS;

  typedef enum {
    FMOD_CHANNEL_FREE  = -1,
    FMOD_CHANNEL_REUSE = -2
  } FMOD_CHANNELINDEX;

]]

-- codec
ffi.cdef [[

  typedef struct FMOD_CODEC_STATE FMOD_CODEC_STATE;
  typedef struct FMOD_CODEC_WAVEFORMAT FMOD_CODEC_WAVEFORMAT;

  typedef FMOD_RESULT ( *FMOD_CODEC_OPENCALLBACK)        (FMOD_CODEC_STATE *codec_state, FMOD_MODE usermode, FMOD_CREATESOUNDEXINFO *userexinfo);
  typedef FMOD_RESULT ( *FMOD_CODEC_CLOSECALLBACK)       (FMOD_CODEC_STATE *codec_state);
  typedef FMOD_RESULT ( *FMOD_CODEC_READCALLBACK)        (FMOD_CODEC_STATE *codec_state, void *buffer, unsigned int sizebytes, unsigned int *bytesread);
  typedef FMOD_RESULT ( *FMOD_CODEC_GETLENGTHCALLBACK)   (FMOD_CODEC_STATE *codec_state, unsigned int *length, FMOD_TIMEUNIT lengthtype);
  typedef FMOD_RESULT ( *FMOD_CODEC_SETPOSITIONCALLBACK) (FMOD_CODEC_STATE *codec_state, int subsound, unsigned int position, FMOD_TIMEUNIT postype);
  typedef FMOD_RESULT ( *FMOD_CODEC_GETPOSITIONCALLBACK) (FMOD_CODEC_STATE *codec_state, unsigned int *position, FMOD_TIMEUNIT postype);
  typedef FMOD_RESULT ( *FMOD_CODEC_SOUNDCREATECALLBACK) (FMOD_CODEC_STATE *codec_state, int subsound, FMOD_SOUND *sound);
  typedef FMOD_RESULT ( *FMOD_CODEC_METADATACALLBACK)    (FMOD_CODEC_STATE *codec_state, FMOD_TAGTYPE tagtype, char *name, void *data, unsigned int datalen, FMOD_TAGDATATYPE datatype, int unique);
  typedef FMOD_RESULT ( *FMOD_CODEC_GETWAVEFORMAT)       (FMOD_CODEC_STATE *codec_state, int index, FMOD_CODEC_WAVEFORMAT *waveformat);

  typedef struct FMOD_CODEC_DESCRIPTION {
    const char                     *name;
    unsigned int                    version;
    int                             defaultasstream;
    FMOD_TIMEUNIT                   timeunits;
    FMOD_CODEC_OPENCALLBACK         open;
    FMOD_CODEC_CLOSECALLBACK        close;
    FMOD_CODEC_READCALLBACK         read;
    FMOD_CODEC_GETLENGTHCALLBACK    getlength;
    FMOD_CODEC_SETPOSITIONCALLBACK  setposition;
    FMOD_CODEC_GETPOSITIONCALLBACK  getposition;
    FMOD_CODEC_SOUNDCREATECALLBACK  soundcreate;
    FMOD_CODEC_GETWAVEFORMAT        getwaveformat;
  } FMOD_CODEC_DESCRIPTION;

  struct FMOD_CODEC_WAVEFORMAT {
    char               name[256];
    FMOD_SOUND_FORMAT  format;
    int                channels;
    int                frequency;
    unsigned int       lengthbytes;
    unsigned int       lengthpcm;
    int                blockalign;
    int                loopstart;
    int                loopend;
    FMOD_MODE          mode;
    unsigned int       channelmask;
  };

  struct FMOD_CODEC_STATE {
      int                         numsubsounds;
      FMOD_CODEC_WAVEFORMAT      *waveformat;
      void                       *plugindata;

      void                       *filehandle;
      unsigned int                filesize;
      FMOD_FILE_READCALLBACK      fileread;
      FMOD_FILE_SEEKCALLBACK      fileseek;
      FMOD_CODEC_METADATACALLBACK metadata;
  };

]]

-- dsp
ffi.cdef [[
  typedef struct FMOD_DSP_STATE FMOD_DSP_STATE;

  typedef FMOD_RESULT ( *FMOD_DSP_CREATECALLBACK)     (FMOD_DSP_STATE *dsp_state);
  typedef FMOD_RESULT ( *FMOD_DSP_RELEASECALLBACK)    (FMOD_DSP_STATE *dsp_state);
  typedef FMOD_RESULT ( *FMOD_DSP_RESETCALLBACK)      (FMOD_DSP_STATE *dsp_state);
  typedef FMOD_RESULT ( *FMOD_DSP_READCALLBACK)       (FMOD_DSP_STATE *dsp_state, float *inbuffer, float *outbuffer, unsigned int length, int inchannels, int outchannels);
  typedef FMOD_RESULT ( *FMOD_DSP_SETPOSITIONCALLBACK)(FMOD_DSP_STATE *dsp_state, unsigned int pos);
  typedef FMOD_RESULT ( *FMOD_DSP_SETPARAMCALLBACK)   (FMOD_DSP_STATE *dsp_state, int index, float value);
  typedef FMOD_RESULT ( *FMOD_DSP_GETPARAMCALLBACK)   (FMOD_DSP_STATE *dsp_state, int index, float *value, char *valuestr);
  typedef FMOD_RESULT ( *FMOD_DSP_DIALOGCALLBACK)     (FMOD_DSP_STATE *dsp_state, void *hwnd, int show);

  typedef enum {
    FMOD_DSP_TYPE_UNKNOWN,
    FMOD_DSP_TYPE_MIXER,
    FMOD_DSP_TYPE_OSCILLATOR,
    FMOD_DSP_TYPE_LOWPASS,
    FMOD_DSP_TYPE_ITLOWPASS,
    FMOD_DSP_TYPE_HIGHPASS,
    FMOD_DSP_TYPE_ECHO,
    FMOD_DSP_TYPE_FLANGE,
    FMOD_DSP_TYPE_DISTORTION,
    FMOD_DSP_TYPE_NORMALIZE,
    FMOD_DSP_TYPE_PARAMEQ,
    FMOD_DSP_TYPE_PITCHSHIFT,
    FMOD_DSP_TYPE_CHORUS,
    FMOD_DSP_TYPE_VSTPLUGIN,
    FMOD_DSP_TYPE_WINAMPPLUGIN,
    FMOD_DSP_TYPE_ITECHO,
    FMOD_DSP_TYPE_COMPRESSOR,
    FMOD_DSP_TYPE_SFXREVERB,
    FMOD_DSP_TYPE_LOWPASS_SIMPLE,
    FMOD_DSP_TYPE_DELAY,
    FMOD_DSP_TYPE_TREMOLO,
    FMOD_DSP_TYPE_LADSPAPLUGIN,
    FMOD_DSP_TYPE_HIGHPASS_SIMPLE,
    FMOD_DSP_TYPE_FORCEINT = 65536
  } FMOD_DSP_TYPE;

  typedef struct FMOD_DSP_PARAMETERDESC {
    float       min;
    float       max;
    float       defaultval;
    char        name[16];
    char        label[16];
    const char *description;
  } FMOD_DSP_PARAMETERDESC;

  typedef struct FMOD_DSP_DESCRIPTION {
    char                         name[32];
    unsigned int                 version;
    int                          channels;
    FMOD_DSP_CREATECALLBACK      create;
    FMOD_DSP_RELEASECALLBACK     release;
    FMOD_DSP_RESETCALLBACK       reset;
    FMOD_DSP_READCALLBACK        read;
    FMOD_DSP_SETPOSITIONCALLBACK setposition;

    int                          numparameters;
    FMOD_DSP_PARAMETERDESC      *paramdesc;
    FMOD_DSP_SETPARAMCALLBACK    setparameter;
    FMOD_DSP_GETPARAMCALLBACK    getparameter;
    FMOD_DSP_DIALOGCALLBACK      config;
    int                          configwidth;
    int                          configheight;
    void                        *userdata;
  } FMOD_DSP_DESCRIPTION;

  struct FMOD_DSP_STATE {
    FMOD_DSP      *instance;
    void          *plugindata;
    unsigned short speakermask;	
  };

  typedef enum {
      FMOD_DSP_OSCILLATOR_TYPE,
      FMOD_DSP_OSCILLATOR_RATE
  } FMOD_DSP_OSCILLATOR;

  typedef enum {
    FMOD_DSP_LOWPASS_CUTOFF,
    FMOD_DSP_LOWPASS_RESONANCE
  } FMOD_DSP_LOWPASS;

  typedef enum {
    FMOD_DSP_ITLOWPASS_CUTOFF,
    FMOD_DSP_ITLOWPASS_RESONANCE
  } FMOD_DSP_ITLOWPASS;

  typedef enum {
    FMOD_DSP_HIGHPASS_CUTOFF,
    FMOD_DSP_HIGHPASS_RESONANCE
  } FMOD_DSP_HIGHPASS;

  typedef enum {
    FMOD_DSP_ECHO_DELAY,
    FMOD_DSP_ECHO_DECAYRATIO,
    FMOD_DSP_ECHO_MAXCHANNELS,
    FMOD_DSP_ECHO_DRYMIX,
    FMOD_DSP_ECHO_WETMIX
  } FMOD_DSP_ECHO;

  typedef enum {
    FMOD_DSP_DELAY_CH0,
    FMOD_DSP_DELAY_CH1,
    FMOD_DSP_DELAY_CH2,
    FMOD_DSP_DELAY_CH3,
    FMOD_DSP_DELAY_CH4,
    FMOD_DSP_DELAY_CH5,
    FMOD_DSP_DELAY_CH6,
    FMOD_DSP_DELAY_CH7,
    FMOD_DSP_DELAY_CH8,
    FMOD_DSP_DELAY_CH9,
    FMOD_DSP_DELAY_CH10,
    FMOD_DSP_DELAY_CH11,
    FMOD_DSP_DELAY_CH12,
    FMOD_DSP_DELAY_CH13,
    FMOD_DSP_DELAY_CH14,
    FMOD_DSP_DELAY_CH15,
    FMOD_DSP_DELAY_MAXDELAY
  } FMOD_DSP_DELAY;

  typedef enum {
    FMOD_DSP_FLANGE_DRYMIX,
    FMOD_DSP_FLANGE_WETMIX,
    FMOD_DSP_FLANGE_DEPTH,
    FMOD_DSP_FLANGE_RATE
  } FMOD_DSP_FLANGE;

  typedef enum {
    FMOD_DSP_TREMOLO_FREQUENCY,
    FMOD_DSP_TREMOLO_DEPTH,
    FMOD_DSP_TREMOLO_SHAPE,
    FMOD_DSP_TREMOLO_SKEW,
    FMOD_DSP_TREMOLO_DUTY,
    FMOD_DSP_TREMOLO_SQUARE,
    FMOD_DSP_TREMOLO_PHASE,
    FMOD_DSP_TREMOLO_SPREAD
  } FMOD_DSP_TREMOLO;

  typedef enum {
    FMOD_DSP_DISTORTION_LEVEL
  } FMOD_DSP_DISTORTION;

  typedef enum {
    FMOD_DSP_NORMALIZE_FADETIME,
    FMOD_DSP_NORMALIZE_THRESHHOLD,
    FMOD_DSP_NORMALIZE_MAXAMP
  } FMOD_DSP_NORMALIZE;

  typedef enum {
    FMOD_DSP_PARAMEQ_CENTER,
    FMOD_DSP_PARAMEQ_BANDWIDTH,
    FMOD_DSP_PARAMEQ_GAIN
  } FMOD_DSP_PARAMEQ;

  typedef enum {
    FMOD_DSP_PITCHSHIFT_PITCH,
    FMOD_DSP_PITCHSHIFT_FFTSIZE,
    FMOD_DSP_PITCHSHIFT_OVERLAP,
    FMOD_DSP_PITCHSHIFT_MAXCHANNELS
  } FMOD_DSP_PITCHSHIFT;

  typedef enum {
    FMOD_DSP_CHORUS_DRYMIX,
    FMOD_DSP_CHORUS_WETMIX1,
    FMOD_DSP_CHORUS_WETMIX2,
    FMOD_DSP_CHORUS_WETMIX3,
    FMOD_DSP_CHORUS_DELAY,
    FMOD_DSP_CHORUS_RATE,
    FMOD_DSP_CHORUS_DEPTH,
    FMOD_DSP_CHORUS_FEEDBACK
  } FMOD_DSP_CHORUS;

  typedef enum {
    FMOD_DSP_ITECHO_WETDRYMIX,
    FMOD_DSP_ITECHO_FEEDBACK,
    FMOD_DSP_ITECHO_LEFTDELAY,
    FMOD_DSP_ITECHO_RIGHTDELAY,
    FMOD_DSP_ITECHO_PANDELAY
  } FMOD_DSP_ITECHO;

  typedef enum {
    FMOD_DSP_COMPRESSOR_THRESHOLD,
    FMOD_DSP_COMPRESSOR_ATTACK,
    FMOD_DSP_COMPRESSOR_RELEASE,
    FMOD_DSP_COMPRESSOR_GAINMAKEUP
  } FMOD_DSP_COMPRESSOR;

  typedef enum {
    FMOD_DSP_SFXREVERB_DRYLEVEL,
    FMOD_DSP_SFXREVERB_ROOM,
    FMOD_DSP_SFXREVERB_ROOMHF,
    FMOD_DSP_SFXREVERB_DECAYTIME,
    FMOD_DSP_SFXREVERB_DECAYHFRATIO,
    FMOD_DSP_SFXREVERB_REFLECTIONSLEVEL,
    FMOD_DSP_SFXREVERB_REFLECTIONSDELAY,
    FMOD_DSP_SFXREVERB_REVERBLEVEL,
    FMOD_DSP_SFXREVERB_REVERBDELAY,
    FMOD_DSP_SFXREVERB_DIFFUSION,
    FMOD_DSP_SFXREVERB_DENSITY,
    FMOD_DSP_SFXREVERB_HFREFERENCE,
    FMOD_DSP_SFXREVERB_ROOMLF,
    FMOD_DSP_SFXREVERB_LFREFERENCE
  } FMOD_DSP_SFXREVERB;

  typedef enum {
    FMOD_DSP_LOWPASS_SIMPLE_CUTOFF
  } FMOD_DSP_LOWPASS_SIMPLE;

  typedef enum {
      FMOD_DSP_HIGHPASS_SIMPLE_CUTOFF
  } FMOD_DSP_HIGHPASS_SIMPLE;

]]

-- memoryinfo
ffi.cdef [[

  typedef struct FMOD_MEMORY_USAGE_DETAILS {
    unsigned int other;
    unsigned int string;
    unsigned int system;
    unsigned int plugins;
    unsigned int output;
    unsigned int channel;
    unsigned int channelgroup;
    unsigned int codec;
    unsigned int file;
    unsigned int sound;
    unsigned int secondaryram;
    unsigned int soundgroup;
    unsigned int streambuffer;
    unsigned int dspconnection;
    unsigned int dsp;
    unsigned int dspcodec;
    unsigned int profile;
    unsigned int recordbuffer;
    unsigned int reverb;
    unsigned int reverbchannelprops;
    unsigned int geometry;
    unsigned int syncpoint;
    unsigned int eventsystem;
    unsigned int musicsystem;
    unsigned int fev;
    unsigned int memoryfsb;
    unsigned int eventproject;
    unsigned int eventgroupi;
    unsigned int soundbankclass;
    unsigned int soundbanklist;
    unsigned int streaminstance;
    unsigned int sounddefclass;
    unsigned int sounddefdefclass;
    unsigned int sounddefpool;
    unsigned int reverbdef;
    unsigned int eventreverb;
    unsigned int userproperty;
    unsigned int eventinstance;
    unsigned int eventinstance_complex;
    unsigned int eventinstance_simple;
    unsigned int eventinstance_layer;
    unsigned int eventinstance_sound;
    unsigned int eventenvelope;
    unsigned int eventenvelopedef;
    unsigned int eventparameter;
    unsigned int eventcategory;
    unsigned int eventenvelopepoint;
    unsigned int eventinstancepool;
  } FMOD_MEMORY_USAGE_DETAILS;

  enum {
    FMOD_MEMBITS_OTHER                       = 0x00000001,
    FMOD_MEMBITS_STRING                      = 0x00000002,

    FMOD_MEMBITS_SYSTEM                      = 0x00000004,
    FMOD_MEMBITS_PLUGINS                     = 0x00000008,
    FMOD_MEMBITS_OUTPUT                      = 0x00000010,
    FMOD_MEMBITS_CHANNEL                     = 0x00000020,
    FMOD_MEMBITS_CHANNELGROUP                = 0x00000040,
    FMOD_MEMBITS_CODEC                       = 0x00000080,
    FMOD_MEMBITS_FILE                        = 0x00000100,
    FMOD_MEMBITS_SOUND                       = 0x00000200,
    FMOD_MEMBITS_SOUND_SECONDARYRAM          = 0x00000400,
    FMOD_MEMBITS_SOUNDGROUP                  = 0x00000800,
    FMOD_MEMBITS_STREAMBUFFER                = 0x00001000,
    FMOD_MEMBITS_DSPCONNECTION               = 0x00002000,
    FMOD_MEMBITS_DSP                         = 0x00004000,
    FMOD_MEMBITS_DSPCODEC                    = 0x00008000,
    FMOD_MEMBITS_PROFILE                     = 0x00010000,
    FMOD_MEMBITS_RECORDBUFFER                = 0x00020000,
    FMOD_MEMBITS_REVERB                      = 0x00040000,
    FMOD_MEMBITS_REVERBCHANNELPROPS          = 0x00080000,
    FMOD_MEMBITS_GEOMETRY                    = 0x00100000,
    FMOD_MEMBITS_SYNCPOINT                   = 0x00200000,
    FMOD_MEMBITS_ALL                         = 0xffffffff,

    FMOD_EVENT_MEMBITS_EVENTSYSTEM           = 0x00000001,
    FMOD_EVENT_MEMBITS_MUSICSYSTEM           = 0x00000002,
    FMOD_EVENT_MEMBITS_FEV                   = 0x00000004,
    FMOD_EVENT_MEMBITS_MEMORYFSB             = 0x00000008,
    FMOD_EVENT_MEMBITS_EVENTPROJECT          = 0x00000010,
    FMOD_EVENT_MEMBITS_EVENTGROUPI           = 0x00000020,
    FMOD_EVENT_MEMBITS_SOUNDBANKCLASS        = 0x00000040,
    FMOD_EVENT_MEMBITS_SOUNDBANKLIST         = 0x00000080,
    FMOD_EVENT_MEMBITS_STREAMINSTANCE        = 0x00000100,
    FMOD_EVENT_MEMBITS_SOUNDDEFCLASS         = 0x00000200,
    FMOD_EVENT_MEMBITS_SOUNDDEFDEFCLASS      = 0x00000400,
    FMOD_EVENT_MEMBITS_SOUNDDEFPOOL          = 0x00000800,
    FMOD_EVENT_MEMBITS_REVERBDEF             = 0x00001000,
    FMOD_EVENT_MEMBITS_EVENTREVERB           = 0x00002000,
    FMOD_EVENT_MEMBITS_USERPROPERTY          = 0x00004000,
    FMOD_EVENT_MEMBITS_EVENTINSTANCE         = 0x00008000,
    FMOD_EVENT_MEMBITS_EVENTINSTANCE_COMPLEX = 0x00010000,
    FMOD_EVENT_MEMBITS_EVENTINSTANCE_SIMPLE  = 0x00020000,
    FMOD_EVENT_MEMBITS_EVENTINSTANCE_LAYER   = 0x00040000,
    FMOD_EVENT_MEMBITS_EVENTINSTANCE_SOUND   = 0x00080000,
    FMOD_EVENT_MEMBITS_EVENTENVELOPE         = 0x00100000,
    FMOD_EVENT_MEMBITS_EVENTENVELOPEDEF      = 0x00200000,
    FMOD_EVENT_MEMBITS_EVENTPARAMETER        = 0x00400000,
    FMOD_EVENT_MEMBITS_EVENTCATEGORY         = 0x00800000,
    FMOD_EVENT_MEMBITS_EVENTENVELOPEPOINT    = 0x01000000,
    FMOD_EVENT_MEMBITS_EVENTINSTANCEPOOL     = 0x02000000,
    FMOD_EVENT_MEMBITS_ALL                   = 0xffffffff
  };

  /*
  #define FMOD_EVENT_MEMBITS_EVENTINSTANCE_GROUP   (FMOD_EVENT_MEMBITS_EVENTINSTANCE            | \
                                                       FMOD_EVENT_MEMBITS_EVENTINSTANCE_COMPLEX | \
                                                       FMOD_EVENT_MEMBITS_EVENTINSTANCE_SIMPLE  | \
                                                       FMOD_EVENT_MEMBITS_EVENTINSTANCE_LAYER   | \
                                                       FMOD_EVENT_MEMBITS_EVENTINSTANCE_SOUND)

  #define FMOD_EVENT_MEMBITS_SOUNDDEF_GROUP        (FMOD_EVENT_MEMBITS_SOUNDDEFCLASS            | \
                                                       FMOD_EVENT_MEMBITS_SOUNDDEFDEFCLASS      | \
                                                       FMOD_EVENT_MEMBITS_SOUNDDEFPOOL)
  */

]]

ffi.cdef [[

  FMOD_RESULT FMOD_Memory_Initialize           (void *poolmem, int poollen, FMOD_MEMORY_ALLOCCALLBACK useralloc, FMOD_MEMORY_REALLOCCALLBACK userrealloc, FMOD_MEMORY_FREECALLBACK userfree, FMOD_MEMORY_TYPE memtypeflags);
  FMOD_RESULT FMOD_Memory_GetStats             (int *currentalloced, int *maxalloced, FMOD_BOOL blocking);
  FMOD_RESULT FMOD_Debug_SetLevel              (FMOD_DEBUGLEVEL level);
  FMOD_RESULT FMOD_Debug_GetLevel              (FMOD_DEBUGLEVEL *level);
  FMOD_RESULT FMOD_File_SetDiskBusy            (int busy);
  FMOD_RESULT FMOD_File_GetDiskBusy            (int *busy);
  FMOD_RESULT FMOD_System_Create               (FMOD_SYSTEM **system);
  FMOD_RESULT FMOD_System_Release              (FMOD_SYSTEM *system);
  FMOD_RESULT FMOD_System_SetOutput              (FMOD_SYSTEM *system, FMOD_OUTPUTTYPE output);
  FMOD_RESULT FMOD_System_GetOutput              (FMOD_SYSTEM *system, FMOD_OUTPUTTYPE *output);
  FMOD_RESULT FMOD_System_GetNumDrivers          (FMOD_SYSTEM *system, int *numdrivers);
  FMOD_RESULT FMOD_System_GetDriverInfo          (FMOD_SYSTEM *system, int id, char *name, int namelen, FMOD_GUID *guid);
  FMOD_RESULT FMOD_System_GetDriverInfoW         (FMOD_SYSTEM *system, int id, short *name, int namelen, FMOD_GUID *guid);
  FMOD_RESULT FMOD_System_GetDriverCaps          (FMOD_SYSTEM *system, int id, FMOD_CAPS *caps, int *controlpaneloutputrate, FMOD_SPEAKERMODE *controlpanelspeakermode);
  FMOD_RESULT FMOD_System_SetDriver              (FMOD_SYSTEM *system, int driver);
  FMOD_RESULT FMOD_System_GetDriver              (FMOD_SYSTEM *system, int *driver);
  FMOD_RESULT FMOD_System_SetHardwareChannels    (FMOD_SYSTEM *system, int numhardwarechannels);
  FMOD_RESULT FMOD_System_SetSoftwareChannels    (FMOD_SYSTEM *system, int numsoftwarechannels);
  FMOD_RESULT FMOD_System_GetSoftwareChannels    (FMOD_SYSTEM *system, int *numsoftwarechannels);
  FMOD_RESULT FMOD_System_SetSoftwareFormat      (FMOD_SYSTEM *system, int samplerate, FMOD_SOUND_FORMAT format, int numoutputchannels, int maxinputchannels, FMOD_DSP_RESAMPLER resamplemethod);
  FMOD_RESULT FMOD_System_GetSoftwareFormat      (FMOD_SYSTEM *system, int *samplerate, FMOD_SOUND_FORMAT *format, int *numoutputchannels, int *maxinputchannels, FMOD_DSP_RESAMPLER *resamplemethod, int *bits);
  FMOD_RESULT FMOD_System_SetDSPBufferSize       (FMOD_SYSTEM *system, unsigned int bufferlength, int numbuffers);
  FMOD_RESULT FMOD_System_GetDSPBufferSize       (FMOD_SYSTEM *system, unsigned int *bufferlength, int *numbuffers);
  FMOD_RESULT FMOD_System_SetFileSystem          (FMOD_SYSTEM *system, FMOD_FILE_OPENCALLBACK useropen, FMOD_FILE_CLOSECALLBACK userclose, FMOD_FILE_READCALLBACK userread, FMOD_FILE_SEEKCALLBACK userseek, FMOD_FILE_ASYNCREADCALLBACK userasyncread, FMOD_FILE_ASYNCCANCELCALLBACK userasynccancel, int blockalign);
  FMOD_RESULT FMOD_System_AttachFileSystem       (FMOD_SYSTEM *system, FMOD_FILE_OPENCALLBACK useropen, FMOD_FILE_CLOSECALLBACK userclose, FMOD_FILE_READCALLBACK userread, FMOD_FILE_SEEKCALLBACK userseek);
  FMOD_RESULT FMOD_System_SetAdvancedSettings    (FMOD_SYSTEM *system, FMOD_ADVANCEDSETTINGS *settings);
  FMOD_RESULT FMOD_System_GetAdvancedSettings    (FMOD_SYSTEM *system, FMOD_ADVANCEDSETTINGS *settings);
  FMOD_RESULT FMOD_System_SetSpeakerMode         (FMOD_SYSTEM *system, FMOD_SPEAKERMODE speakermode);
  FMOD_RESULT FMOD_System_GetSpeakerMode         (FMOD_SYSTEM *system, FMOD_SPEAKERMODE *speakermode);
  FMOD_RESULT FMOD_System_SetCallback            (FMOD_SYSTEM *system, FMOD_SYSTEM_CALLBACK callback);
  FMOD_RESULT FMOD_System_SetPluginPath          (FMOD_SYSTEM *system, const char *path);
  FMOD_RESULT FMOD_System_LoadPlugin             (FMOD_SYSTEM *system, const char *filename, unsigned int *handle, unsigned int priority);
  FMOD_RESULT FMOD_System_UnloadPlugin           (FMOD_SYSTEM *system, unsigned int handle);
  FMOD_RESULT FMOD_System_GetNumPlugins          (FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int *numplugins);
  FMOD_RESULT FMOD_System_GetPluginHandle        (FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int index, unsigned int *handle);
  FMOD_RESULT FMOD_System_GetPluginInfo          (FMOD_SYSTEM *system, unsigned int handle, FMOD_PLUGINTYPE *plugintype, char *name, int namelen, unsigned int *version);
  FMOD_RESULT FMOD_System_SetOutputByPlugin      (FMOD_SYSTEM *system, unsigned int handle);
  FMOD_RESULT FMOD_System_GetOutputByPlugin      (FMOD_SYSTEM *system, unsigned int *handle);
  FMOD_RESULT FMOD_System_CreateDSPByPlugin      (FMOD_SYSTEM *system, unsigned int handle, FMOD_DSP **dsp);
  FMOD_RESULT FMOD_System_CreateCodec            (FMOD_SYSTEM *system, FMOD_CODEC_DESCRIPTION *description, unsigned int priority);
  FMOD_RESULT FMOD_System_Init                   (FMOD_SYSTEM *system, int maxchannels, FMOD_INITFLAGS flags, void *extradriverdata);
  FMOD_RESULT FMOD_System_Close                  (FMOD_SYSTEM *system);
  FMOD_RESULT FMOD_System_Update                 (FMOD_SYSTEM *system);
  FMOD_RESULT FMOD_System_Set3DSettings          (FMOD_SYSTEM *system, float dopplerscale, float distancefactor, float rolloffscale);
  FMOD_RESULT FMOD_System_Get3DSettings          (FMOD_SYSTEM *system, float *dopplerscale, float *distancefactor, float *rolloffscale);
  FMOD_RESULT FMOD_System_Set3DNumListeners      (FMOD_SYSTEM *system, int numlisteners);
  FMOD_RESULT FMOD_System_Get3DNumListeners      (FMOD_SYSTEM *system, int *numlisteners);
  FMOD_RESULT FMOD_System_Set3DListenerAttributes(FMOD_SYSTEM *system, int listener, const FMOD_VECTOR *pos, const FMOD_VECTOR *vel, const FMOD_VECTOR *forward, const FMOD_VECTOR *up);
  FMOD_RESULT FMOD_System_Get3DListenerAttributes(FMOD_SYSTEM *system, int listener, FMOD_VECTOR *pos, FMOD_VECTOR *vel, FMOD_VECTOR *forward, FMOD_VECTOR *up);
  FMOD_RESULT FMOD_System_Set3DRolloffCallback   (FMOD_SYSTEM *system, FMOD_3D_ROLLOFFCALLBACK callback);
  FMOD_RESULT FMOD_System_Set3DSpeakerPosition   (FMOD_SYSTEM *system, FMOD_SPEAKER speaker, float x, float y, FMOD_BOOL active);
  FMOD_RESULT FMOD_System_Get3DSpeakerPosition   (FMOD_SYSTEM *system, FMOD_SPEAKER speaker, float *x, float *y, FMOD_BOOL *active);
  FMOD_RESULT FMOD_System_SetStreamBufferSize    (FMOD_SYSTEM *system, unsigned int filebuffersize, FMOD_TIMEUNIT filebuffersizetype);
  FMOD_RESULT FMOD_System_GetStreamBufferSize    (FMOD_SYSTEM *system, unsigned int *filebuffersize, FMOD_TIMEUNIT *filebuffersizetype);
  FMOD_RESULT FMOD_System_GetVersion             (FMOD_SYSTEM *system, unsigned int *version);
  FMOD_RESULT FMOD_System_GetOutputHandle        (FMOD_SYSTEM *system, void **handle);
  FMOD_RESULT FMOD_System_GetChannelsPlaying     (FMOD_SYSTEM *system, int *channels);
  FMOD_RESULT FMOD_System_GetHardwareChannels    (FMOD_SYSTEM *system, int *numhardwarechannels);
  FMOD_RESULT FMOD_System_GetCPUUsage            (FMOD_SYSTEM *system, float *dsp, float *stream, float *geometry, float *update, float *total);
  FMOD_RESULT FMOD_System_GetSoundRAM            (FMOD_SYSTEM *system, int *currentalloced, int *maxalloced, int *total);
  FMOD_RESULT FMOD_System_GetNumCDROMDrives      (FMOD_SYSTEM *system, int *numdrives);
  FMOD_RESULT FMOD_System_GetCDROMDriveName      (FMOD_SYSTEM *system, int drive, char *drivename, int drivenamelen, char *scsiname, int scsinamelen, char *devicename, int devicenamelen);
  FMOD_RESULT FMOD_System_GetSpectrum            (FMOD_SYSTEM *system, float *spectrumarray, int numvalues, int channeloffset, FMOD_DSP_FFT_WINDOW windowtype);
  FMOD_RESULT FMOD_System_GetWaveData            (FMOD_SYSTEM *system, float *wavearray, int numvalues, int channeloffset);
  FMOD_RESULT FMOD_System_CreateSound            (FMOD_SYSTEM *system, const char *name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO *exinfo, FMOD_SOUND **sound);
  FMOD_RESULT FMOD_System_CreateStream           (FMOD_SYSTEM *system, const char *name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO *exinfo, FMOD_SOUND **sound);
  FMOD_RESULT FMOD_System_CreateDSP              (FMOD_SYSTEM *system, FMOD_DSP_DESCRIPTION *description, FMOD_DSP **dsp);
  FMOD_RESULT FMOD_System_CreateDSPByType        (FMOD_SYSTEM *system, FMOD_DSP_TYPE type, FMOD_DSP **dsp);
  FMOD_RESULT FMOD_System_CreateChannelGroup     (FMOD_SYSTEM *system, const char *name, FMOD_CHANNELGROUP **channelgroup);
  FMOD_RESULT FMOD_System_CreateSoundGroup       (FMOD_SYSTEM *system, const char *name, FMOD_SOUNDGROUP **soundgroup);
  FMOD_RESULT FMOD_System_CreateReverb           (FMOD_SYSTEM *system, FMOD_REVERB **reverb);

  FMOD_RESULT FMOD_System_PlaySound              (FMOD_SYSTEM *system, FMOD_CHANNELINDEX channelid, FMOD_SOUND *sound, FMOD_BOOL paused, FMOD_CHANNEL **channel);
  FMOD_RESULT FMOD_System_PlayDSP                (FMOD_SYSTEM *system, FMOD_CHANNELINDEX channelid, FMOD_DSP *dsp, FMOD_BOOL paused, FMOD_CHANNEL **channel);
  FMOD_RESULT FMOD_System_GetChannel             (FMOD_SYSTEM *system, int channelid, FMOD_CHANNEL **channel);
  FMOD_RESULT FMOD_System_GetMasterChannelGroup  (FMOD_SYSTEM *system, FMOD_CHANNELGROUP **channelgroup);
  FMOD_RESULT FMOD_System_GetMasterSoundGroup    (FMOD_SYSTEM *system, FMOD_SOUNDGROUP **soundgroup);
  FMOD_RESULT FMOD_System_SetReverbProperties    (FMOD_SYSTEM *system, const FMOD_REVERB_PROPERTIES *prop);
  FMOD_RESULT FMOD_System_GetReverbProperties    (FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop);
  FMOD_RESULT FMOD_System_SetReverbAmbientProperties(FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop);
  FMOD_RESULT FMOD_System_GetReverbAmbientProperties(FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop);
  FMOD_RESULT FMOD_System_GetDSPHead             (FMOD_SYSTEM *system, FMOD_DSP **dsp);
  FMOD_RESULT FMOD_System_AddDSP                 (FMOD_SYSTEM *system, FMOD_DSP *dsp, FMOD_DSPCONNECTION **connection);
  FMOD_RESULT FMOD_System_LockDSP                (FMOD_SYSTEM *system);
  FMOD_RESULT FMOD_System_UnlockDSP              (FMOD_SYSTEM *system);
  FMOD_RESULT FMOD_System_GetDSPClock            (FMOD_SYSTEM *system, unsigned int *hi, unsigned int *lo);
  FMOD_RESULT FMOD_System_GetRecordNumDrivers    (FMOD_SYSTEM *system, int *numdrivers);
  FMOD_RESULT FMOD_System_GetRecordDriverInfo    (FMOD_SYSTEM *system, int id, char *name, int namelen, FMOD_GUID *guid);
  FMOD_RESULT FMOD_System_GetRecordDriverInfoW   (FMOD_SYSTEM *system, int id, short *name, int namelen, FMOD_GUID *guid);
  FMOD_RESULT FMOD_System_GetRecordDriverCaps    (FMOD_SYSTEM *system, int id, FMOD_CAPS *caps, int *minfrequency, int *maxfrequency);
  FMOD_RESULT FMOD_System_GetRecordPosition      (FMOD_SYSTEM *system, int id, unsigned int *position);
  FMOD_RESULT FMOD_System_RecordStart            (FMOD_SYSTEM *system, int id, FMOD_SOUND *sound, FMOD_BOOL loop);
  FMOD_RESULT FMOD_System_RecordStop             (FMOD_SYSTEM *system, int id);
  FMOD_RESULT FMOD_System_IsRecording            (FMOD_SYSTEM *system, int id, FMOD_BOOL *recording);
  FMOD_RESULT FMOD_System_CreateGeometry         (FMOD_SYSTEM *system, int maxpolygons, int maxvertices, FMOD_GEOMETRY **geometry);
  FMOD_RESULT FMOD_System_SetGeometrySettings    (FMOD_SYSTEM *system, float maxworldsize);
  FMOD_RESULT FMOD_System_GetGeometrySettings    (FMOD_SYSTEM *system, float *maxworldsize);
  FMOD_RESULT FMOD_System_LoadGeometry           (FMOD_SYSTEM *system, const void *data, int datasize, FMOD_GEOMETRY **geometry);
  FMOD_RESULT FMOD_System_GetGeometryOcclusion   (FMOD_SYSTEM *system, const FMOD_VECTOR *listener, const FMOD_VECTOR *source, float *direct, float *reverb);
  FMOD_RESULT FMOD_System_SetNetworkProxy        (FMOD_SYSTEM *system, const char *proxy);
  FMOD_RESULT FMOD_System_GetNetworkProxy        (FMOD_SYSTEM *system, char *proxy, int proxylen);
  FMOD_RESULT FMOD_System_SetNetworkTimeout      (FMOD_SYSTEM *system, int timeout);
  FMOD_RESULT FMOD_System_GetNetworkTimeout      (FMOD_SYSTEM *system, int *timeout);
  FMOD_RESULT FMOD_System_SetUserData            (FMOD_SYSTEM *system, void *userdata);
  FMOD_RESULT FMOD_System_GetUserData            (FMOD_SYSTEM *system, void **userdata);
  FMOD_RESULT FMOD_System_GetMemoryInfo          (FMOD_SYSTEM *system, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_Sound_Release                 (FMOD_SOUND *sound);
  FMOD_RESULT FMOD_Sound_GetSystemObject         (FMOD_SOUND *sound, FMOD_SYSTEM **system);
  FMOD_RESULT FMOD_Sound_Lock                    (FMOD_SOUND *sound, unsigned int offset, unsigned int length, void **ptr1, void **ptr2, unsigned int *len1, unsigned int *len2);
  FMOD_RESULT FMOD_Sound_Unlock                  (FMOD_SOUND *sound, void *ptr1, void *ptr2, unsigned int len1, unsigned int len2);
  FMOD_RESULT FMOD_Sound_SetDefaults             (FMOD_SOUND *sound, float frequency, float volume, float pan, int priority);
  FMOD_RESULT FMOD_Sound_GetDefaults             (FMOD_SOUND *sound, float *frequency, float *volume, float *pan, int *priority);
  FMOD_RESULT FMOD_Sound_SetVariations           (FMOD_SOUND *sound, float frequencyvar, float volumevar, float panvar);
  FMOD_RESULT FMOD_Sound_GetVariations           (FMOD_SOUND *sound, float *frequencyvar, float *volumevar, float *panvar);
  FMOD_RESULT FMOD_Sound_Set3DMinMaxDistance     (FMOD_SOUND *sound, float min, float max);
  FMOD_RESULT FMOD_Sound_Get3DMinMaxDistance     (FMOD_SOUND *sound, float *min, float *max);
  FMOD_RESULT FMOD_Sound_Set3DConeSettings       (FMOD_SOUND *sound, float insideconeangle, float outsideconeangle, float outsidevolume);
  FMOD_RESULT FMOD_Sound_Get3DConeSettings       (FMOD_SOUND *sound, float *insideconeangle, float *outsideconeangle, float *outsidevolume);
  FMOD_RESULT FMOD_Sound_Set3DCustomRolloff      (FMOD_SOUND *sound, FMOD_VECTOR *points, int numpoints);
  FMOD_RESULT FMOD_Sound_Get3DCustomRolloff      (FMOD_SOUND *sound, FMOD_VECTOR **points, int *numpoints);
  FMOD_RESULT FMOD_Sound_SetSubSound             (FMOD_SOUND *sound, int index, FMOD_SOUND *subsound);
  FMOD_RESULT FMOD_Sound_GetSubSound             (FMOD_SOUND *sound, int index, FMOD_SOUND **subsound);
  FMOD_RESULT FMOD_Sound_SetSubSoundSentence     (FMOD_SOUND *sound, int *subsoundlist, int numsubsounds);
  FMOD_RESULT FMOD_Sound_GetName                 (FMOD_SOUND *sound, char *name, int namelen);
  FMOD_RESULT FMOD_Sound_GetLength               (FMOD_SOUND *sound, unsigned int *length, FMOD_TIMEUNIT lengthtype);
  FMOD_RESULT FMOD_Sound_GetFormat               (FMOD_SOUND *sound, FMOD_SOUND_TYPE *type, FMOD_SOUND_FORMAT *format, int *channels, int *bits);
  FMOD_RESULT FMOD_Sound_GetNumSubSounds         (FMOD_SOUND *sound, int *numsubsounds);
  FMOD_RESULT FMOD_Sound_GetNumTags              (FMOD_SOUND *sound, int *numtags, int *numtagsupdated);
  FMOD_RESULT FMOD_Sound_GetTag                  (FMOD_SOUND *sound, const char *name, int index, FMOD_TAG *tag);
  FMOD_RESULT FMOD_Sound_GetOpenState            (FMOD_SOUND *sound, FMOD_OPENSTATE *openstate, unsigned int *percentbuffered, FMOD_BOOL *starving, FMOD_BOOL *diskbusy);
  FMOD_RESULT FMOD_Sound_ReadData                (FMOD_SOUND *sound, void *buffer, unsigned int lenbytes, unsigned int *read);
  FMOD_RESULT FMOD_Sound_SeekData                (FMOD_SOUND *sound, unsigned int pcm);

  FMOD_RESULT FMOD_Sound_SetSoundGroup           (FMOD_SOUND *sound, FMOD_SOUNDGROUP *soundgroup);
  FMOD_RESULT FMOD_Sound_GetSoundGroup           (FMOD_SOUND *sound, FMOD_SOUNDGROUP **soundgroup);
  FMOD_RESULT FMOD_Sound_GetNumSyncPoints        (FMOD_SOUND *sound, int *numsyncpoints);
  FMOD_RESULT FMOD_Sound_GetSyncPoint            (FMOD_SOUND *sound, int index, FMOD_SYNCPOINT **point);
  FMOD_RESULT FMOD_Sound_GetSyncPointInfo        (FMOD_SOUND *sound, FMOD_SYNCPOINT *point, char *name, int namelen, unsigned int *offset, FMOD_TIMEUNIT offsettype);
  FMOD_RESULT FMOD_Sound_AddSyncPoint            (FMOD_SOUND *sound, unsigned int offset, FMOD_TIMEUNIT offsettype, const char *name, FMOD_SYNCPOINT **point);
  FMOD_RESULT FMOD_Sound_DeleteSyncPoint         (FMOD_SOUND *sound, FMOD_SYNCPOINT *point);
  FMOD_RESULT FMOD_Sound_SetMode                 (FMOD_SOUND *sound, FMOD_MODE mode);
  FMOD_RESULT FMOD_Sound_GetMode                 (FMOD_SOUND *sound, FMOD_MODE *mode);
  FMOD_RESULT FMOD_Sound_SetLoopCount            (FMOD_SOUND *sound, int loopcount);
  FMOD_RESULT FMOD_Sound_GetLoopCount            (FMOD_SOUND *sound, int *loopcount);
  FMOD_RESULT FMOD_Sound_SetLoopPoints           (FMOD_SOUND *sound, unsigned int loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int loopend, FMOD_TIMEUNIT loopendtype);
  FMOD_RESULT FMOD_Sound_GetLoopPoints           (FMOD_SOUND *sound, unsigned int *loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int *loopend, FMOD_TIMEUNIT loopendtype);
  FMOD_RESULT FMOD_Sound_GetMusicNumChannels     (FMOD_SOUND *sound, int *numchannels);
  FMOD_RESULT FMOD_Sound_SetMusicChannelVolume   (FMOD_SOUND *sound, int channel, float volume);
  FMOD_RESULT FMOD_Sound_GetMusicChannelVolume   (FMOD_SOUND *sound, int channel, float *volume);
  FMOD_RESULT FMOD_Sound_SetMusicSpeed           (FMOD_SOUND *sound, float speed);
  FMOD_RESULT FMOD_Sound_GetMusicSpeed           (FMOD_SOUND *sound, float *speed);
  FMOD_RESULT FMOD_Sound_SetUserData             (FMOD_SOUND *sound, void *userdata);
  FMOD_RESULT FMOD_Sound_GetUserData             (FMOD_SOUND *sound, void **userdata);
  FMOD_RESULT FMOD_Sound_GetMemoryInfo           (FMOD_SOUND *sound, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_Channel_GetSystemObject       (FMOD_CHANNEL *channel, FMOD_SYSTEM **system);
  FMOD_RESULT FMOD_Channel_Stop                  (FMOD_CHANNEL *channel);
  FMOD_RESULT FMOD_Channel_SetPaused             (FMOD_CHANNEL *channel, FMOD_BOOL paused);
  FMOD_RESULT FMOD_Channel_GetPaused             (FMOD_CHANNEL *channel, FMOD_BOOL *paused);
  FMOD_RESULT FMOD_Channel_SetVolume             (FMOD_CHANNEL *channel, float volume);
  FMOD_RESULT FMOD_Channel_GetVolume             (FMOD_CHANNEL *channel, float *volume);
  FMOD_RESULT FMOD_Channel_SetFrequency          (FMOD_CHANNEL *channel, float frequency);
  FMOD_RESULT FMOD_Channel_GetFrequency          (FMOD_CHANNEL *channel, float *frequency);
  FMOD_RESULT FMOD_Channel_SetPan                (FMOD_CHANNEL *channel, float pan);
  FMOD_RESULT FMOD_Channel_GetPan                (FMOD_CHANNEL *channel, float *pan);
  FMOD_RESULT FMOD_Channel_SetDelay              (FMOD_CHANNEL *channel, FMOD_DELAYTYPE delaytype, unsigned int delayhi, unsigned int delaylo);
  FMOD_RESULT FMOD_Channel_GetDelay              (FMOD_CHANNEL *channel, FMOD_DELAYTYPE delaytype, unsigned int *delayhi, unsigned int *delaylo);
  FMOD_RESULT FMOD_Channel_SetSpeakerMix         (FMOD_CHANNEL *channel, float frontleft, float frontright, float center, float lfe, float backleft, float backright, float sideleft, float sideright);
  FMOD_RESULT FMOD_Channel_GetSpeakerMix         (FMOD_CHANNEL *channel, float *frontleft, float *frontright, float *center, float *lfe, float *backleft, float *backright, float *sideleft, float *sideright);
  FMOD_RESULT FMOD_Channel_SetSpeakerLevels      (FMOD_CHANNEL *channel, FMOD_SPEAKER speaker, float *levels, int numlevels);
  FMOD_RESULT FMOD_Channel_GetSpeakerLevels      (FMOD_CHANNEL *channel, FMOD_SPEAKER speaker, float *levels, int numlevels);
  FMOD_RESULT FMOD_Channel_SetInputChannelMix    (FMOD_CHANNEL *channel, float *levels, int numlevels);
  FMOD_RESULT FMOD_Channel_GetInputChannelMix    (FMOD_CHANNEL *channel, float *levels, int numlevels);
  FMOD_RESULT FMOD_Channel_SetMute               (FMOD_CHANNEL *channel, FMOD_BOOL mute);
  FMOD_RESULT FMOD_Channel_GetMute               (FMOD_CHANNEL *channel, FMOD_BOOL *mute);
  FMOD_RESULT FMOD_Channel_SetPriority           (FMOD_CHANNEL *channel, int priority);
  FMOD_RESULT FMOD_Channel_GetPriority           (FMOD_CHANNEL *channel, int *priority);
  FMOD_RESULT FMOD_Channel_SetPosition           (FMOD_CHANNEL *channel, unsigned int position, FMOD_TIMEUNIT postype);
  FMOD_RESULT FMOD_Channel_GetPosition           (FMOD_CHANNEL *channel, unsigned int *position, FMOD_TIMEUNIT postype);
  FMOD_RESULT FMOD_Channel_SetReverbProperties   (FMOD_CHANNEL *channel, const FMOD_REVERB_CHANNELPROPERTIES *prop);
  FMOD_RESULT FMOD_Channel_GetReverbProperties   (FMOD_CHANNEL *channel, FMOD_REVERB_CHANNELPROPERTIES *prop);
  FMOD_RESULT FMOD_Channel_SetLowPassGain        (FMOD_CHANNEL *channel, float gain);
  FMOD_RESULT FMOD_Channel_GetLowPassGain        (FMOD_CHANNEL *channel, float *gain);
  FMOD_RESULT FMOD_Channel_SetChannelGroup       (FMOD_CHANNEL *channel, FMOD_CHANNELGROUP *channelgroup);
  FMOD_RESULT FMOD_Channel_GetChannelGroup       (FMOD_CHANNEL *channel, FMOD_CHANNELGROUP **channelgroup);
  FMOD_RESULT FMOD_Channel_SetCallback           (FMOD_CHANNEL *channel, FMOD_CHANNEL_CALLBACK callback);
  FMOD_RESULT FMOD_Channel_Set3DAttributes       (FMOD_CHANNEL *channel, const FMOD_VECTOR *pos, const FMOD_VECTOR *vel);
  FMOD_RESULT FMOD_Channel_Get3DAttributes       (FMOD_CHANNEL *channel, FMOD_VECTOR *pos, FMOD_VECTOR *vel);
  FMOD_RESULT FMOD_Channel_Set3DMinMaxDistance   (FMOD_CHANNEL *channel, float mindistance, float maxdistance);
  FMOD_RESULT FMOD_Channel_Get3DMinMaxDistance   (FMOD_CHANNEL *channel, float *mindistance, float *maxdistance);
  FMOD_RESULT FMOD_Channel_Set3DConeSettings     (FMOD_CHANNEL *channel, float insideconeangle, float outsideconeangle, float outsidevolume);
  FMOD_RESULT FMOD_Channel_Get3DConeSettings     (FMOD_CHANNEL *channel, float *insideconeangle, float *outsideconeangle, float *outsidevolume);
  FMOD_RESULT FMOD_Channel_Set3DConeOrientation  (FMOD_CHANNEL *channel, FMOD_VECTOR *orientation);
  FMOD_RESULT FMOD_Channel_Get3DConeOrientation  (FMOD_CHANNEL *channel, FMOD_VECTOR *orientation);
  FMOD_RESULT FMOD_Channel_Set3DCustomRolloff    (FMOD_CHANNEL *channel, FMOD_VECTOR *points, int numpoints);
  FMOD_RESULT FMOD_Channel_Get3DCustomRolloff    (FMOD_CHANNEL *channel, FMOD_VECTOR **points, int *numpoints);
  FMOD_RESULT FMOD_Channel_Set3DOcclusion        (FMOD_CHANNEL *channel, float directocclusion, float reverbocclusion);
  FMOD_RESULT FMOD_Channel_Get3DOcclusion        (FMOD_CHANNEL *channel, float *directocclusion, float *reverbocclusion);
  FMOD_RESULT FMOD_Channel_Set3DSpread           (FMOD_CHANNEL *channel, float angle);
  FMOD_RESULT FMOD_Channel_Get3DSpread           (FMOD_CHANNEL *channel, float *angle);
  FMOD_RESULT FMOD_Channel_Set3DPanLevel         (FMOD_CHANNEL *channel, float level);
  FMOD_RESULT FMOD_Channel_Get3DPanLevel         (FMOD_CHANNEL *channel, float *level);
  FMOD_RESULT FMOD_Channel_Set3DDopplerLevel     (FMOD_CHANNEL *channel, float level);
  FMOD_RESULT FMOD_Channel_Get3DDopplerLevel     (FMOD_CHANNEL *channel, float *level);
  FMOD_RESULT FMOD_Channel_Set3DDistanceFilter   (FMOD_CHANNEL *channel, FMOD_BOOL custom, float customLevel, float centerFreq);
  FMOD_RESULT FMOD_Channel_Get3DDistanceFilter   (FMOD_CHANNEL *channel, FMOD_BOOL *custom, float *customLevel, float *centerFreq);
  FMOD_RESULT FMOD_Channel_GetDSPHead            (FMOD_CHANNEL *channel, FMOD_DSP **dsp);
  FMOD_RESULT FMOD_Channel_AddDSP                (FMOD_CHANNEL *channel, FMOD_DSP *dsp, FMOD_DSPCONNECTION **connection);
  FMOD_RESULT FMOD_Channel_IsPlaying             (FMOD_CHANNEL *channel, FMOD_BOOL *isplaying);
  FMOD_RESULT FMOD_Channel_IsVirtual             (FMOD_CHANNEL *channel, FMOD_BOOL *isvirtual);
  FMOD_RESULT FMOD_Channel_GetAudibility         (FMOD_CHANNEL *channel, float *audibility);
  FMOD_RESULT FMOD_Channel_GetCurrentSound       (FMOD_CHANNEL *channel, FMOD_SOUND **sound);
  FMOD_RESULT FMOD_Channel_GetSpectrum           (FMOD_CHANNEL *channel, float *spectrumarray, int numvalues, int channeloffset, FMOD_DSP_FFT_WINDOW windowtype);
  FMOD_RESULT FMOD_Channel_GetWaveData           (FMOD_CHANNEL *channel, float *wavearray, int numvalues, int channeloffset);
  FMOD_RESULT FMOD_Channel_GetIndex              (FMOD_CHANNEL *channel, int *index);
  FMOD_RESULT FMOD_Channel_SetMode               (FMOD_CHANNEL *channel, FMOD_MODE mode);
  FMOD_RESULT FMOD_Channel_GetMode               (FMOD_CHANNEL *channel, FMOD_MODE *mode);
  FMOD_RESULT FMOD_Channel_SetLoopCount          (FMOD_CHANNEL *channel, int loopcount);
  FMOD_RESULT FMOD_Channel_GetLoopCount          (FMOD_CHANNEL *channel, int *loopcount);
  FMOD_RESULT FMOD_Channel_SetLoopPoints         (FMOD_CHANNEL *channel, unsigned int loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int loopend, FMOD_TIMEUNIT loopendtype);
  FMOD_RESULT FMOD_Channel_GetLoopPoints         (FMOD_CHANNEL *channel, unsigned int *loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int *loopend, FMOD_TIMEUNIT loopendtype);
  FMOD_RESULT FMOD_Channel_SetUserData           (FMOD_CHANNEL *channel, void *userdata);
  FMOD_RESULT FMOD_Channel_GetUserData           (FMOD_CHANNEL *channel, void **userdata);
  FMOD_RESULT FMOD_Channel_GetMemoryInfo         (FMOD_CHANNEL *channel, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_ChannelGroup_Release          (FMOD_CHANNELGROUP *channelgroup);
  FMOD_RESULT FMOD_ChannelGroup_GetSystemObject  (FMOD_CHANNELGROUP *channelgroup, FMOD_SYSTEM **system);
  FMOD_RESULT FMOD_ChannelGroup_SetVolume        (FMOD_CHANNELGROUP *channelgroup, float volume);
  FMOD_RESULT FMOD_ChannelGroup_GetVolume        (FMOD_CHANNELGROUP *channelgroup, float *volume);
  FMOD_RESULT FMOD_ChannelGroup_SetPitch         (FMOD_CHANNELGROUP *channelgroup, float pitch);
  FMOD_RESULT FMOD_ChannelGroup_GetPitch         (FMOD_CHANNELGROUP *channelgroup, float *pitch);
  FMOD_RESULT FMOD_ChannelGroup_Set3DOcclusion   (FMOD_CHANNELGROUP *channelgroup, float directocclusion, float reverbocclusion);
  FMOD_RESULT FMOD_ChannelGroup_Get3DOcclusion   (FMOD_CHANNELGROUP *channelgroup, float *directocclusion, float *reverbocclusion);
  FMOD_RESULT FMOD_ChannelGroup_SetPaused        (FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL paused);
  FMOD_RESULT FMOD_ChannelGroup_GetPaused        (FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *paused);
  FMOD_RESULT FMOD_ChannelGroup_SetMute          (FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL mute);
  FMOD_RESULT FMOD_ChannelGroup_GetMute          (FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *mute);
  FMOD_RESULT FMOD_ChannelGroup_Stop             (FMOD_CHANNELGROUP *channelgroup);
  FMOD_RESULT FMOD_ChannelGroup_OverrideVolume   (FMOD_CHANNELGROUP *channelgroup, float volume);
  FMOD_RESULT FMOD_ChannelGroup_OverrideFrequency(FMOD_CHANNELGROUP *channelgroup, float frequency);
  FMOD_RESULT FMOD_ChannelGroup_OverridePan      (FMOD_CHANNELGROUP *channelgroup, float pan);
  FMOD_RESULT FMOD_ChannelGroup_OverrideReverbProperties(FMOD_CHANNELGROUP *channelgroup, const FMOD_REVERB_CHANNELPROPERTIES *prop);
  FMOD_RESULT FMOD_ChannelGroup_Override3DAttributes(FMOD_CHANNELGROUP *channelgroup, const FMOD_VECTOR *pos, const FMOD_VECTOR *vel);
  FMOD_RESULT FMOD_ChannelGroup_OverrideSpeakerMix(FMOD_CHANNELGROUP *channelgroup, float frontleft, float frontright, float center, float lfe, float backleft, float backright, float sideleft, float sideright);
  FMOD_RESULT FMOD_ChannelGroup_AddGroup         (FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELGROUP *group);
  FMOD_RESULT FMOD_ChannelGroup_GetNumGroups     (FMOD_CHANNELGROUP *channelgroup, int *numgroups);
  FMOD_RESULT FMOD_ChannelGroup_GetGroup         (FMOD_CHANNELGROUP *channelgroup, int index, FMOD_CHANNELGROUP **group);
  FMOD_RESULT FMOD_ChannelGroup_GetParentGroup   (FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELGROUP **group);
  FMOD_RESULT FMOD_ChannelGroup_GetDSPHead       (FMOD_CHANNELGROUP *channelgroup, FMOD_DSP **dsp);
  FMOD_RESULT FMOD_ChannelGroup_AddDSP           (FMOD_CHANNELGROUP *channelgroup, FMOD_DSP *dsp, FMOD_DSPCONNECTION **connection);
  FMOD_RESULT FMOD_ChannelGroup_GetName          (FMOD_CHANNELGROUP *channelgroup, char *name, int namelen);
  FMOD_RESULT FMOD_ChannelGroup_GetNumChannels   (FMOD_CHANNELGROUP *channelgroup, int *numchannels);
  FMOD_RESULT FMOD_ChannelGroup_GetChannel       (FMOD_CHANNELGROUP *channelgroup, int index, FMOD_CHANNEL **channel);
  FMOD_RESULT FMOD_ChannelGroup_GetSpectrum      (FMOD_CHANNELGROUP *channelgroup, float *spectrumarray, int numvalues, int channeloffset, FMOD_DSP_FFT_WINDOW windowtype);
  FMOD_RESULT FMOD_ChannelGroup_GetWaveData      (FMOD_CHANNELGROUP *channelgroup, float *wavearray, int numvalues, int channeloffset);
  FMOD_RESULT FMOD_ChannelGroup_SetUserData      (FMOD_CHANNELGROUP *channelgroup, void *userdata);
  FMOD_RESULT FMOD_ChannelGroup_GetUserData      (FMOD_CHANNELGROUP *channelgroup, void **userdata);
  FMOD_RESULT FMOD_ChannelGroup_GetMemoryInfo    (FMOD_CHANNELGROUP *channelgroup, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_SoundGroup_Release            (FMOD_SOUNDGROUP *soundgroup);
  FMOD_RESULT FMOD_SoundGroup_GetSystemObject    (FMOD_SOUNDGROUP *soundgroup, FMOD_SYSTEM **system);
  FMOD_RESULT FMOD_SoundGroup_SetMaxAudible      (FMOD_SOUNDGROUP *soundgroup, int maxaudible);
  FMOD_RESULT FMOD_SoundGroup_GetMaxAudible      (FMOD_SOUNDGROUP *soundgroup, int *maxaudible);
  FMOD_RESULT FMOD_SoundGroup_SetMaxAudibleBehavior(FMOD_SOUNDGROUP *soundgroup, FMOD_SOUNDGROUP_BEHAVIOR behavior);
  FMOD_RESULT FMOD_SoundGroup_GetMaxAudibleBehavior(FMOD_SOUNDGROUP *soundgroup, FMOD_SOUNDGROUP_BEHAVIOR *behavior);
  FMOD_RESULT FMOD_SoundGroup_SetMuteFadeSpeed   (FMOD_SOUNDGROUP *soundgroup, float speed);
  FMOD_RESULT FMOD_SoundGroup_GetMuteFadeSpeed   (FMOD_SOUNDGROUP *soundgroup, float *speed);
  FMOD_RESULT FMOD_SoundGroup_SetVolume          (FMOD_SOUNDGROUP *soundgroup, float volume);
  FMOD_RESULT FMOD_SoundGroup_GetVolume          (FMOD_SOUNDGROUP *soundgroup, float *volume);
  FMOD_RESULT FMOD_SoundGroup_Stop               (FMOD_SOUNDGROUP *soundgroup);
  FMOD_RESULT FMOD_SoundGroup_GetName            (FMOD_SOUNDGROUP *soundgroup, char *name, int namelen);
  FMOD_RESULT FMOD_SoundGroup_GetNumSounds       (FMOD_SOUNDGROUP *soundgroup, int *numsounds);
  FMOD_RESULT FMOD_SoundGroup_GetSound           (FMOD_SOUNDGROUP *soundgroup, int index, FMOD_SOUND **sound);
  FMOD_RESULT FMOD_SoundGroup_GetNumPlaying      (FMOD_SOUNDGROUP *soundgroup, int *numplaying);
  FMOD_RESULT FMOD_SoundGroup_SetUserData        (FMOD_SOUNDGROUP *soundgroup, void *userdata);
  FMOD_RESULT FMOD_SoundGroup_GetUserData        (FMOD_SOUNDGROUP *soundgroup, void **userdata);
  FMOD_RESULT FMOD_SoundGroup_GetMemoryInfo      (FMOD_SOUNDGROUP *soundgroup, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_DSP_Release                   (FMOD_DSP *dsp);
  FMOD_RESULT FMOD_DSP_GetSystemObject           (FMOD_DSP *dsp, FMOD_SYSTEM **system);
  FMOD_RESULT FMOD_DSP_AddInput                  (FMOD_DSP *dsp, FMOD_DSP *target, FMOD_DSPCONNECTION **connection);
  FMOD_RESULT FMOD_DSP_DisconnectFrom            (FMOD_DSP *dsp, FMOD_DSP *target);
  FMOD_RESULT FMOD_DSP_DisconnectAll             (FMOD_DSP *dsp, FMOD_BOOL inputs, FMOD_BOOL outputs);
  FMOD_RESULT FMOD_DSP_Remove                    (FMOD_DSP *dsp);
  FMOD_RESULT FMOD_DSP_GetNumInputs              (FMOD_DSP *dsp, int *numinputs);
  FMOD_RESULT FMOD_DSP_GetNumOutputs             (FMOD_DSP *dsp, int *numoutputs);
  FMOD_RESULT FMOD_DSP_GetInput                  (FMOD_DSP *dsp, int index, FMOD_DSP **input, FMOD_DSPCONNECTION **inputconnection);
  FMOD_RESULT FMOD_DSP_GetOutput                 (FMOD_DSP *dsp, int index, FMOD_DSP **output, FMOD_DSPCONNECTION **outputconnection);
  FMOD_RESULT FMOD_DSP_SetActive                 (FMOD_DSP *dsp, FMOD_BOOL active);
  FMOD_RESULT FMOD_DSP_GetActive                 (FMOD_DSP *dsp, FMOD_BOOL *active);
  FMOD_RESULT FMOD_DSP_SetBypass                 (FMOD_DSP *dsp, FMOD_BOOL bypass);
  FMOD_RESULT FMOD_DSP_GetBypass                 (FMOD_DSP *dsp, FMOD_BOOL *bypass);
  FMOD_RESULT FMOD_DSP_SetSpeakerActive          (FMOD_DSP *dsp, FMOD_SPEAKER speaker, FMOD_BOOL active);
  FMOD_RESULT FMOD_DSP_GetSpeakerActive          (FMOD_DSP *dsp, FMOD_SPEAKER speaker, FMOD_BOOL *active);
  FMOD_RESULT FMOD_DSP_Reset                     (FMOD_DSP *dsp);
  FMOD_RESULT FMOD_DSP_SetParameter              (FMOD_DSP *dsp, int index, float value);
  FMOD_RESULT FMOD_DSP_GetParameter              (FMOD_DSP *dsp, int index, float *value, char *valuestr, int valuestrlen);
  FMOD_RESULT FMOD_DSP_GetNumParameters          (FMOD_DSP *dsp, int *numparams);
  FMOD_RESULT FMOD_DSP_GetParameterInfo          (FMOD_DSP *dsp, int index, char *name, char *label, char *description, int descriptionlen, float *min, float *max);
  FMOD_RESULT FMOD_DSP_ShowConfigDialog          (FMOD_DSP *dsp, void *hwnd, FMOD_BOOL show);
  FMOD_RESULT FMOD_DSP_GetInfo                   (FMOD_DSP *dsp, char *name, unsigned int *version, int *channels, int *configwidth, int *configheight);
  FMOD_RESULT FMOD_DSP_GetType                   (FMOD_DSP *dsp, FMOD_DSP_TYPE *type);
  FMOD_RESULT FMOD_DSP_SetDefaults               (FMOD_DSP *dsp, float frequency, float volume, float pan, int priority);
  FMOD_RESULT FMOD_DSP_GetDefaults               (FMOD_DSP *dsp, float *frequency, float *volume, float *pan, int *priority);
  FMOD_RESULT FMOD_DSP_SetUserData               (FMOD_DSP *dsp, void *userdata);
  FMOD_RESULT FMOD_DSP_GetUserData               (FMOD_DSP *dsp, void **userdata);
  FMOD_RESULT FMOD_DSP_GetMemoryInfo             (FMOD_DSP *dsp, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_DSPConnection_GetInput        (FMOD_DSPCONNECTION *dspconnection, FMOD_DSP **input);
  FMOD_RESULT FMOD_DSPConnection_GetOutput       (FMOD_DSPCONNECTION *dspconnection, FMOD_DSP **output);
  FMOD_RESULT FMOD_DSPConnection_SetMix          (FMOD_DSPCONNECTION *dspconnection, float volume);
  FMOD_RESULT FMOD_DSPConnection_GetMix          (FMOD_DSPCONNECTION *dspconnection, float *volume);
  FMOD_RESULT FMOD_DSPConnection_SetLevels       (FMOD_DSPCONNECTION *dspconnection, FMOD_SPEAKER speaker, float *levels, int numlevels);
  FMOD_RESULT FMOD_DSPConnection_GetLevels       (FMOD_DSPCONNECTION *dspconnection, FMOD_SPEAKER speaker, float *levels, int numlevels);
  FMOD_RESULT FMOD_DSPConnection_SetUserData     (FMOD_DSPCONNECTION *dspconnection, void *userdata);
  FMOD_RESULT FMOD_DSPConnection_GetUserData     (FMOD_DSPCONNECTION *dspconnection, void **userdata);
  FMOD_RESULT FMOD_DSPConnection_GetMemoryInfo   (FMOD_DSPCONNECTION *dspconnection, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_Geometry_Release              (FMOD_GEOMETRY *geometry);
  FMOD_RESULT FMOD_Geometry_AddPolygon           (FMOD_GEOMETRY *geometry, float directocclusion, float reverbocclusion, FMOD_BOOL doublesided, int numvertices, const FMOD_VECTOR *vertices, int *polygonindex);
  FMOD_RESULT FMOD_Geometry_GetNumPolygons       (FMOD_GEOMETRY *geometry, int *numpolygons);
  FMOD_RESULT FMOD_Geometry_GetMaxPolygons       (FMOD_GEOMETRY *geometry, int *maxpolygons, int *maxvertices);
  FMOD_RESULT FMOD_Geometry_GetPolygonNumVertices(FMOD_GEOMETRY *geometry, int index, int *numvertices);
  FMOD_RESULT FMOD_Geometry_SetPolygonVertex     (FMOD_GEOMETRY *geometry, int index, int vertexindex, const FMOD_VECTOR *vertex);
  FMOD_RESULT FMOD_Geometry_GetPolygonVertex     (FMOD_GEOMETRY *geometry, int index, int vertexindex, FMOD_VECTOR *vertex);
  FMOD_RESULT FMOD_Geometry_SetPolygonAttributes (FMOD_GEOMETRY *geometry, int index, float directocclusion, float reverbocclusion, FMOD_BOOL doublesided);
  FMOD_RESULT FMOD_Geometry_GetPolygonAttributes (FMOD_GEOMETRY *geometry, int index, float *directocclusion, float *reverbocclusion, FMOD_BOOL *doublesided);
  FMOD_RESULT FMOD_Geometry_SetActive            (FMOD_GEOMETRY *geometry, FMOD_BOOL active);
  FMOD_RESULT FMOD_Geometry_GetActive            (FMOD_GEOMETRY *geometry, FMOD_BOOL *active);
  FMOD_RESULT FMOD_Geometry_SetRotation          (FMOD_GEOMETRY *geometry, const FMOD_VECTOR *forward, const FMOD_VECTOR *up);
  FMOD_RESULT FMOD_Geometry_GetRotation          (FMOD_GEOMETRY *geometry, FMOD_VECTOR *forward, FMOD_VECTOR *up);
  FMOD_RESULT FMOD_Geometry_SetPosition          (FMOD_GEOMETRY *geometry, const FMOD_VECTOR *position);
  FMOD_RESULT FMOD_Geometry_GetPosition          (FMOD_GEOMETRY *geometry, FMOD_VECTOR *position);
  FMOD_RESULT FMOD_Geometry_SetScale             (FMOD_GEOMETRY *geometry, const FMOD_VECTOR *scale);
  FMOD_RESULT FMOD_Geometry_GetScale             (FMOD_GEOMETRY *geometry, FMOD_VECTOR *scale);
  FMOD_RESULT FMOD_Geometry_Save                 (FMOD_GEOMETRY *geometry, void *data, int *datasize);
  FMOD_RESULT FMOD_Geometry_SetUserData          (FMOD_GEOMETRY *geometry, void *userdata);
  FMOD_RESULT FMOD_Geometry_GetUserData          (FMOD_GEOMETRY *geometry, void **userdata);
  FMOD_RESULT FMOD_Geometry_GetMemoryInfo        (FMOD_GEOMETRY *geometry, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
  FMOD_RESULT FMOD_Reverb_Release                (FMOD_REVERB *reverb);
  FMOD_RESULT FMOD_Reverb_Set3DAttributes        (FMOD_REVERB *reverb, const FMOD_VECTOR *position, float mindistance, float maxdistance);
  FMOD_RESULT FMOD_Reverb_Get3DAttributes        (FMOD_REVERB *reverb, FMOD_VECTOR *position, float *mindistance, float *maxdistance);
  FMOD_RESULT FMOD_Reverb_SetProperties          (FMOD_REVERB *reverb, const FMOD_REVERB_PROPERTIES *properties);
  FMOD_RESULT FMOD_Reverb_GetProperties          (FMOD_REVERB *reverb, FMOD_REVERB_PROPERTIES *properties);
  FMOD_RESULT FMOD_Reverb_SetActive              (FMOD_REVERB *reverb, FMOD_BOOL active);
  FMOD_RESULT FMOD_Reverb_GetActive              (FMOD_REVERB *reverb, FMOD_BOOL *active);
  FMOD_RESULT FMOD_Reverb_SetUserData            (FMOD_REVERB *reverb, void *userdata);
  FMOD_RESULT FMOD_Reverb_GetUserData            (FMOD_REVERB *reverb, void **userdata);
  FMOD_RESULT FMOD_Reverb_GetMemoryInfo          (FMOD_REVERB *reverb, unsigned int memorybits, unsigned int event_memorybits, unsigned int *memoryused, FMOD_MEMORY_USAGE_DETAILS *memoryused_details);
]]

return ffi.load 'fmodex'
