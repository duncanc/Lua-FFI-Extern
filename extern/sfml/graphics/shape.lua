
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.blendmode'
require 'extern.sfml.graphics.color'
require 'extern.sfml.graphics.types'

ffi.cdef [[

  sfShape* sfShape_Create();
  sfShape* sfShape_CreateLine(float P1X, float P1Y, float P2X, float P2Y, float Thickness, sfColor Col, float Outline, sfColor OutlineCol);
  sfShape* sfShape_CreateRectangle(float P1X, float P1Y, float P2X, float P2Y, sfColor Col, float Outline, sfColor OutlineCol);
  sfShape* sfShape_CreateCircle(float X, float Y, float Radius, sfColor Col, float Outline, sfColor OutlineCol);
  void sfShape_Destroy(sfShape* Shape);
  void sfShape_SetX(sfShape* Shape, float X);
  void sfShape_SetY(sfShape* Shape, float Y);
  void sfShape_SetPosition(sfShape* Shape, float X, float Y);
  void sfShape_SetScaleX(sfShape* Shape, float Scale);
  void sfShape_SetScaleY(sfShape* Shape, float Scale);
  void sfShape_SetScale(sfShape* Shape, float ScaleX, float ScaleY);
  void sfShape_SetRotation(sfShape* Shape, float Rotation);
  void sfShape_SetCenter(sfShape* Shape, float X, float Y);
  void sfShape_SetColor(sfShape* Shape, sfColor Color);
  void sfShape_SetBlendMode(sfShape* Shape, sfBlendMode Mode);
  float sfShape_GetX(sfShape* Shape);
  float sfShape_GetY(sfShape* Shape);
  float sfShape_GetScaleX(sfShape* Shape);
  float sfShape_GetScaleY(sfShape* Shape);
  float sfShape_GetRotation(sfShape* Shape);
  float sfShape_GetCenterX(sfShape* Shape);
  float sfShape_GetCenterY(sfShape* Shape);
  sfColor sfShape_GetColor(sfShape* Shape);
  sfBlendMode sfShape_GetBlendMode(sfShape* Shape);
  void sfShape_Move(sfShape* Shape, float OffsetX, float OffsetY);
  void sfShape_Scale(sfShape* Shape, float FactorX, float FactorY);
  void sfShape_Rotate(sfShape* Shape, float Angle);
  void sfShape_TransformToLocal(sfShape* Shape, float PointX, float PointY, float* X, float* Y);
  void sfShape_TransformToGlobal(sfShape* Shape, float PointX, float PointY, float* X, float* Y);
  void sfShape_AddPoint(sfShape* Shape, float X, float Y, sfColor Col, sfColor OutlineCol);
  void sfShape_EnableFill(sfShape* Shape, sfBool Enable);
  void sfShape_EnableOutline(sfShape* Shape, sfBool Enable);
  void sfShape_SetOutlineWidth(sfShape* Shape, float Width);
  float sfShape_GetOutlineWidth(sfShape* Shape);
  unsigned int sfShape_GetNbPoints(sfShape* Shape);
  void sfShape_GetPointPosition(sfShape* Shape, unsigned int Index, float* X, float* Y);
  sfColor sfShape_GetPointColor(sfShape* Shape, unsigned int Index);
  sfColor sfShape_GetPointOutlineColor(sfShape* Shape, unsigned int Index);
  void sfShape_SetPointPosition(sfShape* Shape, unsigned int Index, float X, float Y);
  void sfShape_SetPointColor(sfShape* Shape, unsigned int Index, sfColor Color);
  void sfShape_SetPointOutlineColor(sfShape* Shape, unsigned int Index, sfColor Color);

]]
