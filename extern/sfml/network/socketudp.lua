
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.network.ipaddress'
require 'extern.sfml.network.socketstatus'
require 'extern.sfml.network.types'

ffi.cdef [[

  sfSocketUDP* sfSocketUDP_Create();
  void sfSocketUDP_Destroy(sfSocketUDP* Socket);
  void sfSocketUDP_SetBlocking(sfSocketUDP* Socket, sfBool Blocking);
  sfBool sfSocketUDP_Bind(sfSocketUDP* Socket, unsigned short Port);
  sfBool sfSocketUDP_Unbind(sfSocketUDP* Socket);
  sfSocketStatus sfSocketUDP_Send(sfSocketUDP* Socket, const char* Data, size_t Size, sfIPAddress Address, unsigned short Port);
  sfSocketStatus sfSocketUDP_Receive(sfSocketUDP* Socket, char* Data, size_t MaxSize, size_t* SizeReceived, sfIPAddress* Address, unsigned short* Port);
  sfSocketStatus sfSocketUDP_SendPacket(sfSocketUDP* Socket, sfPacket* Packet, sfIPAddress Address, unsigned short Port);
  sfSocketStatus sfSocketUDP_ReceivePacket(sfSocketUDP* Socket, sfPacket* Packet, sfIPAddress* Address, unsigned short* Port);
  sfBool sfSocketUDP_IsValid(sfSocketUDP* Socket);

]]
