
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.network.types'

ffi.cdef [[

  sfPacket* sfPacket_Create();
  void sfPacket_Destroy(sfPacket* Packet);
  void sfPacket_Append(sfPacket* Packet, void* Data, size_t SizeInBytes);
  void sfPacket_Clear(sfPacket* Packet);
  const char* sfPacket_GetData(sfPacket* Packet);
  size_t sfPacket_GetDataSize(sfPacket* Packet);
  sfBool sfPacket_EndOfPacket(sfPacket* Packet);
  sfBool sfPacket_CanRead(sfPacket* Packet);
  sfBool   sfPacket_ReadBool(sfPacket* Packet);
  sfInt8   sfPacket_ReadInt8(sfPacket* Packet);
  sfUint8  sfPacket_ReadUint8(sfPacket* Packet);
  sfInt16  sfPacket_ReadInt16(sfPacket* Packet);
  sfUint16 sfPacket_ReadUint16(sfPacket* Packet);
  sfInt32  sfPacket_ReadInt32(sfPacket* Packet);
  sfUint32 sfPacket_ReadUint32(sfPacket* Packet);
  float    sfPacket_ReadFloat(sfPacket* Packet);
  double   sfPacket_ReadDouble(sfPacket* Packet);
  void     sfPacket_ReadString(sfPacket* Packet, char* String);
  void     sfPacket_ReadWideString(sfPacket* Packet, wchar_t* String);
  void sfPacket_WriteBool(sfPacket* Packet, sfBool);
  void sfPacket_WriteInt8(sfPacket* Packet, sfInt8);
  void sfPacket_WriteUint8(sfPacket* Packet, sfUint8);
  void sfPacket_WriteInt16(sfPacket* Packet, sfInt16);
  void sfPacket_WriteUint16(sfPacket* Packet, sfUint16);
  void sfPacket_WriteInt32(sfPacket* Packet, sfInt32);
  void sfPacket_WriteUint32(sfPacket* Packet, sfUint32);
  void sfPacket_WriteFloat(sfPacket* Packet, float);
  void sfPacket_WriteDouble(sfPacket* Packet, double);
  void sfPacket_WriteString(sfPacket* Packet, const char* String);
  void sfPacket_WriteWideString(sfPacket* Packet, const wchar_t* String);

]]
