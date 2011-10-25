
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.network.ipaddress'
require 'extern.sfml.network.socketstatus'
require 'extern.sfml.network.types'

ffi.cdef [[

  sfSocketTCP* sfSocketTCP_Create();
  void sfSocketTCP_Destroy(sfSocketTCP* Socket);
  void sfSocketTCP_SetBlocking(sfSocketTCP* Socket, sfBool Blocking);
  sfSocketStatus sfSocketTCP_Connect(sfSocketTCP* Socket, unsigned short Port, sfIPAddress HostAddress, float Timeout);
  sfBool sfSocketTCP_Listen(sfSocketTCP* Socket, unsigned short Port);
  sfSocketStatus sfSocketTCP_Accept(sfSocketTCP* Socket, sfSocketTCP** Connected, sfIPAddress* Address);
  sfSocketStatus sfSocketTCP_Send(sfSocketTCP* Socket, const char* Data, size_t Size);
  sfSocketStatus sfSocketTCP_Receive(sfSocketTCP* Socket, char* Data, size_t MaxSize, size_t* SizeReceived);
  sfSocketStatus sfSocketTCP_SendPacket(sfSocketTCP* Socket, sfPacket* Packet);
  sfSocketStatus sfSocketTCP_ReceivePacket(sfSocketTCP* Socket, sfPacket* Packet);
  sfBool sfSocketTCP_IsValid(sfSocketTCP* Socket);

]]
