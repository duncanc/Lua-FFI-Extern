
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef struct {
    char Address[16];
  } sfIPAddress;

  sfIPAddress sfIPAddress_FromString(const char* String);
  sfIPAddress sfIPAddress_FromBytes(sfUint8 Byte0, sfUint8 Byte1, sfUint8 Byte2, sfUint8 Byte3);
  sfIPAddress sfIPAddress_FromInteger(sfUint32 Address);
  sfBool sfIPAddress_IsValid(sfIPAddress Address);
  void sfIPAddress_ToString(sfIPAddress Address, char* String);
  sfUint32 sfIPAddress_ToInteger(sfIPAddress Address);
  sfIPAddress sfIPAddress_GetLocalAddress();
  sfIPAddress sfIPAddress_GetPublicAddress(float Timeout);
  sfIPAddress sfIPAddress_LocalHost();

]]
