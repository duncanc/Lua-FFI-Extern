
local ffi = require 'ffi'
local z = require 'extern.zlib'

local z_errors = {
	[z.Z_ERRNO] = 'i/o error';
	[z.Z_STREAM_ERROR] = 'invalid compression level';
	[z.Z_DATA_ERROR] = 'invalid of incomplete deflate data';
	[z.Z_MEM_ERROR] = 'out of memory';
	[z.Z_VERSION_ERROR] = 'zlib version mismatch';
};

local function compress(data, level)
	local outbuflen = z.compressBound(#data)
	local outbuf = ffi.new('unsigned char[?]', outbuflen)
	outbuflen = ffi.new('unsigned long[1]', outbuflen)
 	local result = z.compress2(outbuf, outbuflen, data, #data, level or z.Z_DEFAULT_COMPRESSION)
	if (result == z.Z_OK) then
		return ffi.string(outbuf, outbuflen[0])
	else
		return nil, z_errors[result] or ('zlib error #' .. result)
	end
end

local function uncompress(compressed, length)
	local outbuf = ffi.new('unsigned char[?]', length)
	length = ffi.new('unsigned long[1]', length)
	local result = z.uncompress(outbuf, length, compressed, #compressed)
	if (result == z.Z_OK) then
		return ffi.string(outbuf, length[0])
	else
		return nil, z_errors[result] or ('zlib error #' .. result)
	end
end

local f = assert(io.open('tests/zlib.lua', 'rb'))
local data = f:read('*a')
f:close()

print('data length: ', #data)

local compressed_default = assert(compress(data))
print('default compression: ', #compressed_default)
assert(uncompress(compressed_default, #data) == data, 'decompression failed!')

local compressed_max = assert(compress(data, z.Z_BEST_COMPRESSION))
print('best compression: ', #compressed_max)
assert(uncompress(compressed_max, #data) == data, 'decompression failed!')

local compressed_not = assert(compress(data, z.Z_NO_COMPRESSION))
print('no compression: ', #compressed_not)
assert(uncompress(compressed_not, #data) == data, 'decompression failed!')
