
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.blendmode'
require 'extern.sfml.graphics.color'
require 'extern.sfml.graphics.rect'
require 'extern.sfml.graphics.types'

ffi.cdef [[

  typedef enum {
    sfStringRegular    = 0,
    sfStringBold       = 1,
    sfStringItalic     = 2,
    sfStringUnderlined = 4
  } sfStringStyle;

  sfString* sfString_Create();
  void sfString_Destroy(sfString* String);
  void sfString_SetX(sfString* String, float X);
  void sfString_SetY(sfString* String, float Y);
  void sfString_SetPosition(sfString* String, float Left, float Top);
  void sfString_SetScaleX(sfString* String, float Scale);
  void sfString_SetScaleY(sfString* String, float Scale);
  void sfString_SetScale(sfString* String, float ScaleX, float ScaleY);
  void sfString_SetRotation(sfString* String, float Rotation);
  void sfString_SetCenter(sfString* String, float X, float Y);
  void sfString_SetColor(sfString* String, sfColor Color);
  void sfString_SetBlendMode(sfString* String, sfBlendMode Mode);
  float sfString_GetX(sfString* String);
  float sfString_GetY(sfString* String);
  float sfString_GetScaleX(sfString* String);
  float sfString_GetScaleY(sfString* String);
  float sfString_GetRotation(sfString* String);
  float sfString_GetCenterX(sfString* String);
  float sfString_GetCenterY(sfString* String);
  sfColor sfString_GetColor(sfString* String);
  sfBlendMode sfString_GetBlendMode(sfString* String);
  void sfString_Move(sfString* String, float OffsetX, float OffsetY);
  void sfString_Scale(sfString* String, float FactorX, float FactorY);
  void sfString_Rotate(sfString* String, float Angle);
  void sfString_TransformToLocal(sfString* String, float PointX, float PointY, float* X, float* Y);
  void sfString_TransformToGlobal(sfString* String, float PointX, float PointY, float* X, float* Y);
  void sfString_SetText(sfString* String, const char* Text);
  void sfString_SetUnicodeText(sfString* String, const sfUint32* Text);
  void sfString_SetFont(sfString* String, sfFont* Font);
  void sfString_SetSize(sfString* String, float Size);
  void sfString_SetStyle(sfString* String, unsigned long Style);
  const sfUint32* sfString_GetUnicodeText(sfString* String);
  const char* sfString_GetText(sfString* String);
  sfFont* sfString_GetFont(sfString* String);
  float sfString_GetSize(sfString* String);
  unsigned long sfString_GetStyle(sfString* String);
  void sfString_GetCharacterPos(sfString* String, size_t Index, float* X, float* Y);
  sfFloatRect sfString_GetRect(sfString* String);

]]
