
local bit = require 'bit'
local ffi = require 'ffi'
local sdl = require 'extern.sdl'
local glfactory = require 'extern.opengl.factory'

sdl.SDL_Init(sdl.SDL_INIT_VIDEO)
sdl.SDL_GL_SetAttribute(sdl.SDL_GL_DOUBLEBUFFER, true)
local screen = sdl.SDL_SetVideoMode(640, 480, 0, bit.bor(sdl.SDL_OPENGL, sdl.SDL_RESIZABLE))

local gl = glfactory.create {
  getProcAddress = sdl.SDL_GL_GetProcAddress;
}

local function setsize(width, height)
  gl.glViewport(0, 0, width, height)
  if (height == 0) then
    height = 1
  end
  gl.glViewport(0,0,width,height)
  
  local aspect = width/height
  local fovy = 45
  local near, far = 0.1, 100
  local ymax = near * math.tan(45 * math.pi / 360)
  local ymin = -ymax
  local xmin = ymin * aspect
  local xmax = ymax * aspect
  
  gl.glMatrixMode(gl.GL_PROJECTION)
  gl.glLoadIdentity()
  gl.glFrustum(xmin, xmax, ymin, ymax, near, far)

	gl.glMatrixMode(gl.GL_MODELVIEW)
	gl.glLoadIdentity()
end

setsize(screen.w, screen.h)

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
    elseif (event.type == sdl.SDL_VIDEORESIZE) then
      screen = sdl.SDL_SetVideoMode(event.resize.w, event.resize.h, 0, bit.bor(sdl.SDL_OPENGL, sdl.SDL_RESIZABLE))
      setsize(event.resize.w, event.resize.h)
    end
	end
  
  gl.glClear(bit.bor(gl.GL_COLOR_BUFFER_BIT, gl.GL_DEPTH_BUFFER_BIT))
  gl.glLoadIdentity()
  
  gl.glTranslatef(-1.5, 0, -6)
  gl.glBegin(gl.GL_TRIANGLES)
  do
    -- top: red
    gl.glColor3f(1, 0, 0)
    gl.glVertex3f(0, 1, 0)
    -- bottom left: green
    gl.glColor3f(0, 1, 0)
    gl.glVertex3f(-1, -1, 0)
    -- bottom right: blue
    gl.glColor3f(0, 0, 1)
    gl.glVertex3f(1, -1, 0)
  end
  gl.glEnd()
  
  gl.glTranslatef(3, 0, 0)
  gl.glBegin(gl.GL_QUADS)
  do
    gl.glVertex3f(-1, 1, 0)
    gl.glVertex3f( 1, 1, 0)
    gl.glVertex3f( 1,-1, 0)
    gl.glVertex3f(-1,-1, 0)
  end
  gl.glEnd()
  
  sdl.SDL_GL_SwapBuffers()
  
	sdl.SDL_Delay(sdl.SDL_TIMESLICE)
end
