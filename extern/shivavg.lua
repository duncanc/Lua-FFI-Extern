
local ffi = require 'ffi'

require 'extern.openvg-api'

ffi.cdef [[

  enum {
    OVG_SH_blend_src_out = 1,
    OVG_SH_blend_dst_out = 1,
    OVG_SH_blend_src_atop = 1,
    OVG_SH_blend_dst_atop = 1
  };

  VGboolean vgCreateContextSH(VGint width, VGint height);
  void vgResizeSurfaceSH(VGint width, VGint height);
  void vgDestroyContextSH();
  
]]

return ffi.load 'libOpenVG'
