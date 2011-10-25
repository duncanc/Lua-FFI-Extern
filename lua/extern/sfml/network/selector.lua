
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.network.types'

ffi.cdef [[

  sfSelectorTCP* sfSelectorTCP_Create();
  sfSelectorUDP* sfSelectorUDP_Create();
  void sfSelectorTCP_Destroy(sfSelectorTCP* Selector);
  void sfSelectorUDP_Destroy(sfSelectorUDP* Selector);
  void sfSelectorTCP_Add(sfSelectorTCP* Selector, sfSocketTCP* Socket);
  void sfSelectorUDP_Add(sfSelectorUDP* Selector, sfSocketUDP* Socket);
  void sfSelectorTCP_Remove(sfSelectorTCP* Selector, sfSocketTCP* Socket);
  void sfSelectorUDP_Remove(sfSelectorUDP* Selector, sfSocketUDP* Socket);
  void sfSelectorTCP_Clear(sfSelectorTCP* Selector);
  void sfSelectorUDP_Clear(sfSelectorUDP* Selector);
  unsigned int sfSelectorTCP_Wait(sfSelectorTCP* Selector, float Timeout);
  unsigned int sfSelectorUDP_Wait(sfSelectorUDP* Selector, float Timeout);
  sfSocketTCP* sfSelectorTCP_GetSocketReady(sfSelectorTCP* Selector, unsigned int Index);
  sfSocketUDP* sfSelectorUDP_GetSocketReady(sfSelectorUDP* Selector, unsigned int Index);
  
]]
