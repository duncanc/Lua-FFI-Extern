
local ffi = require 'ffi'

ffi.cdef [[

  typedef struct sfFtpDirectoryResponse sfFtpDirectoryResponse;
  typedef struct sfFtpListingResponse sfFtpListingResponse;
  typedef struct sfFtpResponse sfFtpResponse;
  typedef struct sfFtp sfFtp;
  typedef struct sfHttpRequest sfHttpRequest;
  typedef struct sfHttpResponse sfHttpResponse;
  typedef struct sfHttp sfHttp;
  typedef struct sfPacket sfPacket;
  typedef struct sfSelectorTCP sfSelectorTCP;
  typedef struct sfSelectorUDP sfSelectorUDP;
  typedef struct sfSocketTCP sfSocketTCP;
  typedef struct sfSocketUDP sfSocketUDP;

]]
