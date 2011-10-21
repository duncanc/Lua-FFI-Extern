
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.window.event'
require 'extern.sfml.window.videomode'
require 'extern.sfml.window.windowhandle'
require 'extern.sfml.window.types'

ffi.cdef [[

  enum {
    sfNone       = 0,
    sfTitlebar   = 1,
    sfResize     = 2,
    sfClose      = 4,
    sfFullscreen = 8
  };

  typedef struct {
    unsigned int DepthBits, StencilBits, AntialiasingLevel;
  } sfWindowSettings;

  sfWindow* sfWindow_Create(sfVideoMode Mode, const char* Title, unsigned long Style, sfWindowSettings Params);
  sfWindow* sfWindow_CreateFromHandle(sfWindowHandle Handle, sfWindowSettings Params);
  void sfWindow_Destroy(sfWindow* Window);
  void sfWindow_Close(sfWindow* Window);
  sfBool sfWindow_IsOpened(sfWindow* Window);
  unsigned int sfWindow_GetWidth(sfWindow* Window);
  unsigned int sfWindow_GetHeight(sfWindow* Window);
  sfWindowSettings sfWindow_GetSettings(sfWindow* Window);
  sfBool sfWindow_GetEvent(sfWindow* Window, sfEvent* Event);
  void sfWindow_UseVerticalSync(sfWindow* Window, sfBool Enabled);
  void sfWindow_ShowMouseCursor(sfWindow* Window, sfBool Show);
  void sfWindow_SetCursorPosition(sfWindow* Window, unsigned int Left, unsigned int Top);
  void sfWindow_SetPosition(sfWindow* Window, int Left, int Top);
  void sfWindow_SetSize(sfWindow* Window, unsigned int Width, unsigned int Height);
  void sfWindow_Show(sfWindow* Window, sfBool State);
  void sfWindow_EnableKeyRepeat(sfWindow* Window, sfBool Enabled);
  void sfWindow_SetIcon(sfWindow* Window, unsigned int Width, unsigned int Height, sfUint8* Pixels);
  sfBool sfWindow_SetActive(sfWindow* Window, sfBool Active);
  void sfWindow_Display(sfWindow* Window);
  sfInput* sfWindow_GetInput(sfWindow* Window);
  void sfWindow_SetFramerateLimit(sfWindow* Window, unsigned int Limit);
  float sfWindow_GetFrameTime(sfWindow* Window);
  void sfWindow_SetJoystickThreshold(sfWindow* Window, float Threshold);
  
]]
