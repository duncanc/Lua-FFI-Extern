
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef struct {
    float Left, Top, Right, Bottom;
  } sfFloatRect;

  typedef struct {
    int Left, Top, Right, Bottom;
  } sfIntRect;

  void sfFloatRect_Offset(sfFloatRect* Rect, float OffsetX, float OffsetY);
  void sfIntRect_Offset(sfIntRect* Rect, int OffsetX, int OffsetY);
  sfBool sfFloatRect_Contains(sfFloatRect* Rect, float X, float Y);
  sfBool sfIntRect_Contains(sfIntRect* Rect, int X, int Y);
  sfBool sfFloatRect_Intersects(sfFloatRect* Rect1, sfFloatRect* Rect2, sfFloatRect* OverlappingRect);
  sfBool sfIntRect_Intersects(sfIntRect* Rect1, sfIntRect* Rect2, sfIntRect* OverlappingRect);

]]
