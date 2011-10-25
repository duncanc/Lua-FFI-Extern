
local ffi = require 'ffi'

ffi.cdef [[

  typedef enum {
    SDL_FALSE = 0,
    SDL_TRUE  = 1
  } SDL_bool;

  typedef int8_t		Sint8;
  typedef uint8_t		Uint8;
  typedef int16_t		Sint16;
  typedef uint16_t	Uint16;
  typedef int32_t		Sint32;
  typedef uint32_t	Uint32;
  typedef struct {
    Uint32 hi;
    Uint32 lo;
  } Uint64, Sint64;
  
  enum {
    SDL_INIT_TIMER = 0x00000001,
    SDL_INIT_AUDIO = 0x00000010,
    SDL_INIT_VIDEO = 0x00000020,
    SDL_INIT_CDROM = 0x00000100,
    SDL_INIT_JOYSTICK	= 0x00000200,
    SDL_INIT_NOPARACHUTE = 0x00100000,
    SDL_INIT_EVENTTHREAD = 0x01000000,
    SDL_INIT_EVERYTHING = 0x0000FFFF
  };
  
  int SDL_Init(Uint32 flags);
  int SDL_InitSubSystem(Uint32 flags);
  void SDL_QuitSubSystem(Uint32 flags);
  Uint32 SDL_WasInit(Uint32 flags);
  void SDL_Quit(void);
  
]]

-- version
ffi.cdef [[
	
  enum {
    SDL_MAJOR_VERSION	= 1,
    SDL_MINOR_VERSION	= 2,
    SDL_PATCHLEVEL = 14
  };

  typedef struct SDL_version {
    Uint8 major;
    Uint8 minor;
    Uint8 patch;
  } SDL_version;

  const SDL_version* SDL_Linked_Version(void);
	
]]

