
local ffi = require 'ffi'

if (ffi.os == 'Linux') or (ffi.os == 'BSD') then

  ffi.cdef [[
    typedef unsigned long sfWindowHandle;
  ]]

else

  ffi.cdef [[
    typedef void* sfWindowHandle;
  ]]

end
