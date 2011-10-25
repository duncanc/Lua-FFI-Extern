
local ffi = require 'ffi'

ffi.cdef [[

  typedef enum {
    sfSocketDone,
    sfSocketNotReady,
    sfSocketDisconnected,
    sfSocketError
  } sfSocketStatus;

]]
