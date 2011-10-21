
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.graphics.color'
require 'extern.sfml.graphics.rect'
require 'extern.sfml.graphics.types'

ffi.cdef [[

  sfImage* sfImage_Create();
  sfImage* sfImage_CreateFromColor(unsigned int Width, unsigned int Height, sfColor Color);
  sfImage* sfImage_CreateFromPixels(unsigned int Width, unsigned int Height, const sfUint8* Data);
  sfImage* sfImage_CreateFromFile(const char* Filename);
  sfImage* sfImage_CreateFromMemory(const char* Data, size_t SizeInBytes);
  void sfImage_Destroy(sfImage* Image);
  sfBool sfImage_SaveToFile(sfImage* Image, const char* Filename);
  void sfImage_CreateMaskFromColor(sfImage* Image, sfColor ColorKey, sfUint8 Alpha);
  void sfImage_Copy(sfImage* Image, sfImage* Source, unsigned int DestX, unsigned int DestY, sfIntRect SourceRect);
  sfBool sfImage_CopyScreen(sfImage* Image, sfRenderWindow* Window, sfIntRect SourceRect);
  void sfImage_SetPixel(sfImage* Image, unsigned int X, unsigned int Y, sfColor Color);
  sfColor sfImage_GetPixel(sfImage* Image, unsigned int X, unsigned int Y);
  const sfUint8* sfImage_GetPixelsPtr(sfImage* Image);
  void sfImage_Bind(sfImage* Image);
  void sfImage_SetSmooth(sfImage* Image, sfBool Smooth);
  unsigned int sfImage_GetWidth(sfImage* Image);
  unsigned int sfImage_GetHeight(sfImage* Image);
  sfBool sfImage_IsSmooth(sfImage* Image);
  
]]