
package.path = package.path .. ';?/init.lua'

local bit = require 'bit'
local ffi = require 'ffi'

local sfml_gfx = require 'extern.sfml.graphics'

local window = sfml_gfx.sfRenderWindow_Create(
  {Width=640, Height=480, BitsPerPixel=32},
  'SFML Graphics',
  bit.bor(sfml_gfx.sfTitlebar, sfml_gfx.sfResize, sfml_gfx.sfClose),
  {DepthBits=0, StencilBits=0, AntialiasingLevel=0})

local e = ffi.new 'sfEvent'

while (sfml_gfx.sfRenderWindow_IsOpened(window) == sfml_gfx.sfTrue) do
  while (sfml_gfx.sfRenderWindow_GetEvent(window, e) == sfml_gfx.sfTrue) do
    if (e.Type == sfml_gfx.sfEvtClosed) then
      sfml_gfx.sfRenderWindow_Close(window)
    end
  end
  sfml_gfx.sfRenderWindow_Clear(window, {r=255, g=0, b=0, a=255})
  sfml_gfx.sfRenderWindow_Display(window)
end
