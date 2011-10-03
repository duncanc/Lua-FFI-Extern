
local ffi = require 'ffi'

ffi.cdef [[

	typedef long z_off_t;

	enum {
		ZLIB_VERNUM = 0x1230,
		
		Z_NO_FLUSH = 0,
		Z_PARTIAL_FLUSH = 1, // deprecated, use Z_SYNC_FLUSH
		Z_SYNC_FLUSH = 2,
		Z_FULL_FLUSH = 3,
		Z_FINISH = 4,
		Z_BLOCK = 5,
		Z_OK = 0,
		Z_STREAM_END = 1,
		Z_NEED_DICT = 2,
		Z_ERRNO = -1,
		Z_STREAM_ERROR = -2,
		Z_DATA_ERROR = -3,
		Z_MEM_ERROR = -4,
		Z_BUF_ERROR = -5,
		Z_VERSION_ERROR = -6,
		// compression levels
		Z_NO_COMPRESSION = 0,
		Z_BEST_SPEED = 1,
		Z_BEST_COMPRESSION = 9,
		Z_DEFAULT_COMPRESSION = -1,
		// compression strategy, see deflateInit2()
		Z_FILTERED = 1,
		Z_HUFFMAN_ONLY = 2,
		Z_RLE = 3,
		Z_FIXED = 4,
		Z_DEFAULT_STRATEGY = 0,
		// data_type
		Z_BINARY = 0,
		Z_TEXT = 1,
		Z_UNKNOWN = 2,
		// compression method (only 'deflate' supported)
		Z_DEFLATED = 8,
		// intended for initializing zalloc, zfree, opaque
		Z_NULL = 0
	};

	struct internal_state;

	typedef void* (*alloc_func)(void* opaque, unsigned int items, unsigned int size);
	typedef void (*free_func)(void* opaque, void* address);
	
	typedef struct z_stream {
		unsigned char* next_in;
		unsigned int avail_in;
		unsigned long total_in;
		
		unsigned char* next_out;
		unsigned int avail_out;
		unsigned long total_out;
		
		char* msg;
		struct internal_state* state;
		
		alloc_func zalloc;
		free_func zfree;
		void* opaque;
		
		int data_type;
		unsigned long adler;
		unsigned long reserved;
	} z_stream;

	typedef struct gz_header {
		int text;
		unsigned long time;
		int xflags;
		int os;
		
		unsigned char* extra;
		unsigned int extra_len;
		unsigned int extra_max;
		
		unsigned char* name;
		unsigned int name_max;
		
		unsigned char* comment;
		unsigned int comm_max;
		
		int hcrc;
		int done;
	} gz_header;
	
	typedef void* gzFile;

	typedef unsigned int (*in_func)(void*, unsigned char**);
	typedef int (*out_func)(void*, unsigned char*, unsigned);

	const char* zlibVersion();
	int deflate(z_stream*, int flush);
	int deflateEnd(z_stream*);
	int inflate(z_stream*, int flush);
	int inflateEnd(z_stream*);
	int deflateSetDictionary(z_stream*, const unsigned char* dictionary, unsigned int dictLength);
	int deflateCopy(z_stream* dest, z_stream* source);
	int deflateReset(z_stream*);
	int deflateParams(z_stream*, int level, int strategy);
	int deflateTune(z_stream*, int good_length, int max_lazy, int nice_length, int max_chain);
	unsigned long deflateBound(z_stream*, unsigned long sourceLen);
	int deflatePrime(z_stream*, int bits, int value);
	int deflateSetHeader(z_stream*, gz_header* head);
	int inflateSetDictionary(z_stream*, const unsigned char* dictionary, unsigned int dictLength);
	int inflateSync(z_stream*);
	int inflateCopy(z_stream* dest, z_stream* source);
	int inflateReset(z_stream*);
	int inflatePrime(z_stream*, int bits, int value);
	int inflateGetHeader(z_stream*, gz_header* head);
	int inflateBack(z_stream*, in_func in, void* in_desc, out_func out, void* out_desc);
	int inflateBackEnd(z_stream*);
	unsigned long zlibCompileFlags();
	int compress(unsigned char* dest, unsigned long* destLen, const unsigned char* source, unsigned long sourceLen);
	int compress2(unsigned char* dest, unsigned long* destLen, const unsigned char* source, unsigned long sourceLen, int level);
	unsigned long compressBound(unsigned long sourceLen);
	int uncompress(unsigned char* dest, unsigned long* destLen, const unsigned char* source, unsigned long sourceLen);
	gzFile gzopen(const char* path, const char* mode);
	gzFile gzdopen(int fd, const char* mode);
	int gzsetparams(gzFile file, int level, int strategy);
	int gzread(gzFile file, void* buf, unsigned len);
	int gzwrite(gzFile file, void const* buf, unsigned len);
	int gzprintf(gzFile file, const char* format, ...);
	int gzputs(gzFile file, const char* s);
	char* gzgets(gzFile file, char* buf, int len);
	int gzputc(gzFile file, int c);
	int gzgetc(gzFile file);
	int gzungetc(int c, gzFile file);
	int gzflush(gzFile file, int flush);
	z_off_t gzseek(gzFile file, z_off_t offset, int whence);
	int gzrewind(gzFile file);
	z_off_t gztell(gzFile file);
	int gzeof(gzFile file);
	int gzdirect(gzFile file);
	int gzclose(gzFile file);
	const char* gzerror(gzFile file, int* errnum);
	void gzclearerr(gzFile file);
	unsigned long adler32(unsigned long adler, const unsigned char* buf, unsigned int len);
	unsigned long adler32_combine(unsigned long adler1, unsigned long adler2, z_off_t len2);
	unsigned long crc32(unsigned long crc, const unsigned char* buf, unsigned int len);
	unsigned long crc32_combine(unsigned long crc1, unsigned long crc2, z_off_t len2);
	int deflateInit_(z_stream*, int level, const char* version, int stream_size);
	int inflateInit_(z_stream*, const char* version, int stream_size);
	int deflateInit2_(z_stream*, int level, int method, int windowBits, int memLevel, int strategy, const char* version, int stream_size);
	int inflateInit2_(z_stream*, int windowBits, const char* version, int stream_size);
	int inflateBackInit_(z_stream*, int windowBits, unsigned char* window, const char* version, int stream_size);

	const char* zError(int);
	int inflateSyncPoint(z_stream* z);
	const unsigned long* get_crc_table();

]]

if ffi.os == 'Windows' then
  return ffi.load 'ZLIB1'
else
  return ffi.load 'z'
end

