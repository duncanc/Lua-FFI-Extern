
local bit = require 'bit'
local ffi = require 'ffi'
local sdl = require 'extern.sdl'
local glfactory = require 'extern.opengl.factory'

local vg, vg_open, vg_resize, vg_close
do
  print('OpenVG Implementation')
  print('=====================')
  print('1: ShivaVG - http://shivavg.sourceforge.net/')
  print('2: AmanithVG - http://amanith.org/')
  while not vg do
    io.write('>>')
    local n = tonumber(io.read('*l'))
    if (n == 1) then
      vg = require 'extern.shivavg'
      vg_open = vg.vgCreateContextSH
      vg_resize = vg.vgResizeSurfaceSH
      vg_close = vg.vgDestroyContextSH
    elseif (n == 2) then
      vg = require 'extern.amanithvg'
      vg_open = function(w, h)
        return vg.vgInitContextAM(w, h, false)
      end
      vg_resize = vg.vgResizeSurfaceAM
      vg_close = vg.vgDestroyContextAM
    end
  end
end

sdl.SDL_Init(sdl.SDL_INIT_VIDEO)
sdl.SDL_GL_SetAttribute(sdl.SDL_GL_DOUBLEBUFFER, true)
sdl.SDL_GL_SetAttribute(sdl.SDL_GL_STENCIL_SIZE, 1)
local screen = sdl.SDL_SetVideoMode(640, 480, 0, bit.bor(sdl.SDL_OPENGL, sdl.SDL_RESIZABLE))

local gl = glfactory.create {
  getProcAddress = sdl.SDL_GL_GetProcAddress;
}

vg_open(screen.w, screen.h)

local function checkvg()
  local c = vg.vgGetError()
  if c ~= vg.VG_NO_ERROR then
    error('ERROR: ' .. c, 2)
  end
end

checkvg()

local function setsize(width, height)
  vg_resize(width, height)
end

local function setclearcolor(r,g,b,a)
  vg.vgSetfv(vg.VG_CLEAR_COLOR, 4, ffi.new('VGfloat[4]', r or 0, g or 0, b or 0, a or 1))
end

local function setfillcolor(fill, r,g,b,a)
  vg.vgSetParameterfv(fill, vg.VG_PAINT_COLOR, 4, ffi.new('VGfloat[4]', r or 0, g or 0, b or 0, a or 1))
end

local function createpath()
  return vg.vgCreatePath(vg.VG_PATH_FORMAT_STANDARD, vg.VG_PATH_DATATYPE_F,
                      1,0,0,0, vg.VG_PATH_CAPABILITY_ALL)
end

setclearcolor(1, 0, 0)

