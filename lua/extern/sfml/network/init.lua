
local ffi = require 'ffi'

require 'extern.sfml.system'
require 'extern.sfml.network.ipaddress'
require 'extern.sfml.network.packet'
require 'extern.sfml.network.selector'
require 'extern.sfml.network.sockettcp'
require 'extern.sfml.network.socketudp'

return ffi.load 'csfml-network'