-- keyboard
ffi.cdef [[
  typedef enum {
    SDLK_UNKNOWN		= 0,
    SDLK_FIRST		= 0,
    SDLK_BACKSPACE		= 8,
    SDLK_TAB		= 9,
    SDLK_CLEAR		= 12,
    SDLK_RETURN		= 13,
    SDLK_PAUSE		= 19,
    SDLK_ESCAPE		= 27,
    SDLK_SPACE		= 32,
    SDLK_EXCLAIM		= 33,
    SDLK_QUOTEDBL		= 34,
    SDLK_HASH		= 35,
    SDLK_DOLLAR		= 36,
    SDLK_AMPERSAND		= 38,
    SDLK_QUOTE		= 39,
    SDLK_LEFTPAREN		= 40,
    SDLK_RIGHTPAREN		= 41,
    SDLK_ASTERISK		= 42,
    SDLK_PLUS		= 43,
    SDLK_COMMA		= 44,
    SDLK_MINUS		= 45,
    SDLK_PERIOD		= 46,
    SDLK_SLASH		= 47,
    SDLK_0			= 48,
    SDLK_1			= 49,
    SDLK_2			= 50,
    SDLK_3			= 51,
    SDLK_4			= 52,
    SDLK_5			= 53,
    SDLK_6			= 54,
    SDLK_7			= 55,
    SDLK_8			= 56,
    SDLK_9			= 57,
    SDLK_COLON		= 58,
    SDLK_SEMICOLON		= 59,
    SDLK_LESS		= 60,
    SDLK_EQUALS		= 61,
    SDLK_GREATER		= 62,
    SDLK_QUESTION		= 63,
    SDLK_AT			= 64,
    /* 
       Skip uppercase letters
     */
    SDLK_LEFTBRACKET	= 91,
    SDLK_BACKSLASH		= 92,
    SDLK_RIGHTBRACKET	= 93,
    SDLK_CARET		= 94,
    SDLK_UNDERSCORE		= 95,
    SDLK_BACKQUOTE		= 96,
    SDLK_a			= 97,
    SDLK_b			= 98,
    SDLK_c			= 99,
    SDLK_d			= 100,
    SDLK_e			= 101,
    SDLK_f			= 102,
    SDLK_g			= 103,
    SDLK_h			= 104,
    SDLK_i			= 105,
    SDLK_j			= 106,
    SDLK_k			= 107,
    SDLK_l			= 108,
    SDLK_m			= 109,
    SDLK_n			= 110,
    SDLK_o			= 111,
    SDLK_p			= 112,
    SDLK_q			= 113,
    SDLK_r			= 114,
    SDLK_s			= 115,
    SDLK_t			= 116,
    SDLK_u			= 117,
    SDLK_v			= 118,
    SDLK_w			= 119,
    SDLK_x			= 120,
    SDLK_y			= 121,
    SDLK_z			= 122,
    SDLK_DELETE		= 127,
    /* End of ASCII mapped keysyms */
          /*@}*/

    /** @name International keyboard syms */
          /*@{*/
    SDLK_WORLD_0		= 160,		/* 0xA0 */
    SDLK_WORLD_1		= 161,
    SDLK_WORLD_2		= 162,
    SDLK_WORLD_3		= 163,
    SDLK_WORLD_4		= 164,
    SDLK_WORLD_5		= 165,
    SDLK_WORLD_6		= 166,
    SDLK_WORLD_7		= 167,
    SDLK_WORLD_8		= 168,
    SDLK_WORLD_9		= 169,
    SDLK_WORLD_10		= 170,
    SDLK_WORLD_11		= 171,
    SDLK_WORLD_12		= 172,
    SDLK_WORLD_13		= 173,
    SDLK_WORLD_14		= 174,
    SDLK_WORLD_15		= 175,
    SDLK_WORLD_16		= 176,
    SDLK_WORLD_17		= 177,
    SDLK_WORLD_18		= 178,
    SDLK_WORLD_19		= 179,
    SDLK_WORLD_20		= 180,
    SDLK_WORLD_21		= 181,
    SDLK_WORLD_22		= 182,
    SDLK_WORLD_23		= 183,
    SDLK_WORLD_24		= 184,
    SDLK_WORLD_25		= 185,
    SDLK_WORLD_26		= 186,
    SDLK_WORLD_27		= 187,
    SDLK_WORLD_28		= 188,
    SDLK_WORLD_29		= 189,
    SDLK_WORLD_30		= 190,
    SDLK_WORLD_31		= 191,
    SDLK_WORLD_32		= 192,
    SDLK_WORLD_33		= 193,
    SDLK_WORLD_34		= 194,
    SDLK_WORLD_35		= 195,
    SDLK_WORLD_36		= 196,
    SDLK_WORLD_37		= 197,
    SDLK_WORLD_38		= 198,
    SDLK_WORLD_39		= 199,
    SDLK_WORLD_40		= 200,
    SDLK_WORLD_41		= 201,
    SDLK_WORLD_42		= 202,
    SDLK_WORLD_43		= 203,
    SDLK_WORLD_44		= 204,
    SDLK_WORLD_45		= 205,
    SDLK_WORLD_46		= 206,
    SDLK_WORLD_47		= 207,
    SDLK_WORLD_48		= 208,
    SDLK_WORLD_49		= 209,
    SDLK_WORLD_50		= 210,
    SDLK_WORLD_51		= 211,
    SDLK_WORLD_52		= 212,
    SDLK_WORLD_53		= 213,
    SDLK_WORLD_54		= 214,
    SDLK_WORLD_55		= 215,
    SDLK_WORLD_56		= 216,
    SDLK_WORLD_57		= 217,
    SDLK_WORLD_58		= 218,
    SDLK_WORLD_59		= 219,
    SDLK_WORLD_60		= 220,
    SDLK_WORLD_61		= 221,
    SDLK_WORLD_62		= 222,
    SDLK_WORLD_63		= 223,
    SDLK_WORLD_64		= 224,
    SDLK_WORLD_65		= 225,
    SDLK_WORLD_66		= 226,
    SDLK_WORLD_67		= 227,
    SDLK_WORLD_68		= 228,
    SDLK_WORLD_69		= 229,
    SDLK_WORLD_70		= 230,
    SDLK_WORLD_71		= 231,
    SDLK_WORLD_72		= 232,
    SDLK_WORLD_73		= 233,
    SDLK_WORLD_74		= 234,
    SDLK_WORLD_75		= 235,
    SDLK_WORLD_76		= 236,
    SDLK_WORLD_77		= 237,
    SDLK_WORLD_78		= 238,
    SDLK_WORLD_79		= 239,
    SDLK_WORLD_80		= 240,
    SDLK_WORLD_81		= 241,
    SDLK_WORLD_82		= 242,
    SDLK_WORLD_83		= 243,
    SDLK_WORLD_84		= 244,
    SDLK_WORLD_85		= 245,
    SDLK_WORLD_86		= 246,
    SDLK_WORLD_87		= 247,
    SDLK_WORLD_88		= 248,
    SDLK_WORLD_89		= 249,
    SDLK_WORLD_90		= 250,
    SDLK_WORLD_91		= 251,
    SDLK_WORLD_92		= 252,
    SDLK_WORLD_93		= 253,
    SDLK_WORLD_94		= 254,
    SDLK_WORLD_95		= 255,		/* 0xFF */
          /*@}*/

    /** @name Numeric keypad */
          /*@{*/
    SDLK_KP0		= 256,
    SDLK_KP1		= 257,
    SDLK_KP2		= 258,
    SDLK_KP3		= 259,
    SDLK_KP4		= 260,
    SDLK_KP5		= 261,
    SDLK_KP6		= 262,
    SDLK_KP7		= 263,
    SDLK_KP8		= 264,
    SDLK_KP9		= 265,
    SDLK_KP_PERIOD		= 266,
    SDLK_KP_DIVIDE		= 267,
    SDLK_KP_MULTIPLY	= 268,
    SDLK_KP_MINUS		= 269,
    SDLK_KP_PLUS		= 270,
    SDLK_KP_ENTER		= 271,
    SDLK_KP_EQUALS		= 272,
          /*@}*/

    /** @name Arrows + Home/End pad */
          /*@{*/
    SDLK_UP			= 273,
    SDLK_DOWN		= 274,
    SDLK_RIGHT		= 275,
    SDLK_LEFT		= 276,
    SDLK_INSERT		= 277,
    SDLK_HOME		= 278,
    SDLK_END		= 279,
    SDLK_PAGEUP		= 280,
    SDLK_PAGEDOWN		= 281,
          /*@}*/

    /** @name Function keys */
          /*@{*/
    SDLK_F1			= 282,
    SDLK_F2			= 283,
    SDLK_F3			= 284,
    SDLK_F4			= 285,
    SDLK_F5			= 286,
    SDLK_F6			= 287,
    SDLK_F7			= 288,
    SDLK_F8			= 289,
    SDLK_F9			= 290,
    SDLK_F10		= 291,
    SDLK_F11		= 292,
    SDLK_F12		= 293,
    SDLK_F13		= 294,
    SDLK_F14		= 295,
    SDLK_F15		= 296,
          /*@}*/

    /** @name Key state modifier keys */
          /*@{*/
    SDLK_NUMLOCK		= 300,
    SDLK_CAPSLOCK		= 301,
    SDLK_SCROLLOCK		= 302,
    SDLK_RSHIFT		= 303,
    SDLK_LSHIFT		= 304,
    SDLK_RCTRL		= 305,
    SDLK_LCTRL		= 306,
    SDLK_RALT		= 307,
    SDLK_LALT		= 308,
    SDLK_RMETA		= 309,
    SDLK_LMETA		= 310,
    SDLK_LSUPER		= 311,		/**< Left "Windows" key */
    SDLK_RSUPER		= 312,		/**< Right "Windows" key */
    SDLK_MODE		= 313,		/**< "Alt Gr" key */
    SDLK_COMPOSE		= 314,		/**< Multi-key compose key */
          /*@}*/

    /** @name Miscellaneous function keys */
          /*@{*/
    SDLK_HELP		= 315,
    SDLK_PRINT		= 316,
    SDLK_SYSREQ		= 317,
    SDLK_BREAK		= 318,
    SDLK_MENU		= 319,
    SDLK_POWER		= 320,		/**< Power Macintosh power key */
    SDLK_EURO		= 321,		/**< Some european keyboards */
    SDLK_UNDO		= 322,		/**< Atari keyboard has Undo */
          /*@}*/

    /* Add any other keys here */

    SDLK_LAST
  } SDLKey;

  /** Enumeration of valid key mods (possibly OR'd together) */
  typedef enum {
    KMOD_NONE  = 0x0000,
    KMOD_LSHIFT= 0x0001,
    KMOD_RSHIFT= 0x0002,
    KMOD_LCTRL = 0x0040,
    KMOD_RCTRL = 0x0080,
    KMOD_LALT  = 0x0100,
    KMOD_RALT  = 0x0200,
    KMOD_LMETA = 0x0400,
    KMOD_RMETA = 0x0800,
    KMOD_NUM   = 0x1000,
    KMOD_CAPS  = 0x2000,
    KMOD_MODE  = 0x4000,
    KMOD_RESERVED = 0x8000
  } SDLMod;
  
  typedef struct SDL_keysym {
    Uint8 scancode;			/**< hardware specific scancode */
    SDLKey sym;			/**< SDL virtual keysym */
    SDLMod mod;			/**< current key modifiers */
    Uint16 unicode;			/**< translated character */
  } SDL_keysym;

  enum {
    SDL_ALL_HOTKEYS = 0xFFFFFFFF
  };

  int SDL_EnableUNICODE(int enable);
  
  enum {
    SDL_DEFAULT_REPEAT_DELAY = 500,
    SDL_DEFAULT_REPEAT_INTERVAL =	30
  };

  int SDL_EnableKeyRepeat(int delay, int interval);
  void SDL_GetKeyRepeat(int *delay, int *interval);

  Uint8 * SDL_GetKeyState(int *numkeys);

  SDLMod SDL_GetModState(void);

  void SDL_SetModState(SDLMod modstate);

  char * SDL_GetKeyName(SDLKey key);
]]

