
local ffi = require 'ffi'

ffi.cdef [[
	
	void* wglGetProcAddress(const char* procName);
	
]]

return ffi.load 'OPENGL32'
