
local ffi = require 'ffi'

require 'extern.sfml.window'
require 'extern.sfml.graphics.color'
require 'extern.sfml.graphics.image'
require 'extern.sfml.graphics.postfx'
require 'extern.sfml.graphics.rect'
require 'extern.sfml.graphics.renderwindow'
require 'extern.sfml.graphics.shape'
require 'extern.sfml.graphics.sprite'
require 'extern.sfml.graphics.string'
require 'extern.sfml.graphics.view'

return ffi.load 'csfml-graphics'
