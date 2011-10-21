
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.window.event'
require 'extern.sfml.window.types'

ffi.cdef [[
  
  sfBool sfInput_IsKeyDown(sfInput* Input, sfKeyCode KeyCode);
  sfBool sfInput_IsMouseButtonDown(sfInput* Input, sfMouseButton Button);
  sfBool sfInput_IsJoystickButtonDown(sfInput* Input, unsigned int JoyId, unsigned int Button);
  int sfInput_GetMouseX(sfInput* Input);
  int sfInput_GetMouseY(sfInput* Input);
  float sfInput_GetJoystickAxis(sfInput* Input, unsigned int JoyId, sfJoyAxis Axis);
  
]]
