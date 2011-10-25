
local ffi = require 'ffi'
local com = require 'extern.mswindows.com'
local ddraw = require 'extern.directx.ddraw'
require 'extern.directx.d3d'
local _d3d8 = require 'extern.directx.d3d8'
local _d3d9 = require 'extern.directx.d3d9'

print('IDirectDraw 1')
local dd
do
	local temp = ffi.new 'IDirectDraw*[1]'
	if (ddraw.DirectDrawCreate(nil, temp, nil) == 0) then
		dd = com.gc(temp[0])
	end
end
print(dd)

print('IDirectDraw 2')
local dd2 = com.cast('IDirectDraw2', dd)
print(dd2)

print('IDirectDraw 4')
local dd4 = com.cast('IDirectDraw4', dd)
print(dd4)

dd, dd2, dd4 = com.release(dd, dd2, dd4)

print('IDirectDraw 7')
local dd7
do
	local temp = ffi.new 'IDirectDraw7*[1]'
	if (ddraw.DirectDrawCreateEx(nil, ffi.cast('void**', temp), com.iidof 'IDirectDraw7', nil) == 0) then
		dd7 = com.gc(temp[0])
	end
end
print(dd7)

print('IDirect3D 7')
local d3d7 = com.cast('IDirect3D7', dd7)
print(d3d7)

dd7, d3d7 = com.release(dd7, d3d7)

print('IDirect3D 8')
local d3d8 = _d3d8.Direct3DCreate8(_d3d8.D3D8SDK_VERSION)
print(d3d8)

d3d8 = com.release(d3d8)

print('IDirect3D 9')
local d3d9 = _d3d9.Direct3DCreate9(_d3d9.D3D9SDK_VERSION)
print(d3d9)

d3d9 = com.release(d3d9)