-- paths
local function createApple(p)
  local segs = {
    vg.VG_MOVE_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS,
    vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS,
    vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CLOSE_PATH,
    vg.VG_MOVE_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CLOSE_PATH}
  segs = ffi.new('VGubyte[?]', #segs, segs)
 
  local data = {
    1.53125,-44.681982, -3.994719,-44.681982, -8.0085183,-50.562501,
    -26.5625,-50.562501, -42.918439,-50.562501, -56.46875,-34.239393,
    -56.46875,-12.187501, -56.46875,26.520416, -34.65822,61.731799,
    -16.84375,61.812499, -7.1741233,61.812499, -2.9337937,55.656199,
    4.15625,55.656199, 11.746294,55.656199, 17.981627,62.281199,
    25.4375,62.281199, 33.88615,62.281199, 50.53251,44.282999,
    58.75,15.718799, 47.751307,9.086518, 40.999985,-0.228074,
    41,-13.046574, 41,-27.849147, 46.64686,-34.763001,
    52.4375,-39.937501, 46.111827,-47.219094, 39.0413,-50.503784,
    29.09375,-50.446384, 11.146487,-50.342824, 8.6341912,-44.681982,
    1.53125,-44.681982,
    
    0.23972344,-52.075169, -2.8344902,-69.754133, 5.9303785,-81.915323,
    24.152707,-86.881406, 23.71828,-70.367255, 15.114064,-58.365865,
    0.23972344,-52.075169}
  data = ffi.new('float[?]', #data, data)
  
  local temp = createpath()
  vg.vgAppendPathData(temp, ffi.sizeof(segs), segs, data)

  vg.vgSeti(vg.VG_MATRIX_MODE, vg.VG_MATRIX_PATH_USER_TO_SURFACE)
  vg.vgLoadIdentity()
  vg.vgScale(1, -1)
  vg.vgTransformPath(p, temp)
  vg.vgDestroyPath(temp)
end

local function createPear(p)

  local segs = {
    vg.VG_MOVE_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS,
    vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS,
    vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CLOSE_PATH,
    vg.VG_MOVE_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CUBIC_TO_ABS, vg.VG_CLOSE_PATH }
  segs = ffi.new('VGubyte[?]', #segs, segs)
  
  local data = {
    0.0625,-90.625001, -29.44062,-89.191161, -23.07159,-32.309301,
    -30.5625,-14.062501, -38.29681,4.7771994, -56.8077,20.767199,
    -56.46875,42.812499, -56.1298,64.502999, -40.15822,79.731799,
    -22.34375,79.812499, -4.17446,79.893199, -1.93369,71.113999,
    4.15625,71.156199, 10.49619,71.198499, 13.70293,80.336799,
    30.4375,80.281199, 42.49257,80.241199, 53.53251,70.782999,
    58.75,58.218799, 47.0442,54.768499, 38.5,43.943499,
    38.5,31.124999, 38.50001,22.754099, 42.14686,15.236999,
    47.9375,10.062499, 42.2834,1.5737994, 36.5413,-6.6199006,
    34.09375,-14.062501, 28.48694,-31.111801, 32.99356,-90.265511,
    1.5,-90.625001,
    
    5.1056438,-97.8762, -12.766585,-99.48239, -22.244878,-111.09615,
    -22.325466,-129.98288, -6.486451,-125.28908, 2.8790668,-113.87186,
    5.1056438,-97.8762 };
  data = ffi.new('float[?]', #data, data)
  
  local temp = createpath()
  vg.vgAppendPathData(temp, ffi.sizeof(segs), segs, data);

  vg.vgSeti(vg.VG_MATRIX_MODE, vg.VG_MATRIX_PATH_USER_TO_SURFACE);
  vg.vgLoadIdentity();
  vg.vgScale(1,-1);
  vg.vgTransformPath(p, temp);
  vg.vgDestroyPath(temp);
end

local amount = 0

local iApple, iPear, iMorph = createpath(), createpath(), createpath()

local function createMorph()
  vg.vgClearPath(iMorph, vg.VG_PATH_CAPABILITY_ALL)
  vg.vgInterpolatePath(iMorph, iApple, iPear, amount)
end

local angle = 3 * math.pi / 2

local function display(interval)
  angle = angle + (interval * 0.4 * math.pi)
  if angle > (2 * math.pi) then
    angle = angle - (2 * math.pi)
  end
  amount = (math.sin(angle) + 1) * 0.5
  createMorph()
  
  setclearcolor(0, 0, 0, 1)
  vg.vgClear(0,0,screen.w,screen.h)
  
  vg.vgLoadIdentity()
  vg.vgTranslate(screen.w/2, screen.h/2)
  vg.vgDrawPath(iMorph, vg.VG_FILL_PATH)
end

createApple(iApple)
createPear(iPear)

checkvg()
local fill = vg.vgCreatePaint()

checkvg()
setfillcolor(fill, 1, 1, 1, 1)

checkvg()
vg.vgSetPaint(fill, vg.VG_FILL_PATH)

checkvg()

local event = ffi.new 'SDL_Event'
local finished = false
local millis = sdl.SDL_GetTicks()
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
  
  local nowMillis = sdl.SDL_GetTicks()
  
  vg.vgClear(0, 0, screen.w, screen.h)
  display((nowMillis - millis) / 1000)
  
  millis = nowMillis
  
  sdl.SDL_GL_SwapBuffers()
  
	sdl.SDL_Delay(sdl.SDL_TIMESLICE)
end

vg_close()