-- rwops
ffi.cdef [[
  typedef struct SDL_RWops {
    int (*seek)(struct SDL_RWops *context, int offset, int whence);
    int (*read)(struct SDL_RWops *context, void *ptr, int size, int maxnum);
    int (*write)(struct SDL_RWops *context, const void *ptr, int size, int num);
    int (*close)(struct SDL_RWops *context);
    Uint32 type;
  } SDL_RWops;

  SDL_RWops* SDL_RWFromFile(const char *file, const char *mode);
  SDL_RWops* SDL_RWFromMem(void *mem, int size);
  SDL_RWops* SDL_RWFromConstMem(const void *mem, int size);

  SDL_RWops* SDL_AllocRW(void);
  void SDL_FreeRW(SDL_RWops* area);

  enum {
    RW_SEEK_SET	= 0,
    RW_SEEK_CUR = 1,
    RW_SEEK_END = 2
  };

  Uint16 SDL_ReadLE16(SDL_RWops *src);
  Uint16 SDL_ReadBE16(SDL_RWops *src);
  Uint32 SDL_ReadLE32(SDL_RWops *src);
  Uint32 SDL_ReadBE32(SDL_RWops *src);
  Uint64 SDL_ReadLE64(SDL_RWops *src);
  Uint64 SDL_ReadBE64(SDL_RWops *src);

  int SDL_WriteLE16(SDL_RWops *dst, Uint16 value);
  int SDL_WriteBE16(SDL_RWops *dst, Uint16 value);
  int SDL_WriteLE32(SDL_RWops *dst, Uint32 value);
  int SDL_WriteBE32(SDL_RWops *dst, Uint32 value);
  int SDL_WriteLE64(SDL_RWops *dst, Uint64 value);
  int SDL_WriteBE64(SDL_RWops *dst, Uint64 value);
]]

