
local ffi = require 'ffi'
local sdl = require 'extern.sdl'

local function loadbmp(filename)
  return sdl.SDL_LoadBMP_RW(sdl.SDL_RWFromFile(filename, 'r'), true)
end

sdl.SDL_Init(sdl.SDL_INIT_VIDEO)

local surface = loadbmp("tests/image.bmp")

local screen = sdl.SDL_SetVideoMode(surface.w, surface.h, 0, 0)

local converted = sdl.SDL_DisplayFormat(surface)
sdl.SDL_FreeSurface(surface)
surface = converted

local event = ffi.new 'SDL_Event'
local finished = false
while not finished do
	while sdl.SDL_PollEvent(event) ~= 0 do
		if (event.type == sdl.SDL_QUIT) then
			finished = true
		elseif (event.type == sdl.SDL_KEYDOWN) then
      if (event.key.keysym.sym == sdl.SDLK_ESCAPE) then
        finished = true
      end
    end
	end
  
	sdl.SDL_UpperBlit(surface, nil, screen, nil)
  sdl.SDL_Flip(screen)
  
	sdl.SDL_Delay(sdl.SDL_TIMESLICE)
end
