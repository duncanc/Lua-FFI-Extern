
local ffi = require 'ffi'

ffi.cdef [[

  enum {
    sfFalse = 0,
    sfTrue = 1
  };
  typedef int sfBool;
  typedef int8_t sfInt8;
  typedef uint8_t sfUint8;
  typedef int16_t sfInt16;
  typedef uint16_t sfUint16;
  typedef int32_t sfInt32;
  typedef uint32_t sfUint32;

]]
