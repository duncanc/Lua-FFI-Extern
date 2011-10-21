
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.rect'
require 'extern.sfml.graphics.types'

ffi.cdef [[

  sfView* sfView_Create();
  sfView* sfView_CreateFromRect(sfFloatRect Rect);
  void sfView_Destroy(sfView* View);
  void sfView_SetCenter(sfView* View, float X, float Y);
  void sfView_SetHalfSize(sfView* View, float HalfWidth, float HalfHeight);
  void sfView_SetFromRect(sfView* View, sfFloatRect ViewRect);
  float sfView_GetCenterX(sfView* View);
  float sfView_GetCenterY(sfView* View);
  float sfView_GetHalfSizeX(sfView* View);
  float sfView_GetHalfSizeY(sfView* View);
  sfFloatRect sfView_GetRect(sfView* View);
  void sfView_Move(sfView* View, float OffsetX, float OffsetY);
  void sfView_Zoom(sfView* View, float Factor);

]]
