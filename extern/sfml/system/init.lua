
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.system.clock'
require 'extern.sfml.system.mutex'
require 'extern.sfml.system.randomizer'
require 'extern.sfml.system.sleep'
require 'extern.sfml.system.sleep'
require 'extern.sfml.system.thread'

return ffi.load 'csfml-system'
