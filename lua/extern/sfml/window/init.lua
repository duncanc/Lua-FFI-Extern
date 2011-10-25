
local ffi = require 'ffi'

require 'extern.sfml.system'
require 'extern.sfml.window.context'
require 'extern.sfml.window.event'
require 'extern.sfml.window.input'
require 'extern.sfml.window.videomode'
require 'extern.sfml.window.window'

return ffi.load 'csfml-window'