-- events
ffi.cdef[[
  enum {
    SDL_RELEASED = 0,
    SDL_PRESSED = 1
  };

  typedef enum {
     SDL_NOEVENT = 0,
     SDL_ACTIVEEVENT = 1,
     SDL_KEYDOWN = 2,
     SDL_KEYUP = 3,
     SDL_MOUSEMOTION = 4,
     SDL_MOUSEBUTTONDOWN = 5,
     SDL_MOUSEBUTTONUP = 6,
     SDL_JOYAXISMOTION = 7,
     SDL_JOYBALLMOTION = 8,
     SDL_JOYHATMOTION = 9,
     SDL_JOYBUTTONDOWN = 10,
     SDL_JOYBUTTONUP = 11,
     SDL_QUIT = 12,
     SDL_SYSWMEVENT = 13,
     SDL_EVENT_RESERVEDA = 14,
     SDL_EVENT_RESERVEDB = 15,
     SDL_VIDEORESIZE = 16,
     SDL_VIDEOEXPOSE = 17,
     SDL_EVENT_RESERVED2 = 18,
     SDL_EVENT_RESERVED3 = 19,
     SDL_EVENT_RESERVED4 = 20,
     SDL_EVENT_RESERVED5 = 21,
     SDL_EVENT_RESERVED6 = 22,
     SDL_EVENT_RESERVED7 = 23,
     SDL_USEREVENT = 24,
     SDL_NUMEVENTS = 32
  } SDL_EventType;

  typedef enum {
    SDL_ACTIVEEVENTMASK	    = 0x00000002,
		
    SDL_KEYDOWNMASK		      = 0x00000004,
    SDL_KEYUPMASK		        = 0x00000008,
    SDL_KEYEVENTMASK	      = 0x0000000E,
		
    SDL_MOUSEMOTIONMASK	    = 0x00000010,
    SDL_MOUSEBUTTONDOWNMASK	= 0x00000020,
    SDL_MOUSEBUTTONUPMASK	  = 0x00000040,
    SDL_MOUSEEVENTMASK	    = 0x00000070,
		
    SDL_JOYAXISMOTIONMASK	  = 0x00000080,
    SDL_JOYBALLMOTIONMASK	  = 0x00000100,
    SDL_JOYHATMOTIONMASK	  = 0x00000200,
    SDL_JOYBUTTONDOWNMASK	  = 0x00000400,
    SDL_JOYBUTTONUPMASK	    = 0x00000800,
    SDL_JOYEVENTMASK	      = 0x00000F80,
		
    SDL_VIDEORESIZEMASK	    = 0x00010000,
    SDL_VIDEOEXPOSEMASK	    = 0x00020000,
    SDL_QUITMASK		        = 0x00001000,
    SDL_SYSWMEVENTMASK	    = 0x00002000,
		
    SDL_ALLEVENTS           = 0xFFFFFFFF
  } SDL_EventMask;

  typedef struct SDL_ActiveEvent {
    Uint8 type, gain, state;
  } SDL_ActiveEvent;

  typedef struct SDL_KeyboardEvent {
    Uint8 type, which, state;
    SDL_keysym keysym;
  } SDL_KeyboardEvent;

  typedef struct SDL_MouseMotionEvent {
    Uint8 type, which, state;
    Uint16 x, y;
    Sint16 xrel, yrel;
  } SDL_MouseMotionEvent;

  typedef struct SDL_MouseButtonEvent {
    Uint8 type, which, button, state;
    Uint16 x, y;
  } SDL_MouseButtonEvent;

  typedef struct SDL_JoyAxisEvent {
    Uint8 type, which, axis;
    Sint16 value;
  } SDL_JoyAxisEvent;

  typedef struct SDL_JoyBallEvent {
    Uint8 type, which, ball;
    Sint16 xrel, yrel;
  } SDL_JoyBallEvent;

  typedef struct SDL_JoyHatEvent {
    Uint8 type, which, hat;
    Uint8 value;
  } SDL_JoyHatEvent;

  typedef struct SDL_JoyButtonEvent {
    Uint8 type, which, button, state;
  } SDL_JoyButtonEvent;

  typedef struct SDL_ResizeEvent {
    Uint8 type;
    int w, h;
  } SDL_ResizeEvent;

  typedef struct SDL_ExposeEvent {
    Uint8 type;
  } SDL_ExposeEvent;

  typedef struct SDL_QuitEvent {
    Uint8 type;
  } SDL_QuitEvent;

  typedef struct SDL_UserEvent {
    Uint8 type;
    int code;
    void* data1;
    void* data2;
  } SDL_UserEvent;

  struct SDL_SysWMmsg;
  typedef struct SDL_SysWMmsg SDL_SysWMmsg;
  typedef struct SDL_SysWMEvent {
    Uint8 type;
    SDL_SysWMmsg *msg;
  } SDL_SysWMEvent;
  typedef union SDL_Event {
    Uint8 type;
    SDL_ActiveEvent active;
    SDL_KeyboardEvent key;
    SDL_MouseMotionEvent motion;
    SDL_MouseButtonEvent button;
    SDL_JoyAxisEvent jaxis;
    SDL_JoyBallEvent jball;
    SDL_JoyHatEvent jhat;
    SDL_JoyButtonEvent jbutton;
    SDL_ResizeEvent resize;
    SDL_ExposeEvent expose;
    SDL_QuitEvent quit;
    SDL_UserEvent user;
    SDL_SysWMEvent syswm;
  } SDL_Event;
	
  void SDL_PumpEvents(void);
	
  typedef enum {
    SDL_ADDEVENT,
    SDL_PEEKEVENT,
    SDL_GETEVENT
  } SDL_eventaction;
  int SDL_PeepEvents(SDL_Event *events, int numevents,
          SDL_eventaction action, Uint32 mask);
  int SDL_PollEvent(SDL_Event *event);
  int SDL_WaitEvent(SDL_Event *event);
  int SDL_PushEvent(SDL_Event *event);
  typedef int (*SDL_EventFilter)(const SDL_Event *event);
  void SDL_SetEventFilter(SDL_EventFilter filter);
  SDL_EventFilter SDL_GetEventFilter(void);

  enum {
    SDL_QUERY = -1,
    SDL_IGNORE = 0,
    SDL_DISABLE = 0,
    SDL_ENABLE = 1
  };
  
  Uint8 SDL_EventState(Uint8 type, int state);
	
]]

