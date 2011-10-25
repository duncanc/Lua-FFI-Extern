
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.color'
require 'extern.sfml.graphics.rect'
require 'extern.sfml.graphics.types'
require 'extern.sfml.window.event'
require 'extern.sfml.window.videomode'
require 'extern.sfml.window.windowhandle'
require 'extern.sfml.window.window'

ffi.cdef [[

  sfRenderWindow* sfRenderWindow_Create(sfVideoMode Mode, const char* Title, unsigned long Style, sfWindowSettings Params);
  sfRenderWindow* sfRenderWindow_CreateFromHandle(sfWindowHandle Handle, sfWindowSettings Params);
  void sfRenderWindow_Destroy(sfRenderWindow* RenderWindow);
  void sfRenderWindow_Close(sfRenderWindow* RenderWindow);
  sfBool sfRenderWindow_IsOpened(sfRenderWindow* RenderWindow);
  unsigned int sfRenderWindow_GetWidth(sfRenderWindow* RenderWindow);
  unsigned int sfRenderWindow_GetHeight(sfRenderWindow* RenderWindow);
  sfWindowSettings sfRenderWindow_GetSettings(sfRenderWindow* RenderWindow);
  sfBool sfRenderWindow_GetEvent(sfRenderWindow* RenderWindow, sfEvent* Event);
  void sfRenderWindow_UseVerticalSync(sfRenderWindow* RenderWindow, sfBool Enabled);
  void sfRenderWindow_ShowMouseCursor(sfRenderWindow* RenderWindow, sfBool Show);
  void sfRenderWindow_SetCursorPosition(sfRenderWindow* RenderWindow, unsigned int Left, unsigned int Top);
  void sfRenderWindow_SetPosition(sfRenderWindow* RenderWindow, int Left, int Top);
  void sfRenderWindow_SetSize(sfRenderWindow* RenderWindow, unsigned int Width, unsigned int Height);
  void sfRenderWindow_Show(sfRenderWindow* RenderWindow, sfBool State);
  void sfRenderWindow_EnableKeyRepeat(sfRenderWindow* RenderWindow, sfBool Enabled);
  void sfRenderWindow_SetIcon(sfRenderWindow* RenderWindow, unsigned int Width, unsigned int Height, sfUint8* Pixels);
  sfBool sfRenderWindow_SetActive(sfRenderWindow* RenderWindow, sfBool Active);
  void sfRenderWindow_Display(sfRenderWindow* RenderWindow);
  sfInput* sfRenderWindow_GetInput(sfRenderWindow* RenderWindow);
  void sfRenderWindow_SetFramerateLimit(sfRenderWindow* RenderWindow, unsigned int Limit);
  float sfRenderWindow_GetFrameTime(sfRenderWindow* RenderWindow);
  void sfRenderWindow_SetJoystickThreshold(sfRenderWindow* RenderWindow, float Threshold);
  void sfRenderWindow_DrawPostFX(sfRenderWindow* RenderWindow, sfPostFX* PostFX);
  void sfRenderWindow_DrawSprite(sfRenderWindow* RenderWindow, sfSprite* Sprite);
  void sfRenderWindow_DrawShape (sfRenderWindow* RenderWindow, sfShape*  Shape);
  void sfRenderWindow_DrawString(sfRenderWindow* RenderWindow, sfString* String);
  sfImage* sfRenderWindow_Capture(sfRenderWindow* RenderWindow);
  void sfRenderWindow_Clear(sfRenderWindow* RenderWindow, sfColor Color);
  void sfRenderWindow_SetView(sfRenderWindow* RenderWindow, sfView* View);
  const sfView* sfRenderWindow_GetView(sfRenderWindow* RenderWindow);
  sfView* sfRenderWindow_GetDefaultView(sfRenderWindow* RenderWindow);
  void sfRenderWindow_ConvertCoords(sfRenderWindow* RenderWindow, unsigned int WindowX, unsigned int WindowY, float* ViewX, float* ViewY, sfView* TargetView);
  void sfRenderWindow_PreserveOpenGLStates(sfRenderWindow* RenderWindow, sfBool Preserve);

]]
