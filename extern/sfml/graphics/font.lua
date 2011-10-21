
local ffi = require 'ffi'

require 'extern.sfml.graphics.glyph'
require 'extern.sfml.graphics.types'

ffi.cdef [[

  sfFont* sfFont_Create();
  sfFont* sfFont_CreateFromFile(const char* Filename, unsigned int CharSize, const sfUint32* Charset);
  sfFont* sfFont_CreateFromMemory(const char* Data, size_t SizeInBytes, unsigned int CharSize, const sfUint32* Charset);
  void sfFont_Destroy(sfFont* Font);
  unsigned int sfFont_GetCharacterSize(sfFont* Font);
  sfFont* sfFont_GetDefaultFont();
  
]]