-- video
ffi.cdef[[

  typedef struct SDL_Rect {
    Sint16 x, y;
    Uint16 w, h;
  } SDL_Rect;

  typedef struct SDL_Color {
    Uint8 r;
    Uint8 g;
    Uint8 b;
    Uint8 unused;
  } SDL_Color;

  typedef struct SDL_Palette {
    int       ncolors;
    SDL_Color *colors;
  } SDL_Palette;

  typedef struct SDL_PixelFormat {
    SDL_Palette *palette;
    Uint8  BitsPerPixel, BytesPerPixel;
    Uint8  Rloss,  Gloss,  Bloss,  Aloss;
    Uint8  Rshift, Gshift, Bshift, Ashift;
    Uint32 Rmask,  Gmask,  Bmask,  Amask;
    Uint32 colorkey;
    Uint8  alpha;
  } SDL_PixelFormat;

  typedef struct SDL_Surface {
    Uint32 flags;
    SDL_PixelFormat *format;
    int w, h;
    Uint16 pitch;
    void *pixels;
    int offset;
    struct private_hwdata *hwdata;
    SDL_Rect clip_rect;
    Uint32 unused1;
    Uint32 locked;
    struct SDL_BlitMap *map;
    unsigned int format_version;
    int refcount;
  } SDL_Surface;
  
  enum {
    SDL_SWSURFACE	= 0x00000000,
    SDL_HWSURFACE	= 0x00000001,
    SDL_ASYNCBLIT	= 0x00000004,
		
    SDL_ANYFORMAT = 0x10000000,
    SDL_HWPALETTE = 0x20000000,
    SDL_DOUBLEBUF = 0x40000000,
    SDL_FULLSCREEN = 0x80000000,
    SDL_OPENGL = 0x00000002,
    SDL_OPENGLBLIT = 0x0000000A,
    SDL_RESIZABLE = 0x00000010,
    SDL_NOFRAME = 0x00000020,
		
    SDL_HWACCEL	= 0x00000100,
    SDL_SRCCOLORKEY = 0x00001000,
    SDL_RLEACCELOK = 0x00002000,
    SDL_RLEACCEL = 0x00004000,
    SDL_SRCALPHA = 0x00010000,
    SDL_PREALLOC = 0x01000000
  };
  
  typedef int (*SDL_blit)(struct SDL_Surface *src, SDL_Rect *srcrect,
        struct SDL_Surface *dst, SDL_Rect *dstrect);

  typedef struct SDL_VideoInfo {
    Uint32 hw_available :1;
    Uint32 wm_available :1;
    Uint32 UnusedBits1  :6;
    Uint32 UnusedBits2  :1;
    Uint32 blit_hw      :1;
    Uint32 blit_hw_CC   :1;
    Uint32 blit_hw_A    :1;
    Uint32 blit_sw      :1;
    Uint32 blit_sw_CC   :1;
    Uint32 blit_sw_A    :1;
    Uint32 blit_fill    :1;
    Uint32 UnusedBits3  :16;
    Uint32 video_mem;
    SDL_PixelFormat *vfmt;
    int    current_w;
    int    current_h;
  } SDL_VideoInfo;

  enum {
    SDL_YV12_OVERLAY = 0x32315659,
    SDL_IYUV_OVERLAY = 0x56555949,
    SDL_YUY2_OVERLAY = 0x32595559,
    SDL_UYVY_OVERLAY = 0x59565955,
    SDL_YVYU_OVERLAY = 0x55595659
  };

  typedef struct SDL_Overlay {
    Uint32 format;
    int w, h;
    int planes;
    Uint16 *pitches;
    Uint8 **pixels;
    struct private_yuvhwfuncs *hwfuncs;
    struct private_yuvhwdata *hwdata;
    Uint32 hw_overlay :1;
    Uint32 UnusedBits :31;
  } SDL_Overlay;

  typedef enum {
    SDL_GL_RED_SIZE,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_SWAP_CONTROL
  } SDL_GLattr;

  enum {
    SDL_LOGPAL = 0x01,
    SDL_PHYSPAL = 0x02
  };

  int SDL_VideoInit(const char *driver_name, Uint32 flags);
  void SDL_VideoQuit(void);
  char * SDL_VideoDriverName(char *namebuf, int maxlen);
  SDL_Surface * SDL_GetVideoSurface(void);
  const SDL_VideoInfo * SDL_GetVideoInfo(void);
  int SDL_VideoModeOK(int width, int height, int bpp, Uint32 flags);
  SDL_Rect ** SDL_ListModes(SDL_PixelFormat *format, Uint32 flags);
  SDL_Surface * SDL_SetVideoMode(int width, int height, int bpp, Uint32 flags);
  void SDL_UpdateRects(SDL_Surface *screen, int numrects, SDL_Rect *rects);
  void SDL_UpdateRect(SDL_Surface *screen, Sint32 x, Sint32 y, Uint32 w, Uint32 h);
  int SDL_Flip(SDL_Surface *screen);
  int SDL_SetGamma(float red, float green, float blue);
  int SDL_SetGammaRamp(const Uint16 *red, const Uint16 *green, const Uint16 *blue);
  int SDL_GetGammaRamp(Uint16 *red, Uint16 *green, Uint16 *blue);
  int SDL_SetColors(SDL_Surface *surface, SDL_Color *colors, int firstcolor, int ncolors);
  int SDL_SetPalette(SDL_Surface *surface, int flags, SDL_Color *colors, int firstcolor, int ncolors);
  Uint32 SDL_MapRGB(const SDL_PixelFormat * const format, Uint8 r, Uint8 g, Uint8 b);
  Uint32 SDL_MapRGBA(const SDL_PixelFormat * const format, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
  void SDL_GetRGB(Uint32 pixel, const SDL_PixelFormat* fmt, Uint8 *r, Uint8 *g, Uint8 *b);
  void SDL_GetRGBA(Uint32 pixel, const SDL_PixelFormat * const fmt, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a);
  SDL_Surface * SDL_CreateRGBSurface
        (Uint32 flags, int width, int height, int depth, 
        Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask);
  SDL_Surface * SDL_CreateRGBSurfaceFrom(void *pixels,
        int width, int height, int depth, int pitch,
        Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask);
  void SDL_FreeSurface(SDL_Surface *surface);
  int SDL_LockSurface(SDL_Surface *surface);
  void SDL_UnlockSurface(SDL_Surface *surface);
  SDL_Surface* SDL_LoadBMP_RW(SDL_RWops *src, int freesrc);

  int SDL_SaveBMP_RW(SDL_Surface *surface, SDL_RWops *dst, int freedst);

  int SDL_SetColorKey(SDL_Surface *surface, Uint32 flag, Uint32 key);

  int SDL_SetAlpha(SDL_Surface *surface, Uint32 flag, Uint8 alpha);

  SDL_bool SDL_SetClipRect(SDL_Surface *surface, const SDL_Rect *rect);

  void SDL_GetClipRect(SDL_Surface *surface, SDL_Rect *rect);

  SDL_Surface * SDL_ConvertSurface
        (SDL_Surface *src, SDL_PixelFormat *fmt, Uint32 flags);

  int SDL_UpperBlit
        (SDL_Surface *src, SDL_Rect *srcrect,
         SDL_Surface *dst, SDL_Rect *dstrect);
  int SDL_LowerBlit
        (SDL_Surface *src, SDL_Rect *srcrect,
         SDL_Surface *dst, SDL_Rect *dstrect);
  int SDL_FillRect
      (SDL_Surface *dst, SDL_Rect *dstrect, Uint32 color);
  SDL_Surface * SDL_DisplayFormat(SDL_Surface *surface);
  SDL_Surface * SDL_DisplayFormatAlpha(SDL_Surface *surface);
  SDL_Overlay * SDL_CreateYUVOverlay(int width, int height,
          Uint32 format, SDL_Surface *display);

  int SDL_LockYUVOverlay(SDL_Overlay *overlay);
  void SDL_UnlockYUVOverlay(SDL_Overlay *overlay);
  int SDL_DisplayYUVOverlay(SDL_Overlay *overlay, SDL_Rect *dstrect);
  void SDL_FreeYUVOverlay(SDL_Overlay *overlay);

  int SDL_GL_LoadLibrary(const char *path);

  void * SDL_GL_GetProcAddress(const char* proc);
  int SDL_GL_SetAttribute(SDL_GLattr attr, int value);
  int SDL_GL_GetAttribute(SDL_GLattr attr, int* value);
  void SDL_GL_SwapBuffers(void);
  void SDL_GL_UpdateRects(int numrects, SDL_Rect* rects);
  void SDL_GL_Lock(void);
  void SDL_GL_Unlock(void);
]]

-- window manager

if ffi.os == 'Windows' then

	ffi.cdef [[
	
		typedef struct SDL_SysWMinfo {
			SDL_version version;
			void* window; // window HWND
			void* hglrc;  // OpenGL context (if any)
		} SDL_SysWMinfo;
		
	]]
  
else

  ffi.cdef [[
  
    typedef struct SDL_SysWMinfo SDL_SysWMinfo;
    
  ]]
  
end

ffi.cdef [[
	
  void SDL_WM_SetCaption(const char *title, const char *icon);
  void SDL_WM_GetCaption(char **title, char **icon);
  void SDL_WM_SetIcon(SDL_Surface *icon, Uint8 *mask);
  int SDL_WM_IconifyWindow(void);
  int SDL_WM_ToggleFullScreen(SDL_Surface *surface);
  typedef enum {
    SDL_GRAB_QUERY = -1,
    SDL_GRAB_OFF = 0,
    SDL_GRAB_ON = 1,
    SDL_GRAB_FULLSCREEN	/**< Used internally */
  } SDL_GrabMode;
  SDL_GrabMode SDL_WM_GrabInput(SDL_GrabMode mode);
	int SDL_GetWMInfo(SDL_SysWMinfo* info);
	
]]

-- audio
ffi.cdef [[
  typedef struct SDL_AudioSpec {
    int freq;		/**< DSP frequency -- samples per second */
    Uint16 format;		/**< Audio data format */
    Uint8  channels;	/**< Number of channels: 1 mono, 2 stereo */
    Uint8  silence;		/**< Audio buffer silence value (calculated) */
    Uint16 samples;		/**< Audio buffer size in samples (power of 2) */
    Uint16 padding;		/**< Necessary for some compile environments */
    Uint32 size;		/**< Audio buffer size in bytes (calculated) */
    void (*callback)(void *userdata, Uint8 *stream, int len);
    void  *userdata;
  } SDL_AudioSpec;

  enum {
    AUDIO_U8 = 0x0008,	/**< Unsigned 8-bit samples */
    AUDIO_S8 = 0x8008,	/**< Signed 8-bit samples */
    AUDIO_U16LSB = 0x0010,	/**< Unsigned 16-bit samples */
    AUDIO_S16LSB = 0x8010,	/**< Signed 16-bit samples */
    AUDIO_U16MSB = 0x1010,	/**< As above, but big-endian byte order */
    AUDIO_S16MSB = 0x9010,	/**< As above, but big-endian byte order */
    AUDIO_U16 = AUDIO_U16LSB,
    AUDIO_S16 = AUDIO_S16LSB
  };

  typedef struct SDL_AudioCVT {
    int needed;			/**< Set to 1 if conversion possible */
    Uint16 src_format;		/**< Source audio format */
    Uint16 dst_format;		/**< Target audio format */
    double rate_incr;		/**< Rate conversion increment */
    Uint8 *buf;			/**< Buffer to hold entire audio data */
    int    len;			/**< Length of original audio buffer */
    int    len_cvt;			/**< Length of converted audio buffer */
    int    len_mult;		/**< buffer must be len*len_mult big */
    double len_ratio; 	/**< Given len, final size is len*len_ratio */
    void (*filters[10])(struct SDL_AudioCVT *cvt, Uint16 format);
    int filter_index;		/**< Current audio conversion function */
  } SDL_AudioCVT;

  int SDL_AudioInit(const char *driver_name);
  void SDL_AudioQuit(void);
  char * SDL_AudioDriverName(char *namebuf, int maxlen);
  int SDL_OpenAudio(SDL_AudioSpec *desired, SDL_AudioSpec *obtained);

  typedef enum {
    SDL_AUDIO_STOPPED = 0,
    SDL_AUDIO_PLAYING,
    SDL_AUDIO_PAUSED
  } SDL_audiostatus;

  SDL_audiostatus SDL_GetAudioStatus(void);
  void SDL_PauseAudio(int pause_on);
  SDL_AudioSpec * SDL_LoadWAV_RW(SDL_RWops *src, int freesrc, SDL_AudioSpec *spec, Uint8 **audio_buf, Uint32 *audio_len);
  void SDL_FreeWAV(Uint8 *audio_buf);
  int SDL_BuildAudioCVT(SDL_AudioCVT *cvt,
      Uint16 src_format, Uint8 src_channels, int src_rate,
      Uint16 dst_format, Uint8 dst_channels, int dst_rate);
  int SDL_ConvertAudio(SDL_AudioCVT *cvt);
  void SDL_MixAudio(Uint8 *dst, const Uint8 *src, Uint32 len, int volume);
  void SDL_LockAudio(void);
  void SDL_UnlockAudio(void);
  void SDL_CloseAudio(void);
]]

if ffi.abi('le') then
  ffi.cdef[[
    enum {
      AUDIO_U16SYS = AUDIO_U16LSB,
      AUDIO_S16SYS = AUDIO_S16LSB
    };
  ]]
else
  ffi.cdef[[
    enum {
      AUDIO_U16SYS = AUDIO_U16MSB,
      AUDIO_S16SYS = AUDIO_S16MSB
    };
  ]]
end

-- mouse
ffi.cdef [[

  typedef struct WMcursor WMcursor;	/* Implementation dependent */
  typedef struct SDL_Cursor {
    SDL_Rect area;			/* The area of the mouse cursor */
    Sint16 hot_x, hot_y;		/* The "tip" of the cursor */
    Uint8 *data;			/* B/W cursor data */
    Uint8 *mask;			/* B/W cursor mask */
    Uint8 *save[2];			/* Place to save cursor area */
    WMcursor *wm_cursor;		/* Window-manager cursor */
  } SDL_Cursor;

  Uint8 SDL_GetMouseState(int *x, int *y);
  Uint8 SDL_GetRelativeMouseState(int *x, int *y);
  void SDL_WarpMouse(Uint16 x, Uint16 y);
  SDL_Cursor * SDL_CreateCursor
      (Uint8 *data, Uint8 *mask, int w, int h, int hot_x, int hot_y);
  void SDL_SetCursor(SDL_Cursor *cursor);
  SDL_Cursor * SDL_GetCursor(void);
  void SDL_FreeCursor(SDL_Cursor *cursor);
  int SDL_ShowCursor(int toggle);
  enum {
    SDL_BUTTON_LEFT = 1,
    SDL_BUTTON_MIDDLE = 2,
    SDL_BUTTON_RIGHT = 3,
    SDL_BUTTON_WHEELUP = 4,
    SDL_BUTTON_WHEELDOWN = 5,
    SDL_BUTTON_X1 = 6,
    SDL_BUTTON_X2 = 7
  };
  
  enum {
    SDL_APPMOUSEFOCUS	= 0x01,
    SDL_APPINPUTFOCUS	= 0x02,
    SDL_APPACTIVE = 0x04
  };
	
]]

-- SDL_timer.h
ffi.cdef [[
  enum {
    SDL_TIMESLICE = 10,
    TIMER_RESOLUTION = 10
  };

  Uint32 SDL_GetTicks(void);
  void SDL_Delay(Uint32 ms);
  typedef Uint32 (*SDL_TimerCallback)(Uint32 interval);
  int SDL_SetTimer(Uint32 interval, SDL_TimerCallback callback);
  typedef Uint32 (*SDL_NewTimerCallback)(Uint32 interval, void *param);
  typedef struct _SDL_TimerID *SDL_TimerID;
  SDL_TimerID SDL_AddTimer(Uint32 interval, SDL_NewTimerCallback callback, void *param);
  SDL_bool SDL_RemoveTimer(SDL_TimerID t);
]]

ffi.metatype('SDL_Color', {
	__tostring = function(self)
		return 'SDL_Color<R:' .. self.r .. ',G:' .. self.g .. ',B:' .. self.b .. '>'
	end;
})

return ffi.load 'SDL'
