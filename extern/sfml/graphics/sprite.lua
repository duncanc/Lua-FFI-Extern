
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.blendmode'
require 'extern.sfml.graphics.color'
require 'extern.sfml.graphics.rect'
require 'extern.sfml.graphics.types'

ffi.cdef [[

  sfSprite* sfSprite_Create();
  void sfSprite_Destroy(sfSprite* Sprite);
  void sfSprite_SetX(sfSprite* Sprite, float X);
  void sfSprite_SetY(sfSprite* Sprite, float Y);
  void sfSprite_SetPosition(sfSprite* Sprite, float X, float Y);
  void sfSprite_SetScaleX(sfSprite* Sprite, float Scale);
  void sfSprite_SetScaleY(sfSprite* Sprite, float Scale);
  void sfSprite_SetScale(sfSprite* Sprite, float ScaleX, float ScaleY);
  void sfSprite_SetRotation(sfSprite* Sprite, float Rotation);
  void sfSprite_SetCenter(sfSprite* Sprite, float X, float Y);
  void sfSprite_SetColor(sfSprite* Sprite, sfColor Color);
  void sfSprite_SetBlendMode(sfSprite* Sprite, sfBlendMode Mode);
  float sfSprite_GetX(sfSprite* Sprite);
  float sfSprite_GetY(sfSprite* Sprite);
  float sfSprite_GetScaleX(sfSprite* Sprite);
  float sfSprite_GetScaleY(sfSprite* Sprite);
  float sfSprite_GetRotation(sfSprite* Sprite);
  float sfSprite_GetCenterX(sfSprite* Sprite);
  float sfSprite_GetCenterY(sfSprite* Sprite);
  sfColor sfSprite_GetColor(sfSprite* Sprite);
  sfBlendMode sfSprite_GetBlendMode(sfSprite* Sprite);
  void sfSprite_Move(sfSprite* Sprite, float OffsetX, float OffsetY);
  void sfSprite_Scale(sfSprite* Sprite, float FactorX, float FactorY);
  void sfSprite_Rotate(sfSprite* Sprite, float Angle);
  void sfSprite_TransformToLocal(sfSprite* Sprite, float PointX, float PointY, float* X, float* Y);
  void sfSprite_TransformToGlobal(sfSprite* Sprite, float PointX, float PointY, float* X, float* Y);
  void sfSprite_SetImage(sfSprite* Sprite, sfImage* Image);
  void sfSprite_SetSubRect(sfSprite* Sprite, sfIntRect SubRect);
  void sfSprite_Resize(sfSprite* Sprite, float Width, float Height);
  void sfSprite_FlipX(sfSprite* Sprite, sfBool Flipped);
  void sfSprite_FlipY(sfSprite* Sprite, sfBool Flipped);
  sfImage* sfSprite_GetImage(sfSprite* Sprite);
  sfIntRect sfSprite_GetSubRect(sfSprite* Sprite);
  float sfSprite_GetWidth(sfSprite* Sprite);
  float sfSprite_GetHeight(sfSprite* Sprite);
  sfColor sfSprite_GetPixel(sfSprite* Sprite, unsigned int X, unsigned int Y);

]]
