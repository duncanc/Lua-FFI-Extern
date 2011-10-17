
local ffi = require 'ffi'

require 'extern.openvg-api'

ffi.cdef [[

  VGboolean vgInitContextAM(VGint width, VGint height, VGboolean linearColorSpace);
  VGboolean vgResizeSurfaceAM(VGint width, VGint height);
  void vgDestroyContextAM();
  
]]

return ffi.load 'libAmanithVG'
