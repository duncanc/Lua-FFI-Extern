
local ffi = require 'ffi'
local mswindows = require 'extern.mswindows'
local com = require 'extern.mswindows.com'
local ddraw = require 'extern.directx.ddraw'
require 'extern.directx.d3dcommon'

ffi.cdef [[

	enum {
		D3DVIS_INSIDE_FRUSTUM = 0,
		D3DVIS_INTERSECT_FRUSTUM = 1,
		D3DVIS_OUTSIDE_FRUSTUM = 2,
		D3DVIS_INSIDE_LEFT = 0,
		D3DVIS_INTERSECT_LEFT = 4,
		D3DVIS_OUTSIDE_LEFT = 8,
		D3DVIS_INSIDE_RIGHT = 0,
		D3DVIS_INTERSECT_RIGHT = 16,
		D3DVIS_OUTSIDE_RIGHT = 32,
		D3DVIS_INSIDE_TOP = 0,
		D3DVIS_INTERSECT_TOP = 64,
		D3DVIS_OUTSIDE_TOP = 128,
		D3DVIS_INSIDE_BOTTOM = 0,
		D3DVIS_INTERSECT_BOTTOM = 256,
		D3DVIS_OUTSIDE_BOTTOM = 512,
		D3DVIS_INSIDE_NEAR = 0,
		D3DVIS_INTERSECT_NEAR = 1024,
		D3DVIS_OUTSIDE_NEAR = 2048,
		D3DVIS_INSIDE_FAR = 0,
		D3DVIS_INTERSECT_FAR = 4096,
		D3DVIS_OUTSIDE_FAR = 8192,
		D3DVIS_MASK_FRUSTUM = 3,
		D3DVIS_MASK_LEFT = 12,
		D3DVIS_MASK_RIGHT = 48,
		D3DVIS_MASK_TOP = 192,
		D3DVIS_MASK_BOTTOM = 768,
		D3DVIS_MASK_NEAR = 3072,
		D3DVIS_MASK_FAR = 12288,
		D3DDEVINFOID_TEXTUREMANAGER = 1,
		D3DDEVINFOID_D3DTEXTUREMANAGER = 2,
		D3DDEVINFOID_TEXTURING = 3,
		D3DVBLEND_DISABLE = 0,
		D3DVBLEND_1WEIGHT = 1,
		D3DVBLEND_2WEIGHTS = 2,
		D3DVBLEND_3WEIGHTS = 3,
		D3DVBCAPS_SYSTEMMEMORY = 0x00000800,
		D3DVBCAPS_WRITEONLY = 0x00010000,
		D3DVBCAPS_OPTIMIZED = 0x80000000,
		D3DVBCAPS_DONOTCLIP = 0x00000001,
		D3DVOP_LIGHT = 1024,
		D3DVOP_TRANSFORM = 1,
		D3DVOP_CLIP = 4,
		D3DVOP_EXTENTS = 8,
		D3DMAXNUMVERTICES = 65535,
		D3DMAXNUMPRIMITIVES = 65535,
		D3DPAL_FREE = 0x00,
		D3DPAL_READONLY = 0x40,
		D3DPAL_RESERVED = 0x80,
		D3DEXECUTE_CLIPPED = 0x00000001,
		D3DEXECUTE_UNCLIPPED = 0x00000002,
		D3DCLIPSTATUS_STATUS = 0x00000001,
		D3DCLIPSTATUS_EXTENTS2 = 0x00000002,
		D3DCLIPSTATUS_EXTENTS3 = 0x00000004,
		D3DSETSTATUS_STATUS = 0x00000001,
		D3DSETSTATUS_EXTENTS = 0x00000002,
		D3DSETSTATUS_ALL = 3,
		D3DPROCESSVERTICES_TRANSFORMLIGHT = 0x00000000,
		D3DPROCESSVERTICES_TRANSFORM = 0x00000001,
		D3DPROCESSVERTICES_COPY = 0x00000002,
		D3DPROCESSVERTICES_OPMASK = 0x00000007,
		D3DPROCESSVERTICES_UPDATEEXTENTS = 0x00000008,
		D3DPROCESSVERTICES_NOCOLOR = 0x00000010,
		D3DTFG_POINT = 1,
		D3DTFG_LINEAR = 2,
		D3DTFG_FLATCUBIC = 3,
		D3DTFG_GAUSSIANCUBIC = 4,
		D3DTFG_ANISOTROPIC = 5,
		D3DTFN_POINT = 1,
		D3DTFN_LINEAR = 2,
		D3DTFN_ANISOTROPIC = 3,
		D3DTFP_NONE = 1,
		D3DTFP_POINT = 2,
		D3DTFP_LINEAR = 3,
		D3DTRIFLAG_START = 0x00000000,
		D3DTRIFLAG_ODD = 0x0000001e,
		D3DTRIFLAG_EVEN = 0x0000001f,
		D3DTRIFLAG_EDGEENABLE1 = 0x00000100,
		D3DTRIFLAG_EDGEENABLE2 = 0x00000200,
		D3DTRIFLAG_EDGEENABLE3 = 0x00000400,
		D3DTRIFLAG_EDGEENABLETRIANGLE = 0x700,
		D3DFILTER_NEAREST = 1,
		D3DFILTER_LINEAR = 2,
		D3DFILTER_MIPNEAREST = 3,
		D3DFILTER_MIPLINEAR = 4,
		D3DFILTER_LINEARMIPNEAREST = 5,
		D3DFILTER_LINEARMIPLINEAR = 6,
		D3DTBLEND_DECAL = 1,
		D3DTBLEND_MODULATE = 2,
		D3DTBLEND_DECALALPHA = 3,
		D3DTBLEND_MODULATEALPHA = 4,
		D3DTBLEND_DECALMASK = 5,
		D3DTBLEND_MODULATEMASK = 6,
		D3DTBLEND_COPY = 7,
		D3DTBLEND_ADD = 8,
		D3DANTIALIAS_NONE = 0,
		D3DANTIALIAS_SORTDEPENDENT = 1,
		D3DANTIALIAS_SORTINDEPENDENT = 2,
		D3DVT_VERTEX = 1,
		D3DVT_LVERTEX = 2,
		D3DVT_TLVERTEX = 3,
		D3DSTATE_OVERRIDE_BIAS = 256,
		D3DTRANSFORMSTATE_WORLD = 1,
		D3DTRANSFORMSTATE_VIEW = 2,
		D3DTRANSFORMSTATE_PROJECTION = 3,
		D3DTRANSFORMSTATE_WORLD1 = 4,
		D3DTRANSFORMSTATE_WORLD2 = 5,
		D3DTRANSFORMSTATE_WORLD3 = 6,
		D3DTRANSFORMSTATE_TEXTURE0 = 16,
		D3DTRANSFORMSTATE_TEXTURE1 = 17,
		D3DTRANSFORMSTATE_TEXTURE2 = 18,
		D3DTRANSFORMSTATE_TEXTURE3 = 19,
		D3DTRANSFORMSTATE_TEXTURE4 = 20,
		D3DTRANSFORMSTATE_TEXTURE5 = 21,
		D3DTRANSFORMSTATE_TEXTURE6 = 22,
		D3DTRANSFORMSTATE_TEXTURE7 = 23,
		D3DLIGHTSTATE_MATERIAL = 1,
		D3DLIGHTSTATE_AMBIENT = 2,
		D3DLIGHTSTATE_COLORMODEL = 3,
		D3DLIGHTSTATE_FOGMODE = 4,
		D3DLIGHTSTATE_FOGSTART = 5,
		D3DLIGHTSTATE_FOGEND = 6,
		D3DLIGHTSTATE_FOGDENSITY = 7,
		D3DLIGHTSTATE_COLORVERTEX = 8,
		D3DRENDERSTATE_ANTIALIAS = D3DRS_ANTIALIAS,
		D3DRENDERSTATE_TEXTUREPERSPECTIVE = D3DRS_TEXTUREPERSPECTIVE,
		D3DRENDERSTATE_ZENABLE = D3DRS_ZENABLE,
		D3DRENDERSTATE_FILLMODE = D3DRS_FILLMODE,
		D3DRENDERSTATE_SHADEMODE = D3DRS_SHADEMODE,
		D3DRENDERSTATE_LINEPATTERN = D3DRS_LINEPATTERN,
		D3DRENDERSTATE_ZWRITEENABLE = D3DRS_ZWRITEENABLE,
		D3DRENDERSTATE_ALPHATESTENABLE = D3DRS_ALPHATESTENABLE,
		D3DRENDERSTATE_LASTPIXEL = D3DRS_LASTPIXEL,
		D3DRENDERSTATE_SRCBLEND = D3DRS_SRCBLEND,
		D3DRENDERSTATE_DESTBLEND = D3DRS_DESTBLEND,
		D3DRENDERSTATE_CULLMODE = D3DRS_CULLMODE,
		D3DRENDERSTATE_ZFUNC = D3DRS_ZFUNC,
		D3DRENDERSTATE_ALPHAREF = D3DRS_ALPHAREF,
		D3DRENDERSTATE_ALPHAFUNC = D3DRS_ALPHAFUNC,
		D3DRENDERSTATE_DITHERENABLE = D3DRS_DITHERENABLE,
		D3DRENDERSTATE_ALPHABLENDENABLE = D3DRS_ALPHABLENDENABLE,
		D3DRENDERSTATE_FOGENABLE = D3DRS_FOGENABLE,
		D3DRENDERSTATE_SPECULARENABLE = D3DRS_SPECULARENABLE,
		D3DRENDERSTATE_ZVISIBLE = D3DRS_ZVISIBLE,
		D3DRENDERSTATE_STIPPLEDALPHA = D3DRS_STIPPLEDALPHA,
		D3DRENDERSTATE_FOGCOLOR = D3DRS_FOGCOLOR,
		D3DRENDERSTATE_FOGTABLEMODE = D3DRS_FOGTABLEMODE,
		D3DRENDERSTATE_FOGSTART = D3DRS_FOGSTART,
		D3DRENDERSTATE_FOGEND = D3DRS_FOGEND,
		D3DRENDERSTATE_FOGDENSITY = D3DRS_FOGDENSITY,
		D3DRENDERSTATE_EDGEANTIALIAS = D3DRS_EDGEANTIALIAS,
		D3DRENDERSTATE_COLORKEYENABLE = D3DRS_COLORKEYENABLE,
		D3DRENDERSTATE_ZBIAS = D3DRS_ZBIAS,
		D3DRENDERSTATE_RANGEFOGENABLE = D3DRS_RANGEFOGENABLE,
		D3DRENDERSTATE_STENCILENABLE = D3DRS_STENCILENABLE,
		D3DRENDERSTATE_STENCILFAIL = D3DRS_STENCILFAIL,
		D3DRENDERSTATE_STENCILZFAIL = D3DRS_STENCILZFAIL,
		D3DRENDERSTATE_STENCILPASS = D3DRS_STENCILPASS,
		D3DRENDERSTATE_STENCILFUNC = D3DRS_STENCILFUNC,
		D3DRENDERSTATE_STENCILREF = D3DRS_STENCILREF,
		D3DRENDERSTATE_STENCILMASK = D3DRS_STENCILMASK,
		D3DRENDERSTATE_STENCILWRITEMASK = D3DRS_STENCILWRITEMASK,
		D3DRENDERSTATE_TEXTUREFACTOR = D3DRS_TEXTUREFACTOR,
		D3DRENDERSTATE_WRAP0 = D3DRS_WRAP0,
		D3DRENDERSTATE_WRAP1 = D3DRS_WRAP1,
		D3DRENDERSTATE_WRAP2 = D3DRS_WRAP2,
		D3DRENDERSTATE_WRAP3 = D3DRS_WRAP3,
		D3DRENDERSTATE_WRAP4 = D3DRS_WRAP4,
		D3DRENDERSTATE_WRAP5 = D3DRS_WRAP5,
		D3DRENDERSTATE_WRAP6 = D3DRS_WRAP6,
		D3DRENDERSTATE_WRAP7 = D3DRS_WRAP7,
		D3DRENDERSTATE_CLIPPING = D3DRS_CLIPPING,
		D3DRENDERSTATE_LIGHTING = D3DRS_LIGHTING,
		D3DRENDERSTATE_EXTENTS = D3DRS_EXTENTS,
		D3DRENDERSTATE_AMBIENT = D3DRS_AMBIENT,
		D3DRENDERSTATE_FOGVERTEXMODE = D3DRS_FOGVERTEXMODE,
		D3DRENDERSTATE_COLORVERTEX = D3DRS_COLORVERTEX,
		D3DRENDERSTATE_LOCALVIEWER = D3DRS_LOCALVIEWER,
		D3DRENDERSTATE_NORMALIZENORMALS = D3DRS_NORMALIZENORMALS,
		D3DRENDERSTATE_COLORKEYBLENDENABLE = D3DRS_COLORKEYBLENDENABLE,
		D3DRENDERSTATE_DIFFUSEMATERIALSOURCE = D3DRS_DIFFUSEMATERIALSOURCE,
		D3DRENDERSTATE_SPECULARMATERIALSOURCE = D3DRS_SPECULARMATERIALSOURCE,
		D3DRENDERSTATE_AMBIENTMATERIALSOURCE = D3DRS_AMBIENTMATERIALSOURCE,
		D3DRENDERSTATE_EMISSIVEMATERIALSOURCE = D3DRS_EMISSIVEMATERIALSOURCE,
		D3DRENDERSTATE_VERTEXBLEND = D3DRS_VERTEXBLEND,
		D3DRENDERSTATE_CLIPPLANEENABLE = D3DRS_CLIPPLANEENABLE,
		D3DRENDERSTATE_TEXTUREHANDLE = D3DRS_TEXTUREHANDLE,
		D3DRENDERSTATE_TEXTUREADDRESS = D3DRS_TEXTUREADDRESS,
		D3DRENDERSTATE_WRAPU = D3DRS_WRAPU,
		D3DRENDERSTATE_WRAPV = D3DRS_WRAPV,
		D3DRENDERSTATE_MONOENABLE = D3DRS_MONOENABLE,
		D3DRENDERSTATE_ROP2 = D3DRS_ROP2,
		D3DRENDERSTATE_PLANEMASK = D3DRS_PLANEMASK,
		D3DRENDERSTATE_TEXTUREMAG = D3DRS_TEXTUREMAG,
		D3DRENDERSTATE_TEXTUREMIN = D3DRS_TEXTUREMIN,
		D3DRENDERSTATE_TEXTUREMAPBLEND = D3DRS_TEXTUREMAPBLEND,
		D3DRENDERSTATE_SUBPIXEL = D3DRS_SUBPIXEL,
		D3DRENDERSTATE_SUBPIXELX = D3DRS_SUBPIXELX,
		D3DRENDERSTATE_STIPPLEENABLE = D3DRS_STIPPLEENABLE,
		D3DRENDERSTATE_BORDERCOLOR = D3DRS_BORDERCOLOR,
		D3DRENDERSTATE_TEXTUREADDRESSU = D3DRS_TEXTUREADDRESSU,
		D3DRENDERSTATE_TEXTUREADDRESSV = D3DRS_TEXTUREADDRESSV,
		D3DRENDERSTATE_MIPMAPLODBIAS = D3DRS_MIPMAPLODBIAS,
		D3DRENDERSTATE_ANISOTROPY = D3DRS_ANISOTROPY,
		D3DRENDERSTATE_FLUSHBATCH = D3DRS_FLUSHBATCH,
		D3DRENDERSTATE_TRANSLUCENTSORTINDEPENDENT = D3DRS_TRANSLUCENTSORTINDEPENDENT,
		D3DRENDERSTATE_STIPPLEPATTERN00 = D3DRS_STIPPLEPATTERN00,
		D3DRENDERSTATE_STIPPLEPATTERN01 = D3DRS_STIPPLEPATTERN01,
		D3DRENDERSTATE_STIPPLEPATTERN02 = D3DRS_STIPPLEPATTERN02,
		D3DRENDERSTATE_STIPPLEPATTERN03 = D3DRS_STIPPLEPATTERN03,
		D3DRENDERSTATE_STIPPLEPATTERN04 = D3DRS_STIPPLEPATTERN04,
		D3DRENDERSTATE_STIPPLEPATTERN05 = D3DRS_STIPPLEPATTERN05,
		D3DRENDERSTATE_STIPPLEPATTERN06 = D3DRS_STIPPLEPATTERN06,
		D3DRENDERSTATE_STIPPLEPATTERN07 = D3DRS_STIPPLEPATTERN07,
		D3DRENDERSTATE_STIPPLEPATTERN08 = D3DRS_STIPPLEPATTERN08,
		D3DRENDERSTATE_STIPPLEPATTERN09 = D3DRS_STIPPLEPATTERN09,
		D3DRENDERSTATE_STIPPLEPATTERN10 = D3DRS_STIPPLEPATTERN10,
		D3DRENDERSTATE_STIPPLEPATTERN11 = D3DRS_STIPPLEPATTERN11,
		D3DRENDERSTATE_STIPPLEPATTERN12 = D3DRS_STIPPLEPATTERN12,
		D3DRENDERSTATE_STIPPLEPATTERN13 = D3DRS_STIPPLEPATTERN13,
		D3DRENDERSTATE_STIPPLEPATTERN14 = D3DRS_STIPPLEPATTERN14,
		D3DRENDERSTATE_STIPPLEPATTERN15 = D3DRS_STIPPLEPATTERN15,
		D3DRENDERSTATE_STIPPLEPATTERN16 = D3DRS_STIPPLEPATTERN16,
		D3DRENDERSTATE_STIPPLEPATTERN17 = D3DRS_STIPPLEPATTERN17,
		D3DRENDERSTATE_STIPPLEPATTERN18 = D3DRS_STIPPLEPATTERN18,
		D3DRENDERSTATE_STIPPLEPATTERN19 = D3DRS_STIPPLEPATTERN19,
		D3DRENDERSTATE_STIPPLEPATTERN20 = D3DRS_STIPPLEPATTERN20,
		D3DRENDERSTATE_STIPPLEPATTERN21 = D3DRS_STIPPLEPATTERN21,
		D3DRENDERSTATE_STIPPLEPATTERN22 = D3DRS_STIPPLEPATTERN22,
		D3DRENDERSTATE_STIPPLEPATTERN23 = D3DRS_STIPPLEPATTERN23,
		D3DRENDERSTATE_STIPPLEPATTERN24 = D3DRS_STIPPLEPATTERN24,
		D3DRENDERSTATE_STIPPLEPATTERN25 = D3DRS_STIPPLEPATTERN25,
		D3DRENDERSTATE_STIPPLEPATTERN26 = D3DRS_STIPPLEPATTERN26,
		D3DRENDERSTATE_STIPPLEPATTERN27 = D3DRS_STIPPLEPATTERN27,
		D3DRENDERSTATE_STIPPLEPATTERN28 = D3DRS_STIPPLEPATTERN28,
		D3DRENDERSTATE_STIPPLEPATTERN29 = D3DRS_STIPPLEPATTERN29,
		D3DRENDERSTATE_STIPPLEPATTERN30 = D3DRS_STIPPLEPATTERN30,
		D3DRENDERSTATE_STIPPLEPATTERN31 = D3DRS_STIPPLEPATTERN31,
		D3DRENDERSTATE_FOGTABLESTART = D3DRS_FOGTABLESTART,
		D3DRENDERSTATE_FOGTABLEEND = D3DRS_FOGTABLEEND,
		D3DRENDERSTATE_FOGTABLEDENSITY = D3DRS_FOGTABLEDENSITY,
		D3DRENDERSTATE_BLENDENABLE = D3DRS_BLENDENABLE,
		D3DOP_POINT = 1,
		D3DOP_LINE = 2,
		D3DOP_TRIANGLE = 3,
		D3DOP_MATRIXLOAD = 4,
		D3DOP_MATRIXMULTIPLY = 5,
		D3DOP_STATETRANSFORM = 6,
		D3DOP_STATELIGHT = 7,
		D3DOP_STATERENDER = 8,
		D3DOP_PROCESSVERTICES = 9,
		D3DOP_TEXTURELOAD = 10,
		D3DOP_EXIT = 11,
		D3DOP_BRANCHFORWARD = 12,
		D3DOP_SPAN = 13,
		D3DOP_SETSTATUS = 14,
		D3DCOLOR_MONO = 1,
		D3DCOLOR_RGB = 2,
		D3DLIGHT_ACTIVE = 0x00000001,
		D3DLIGHT_NO_SPECULAR = 0x00000002,
		D3DLIGHT_ALL = 3,
		D3DLIGHT_PARALLELPOINT = 4,
		D3DLIGHT_GLSPOT = 5,
		D3DNEXT_NEXT = 0x00000001,
		D3DNEXT_HEAD = 0x00000002,
		D3DNEXT_TAIL = 0x00000004,
		D3DDP_WAIT = 0x00000001,
		D3DDP_OUTOFORDER = 0x00000002,
		D3DDP_DONOTCLIP = 0x00000004,
		D3DDP_DONOTUPDATEEXTENTS = 0x00000008,
		D3DDP_DONOTLIGHT = 0x00000010,
		D3DCLIP_LEFT = 0x00000001,
		D3DCLIP_RIGHT = 0x00000002,
		D3DCLIP_TOP = 0x00000004,
		D3DCLIP_BOTTOM = 0x00000008,
		D3DCLIP_FRONT = 0x00000010,
		D3DCLIP_BACK = 0x00000020,
		D3DCLIP_GEN0 = 0x00000040,
		D3DCLIP_GEN1 = 0x00000080,
		D3DCLIP_GEN2 = 0x00000100,
		D3DCLIP_GEN3 = 0x00000200,
		D3DCLIP_GEN4 = 0x00000400,
		D3DCLIP_GEN5 = 0x00000800,
		D3DSTATUS_CLIPUNIONLEFT = D3DCLIP_LEFT,
		D3DSTATUS_CLIPUNIONRIGHT = D3DCLIP_RIGHT,
		D3DSTATUS_CLIPUNIONTOP = D3DCLIP_TOP,
		D3DSTATUS_CLIPUNIONBOTTOM = D3DCLIP_BOTTOM,
		D3DSTATUS_CLIPUNIONFRONT = D3DCLIP_FRONT,
		D3DSTATUS_CLIPUNIONBACK = D3DCLIP_BACK,
		D3DSTATUS_CLIPUNIONGEN0 = D3DCLIP_GEN0,
		D3DSTATUS_CLIPUNIONGEN1 = D3DCLIP_GEN1,
		D3DSTATUS_CLIPUNIONGEN2 = D3DCLIP_GEN2,
		D3DSTATUS_CLIPUNIONGEN3 = D3DCLIP_GEN3,
		D3DSTATUS_CLIPUNIONGEN4 = D3DCLIP_GEN4,
		D3DSTATUS_CLIPUNIONGEN5 = D3DCLIP_GEN5,
		D3DSTATUS_CLIPINTERSECTIONLEFT = 0x00001000,
		D3DSTATUS_CLIPINTERSECTIONRIGHT = 0x00002000,
		D3DSTATUS_CLIPINTERSECTIONTOP = 0x00004000,
		D3DSTATUS_CLIPINTERSECTIONBOTTOM = 0x00008000,
		D3DSTATUS_CLIPINTERSECTIONFRONT = 0x00010000,
		D3DSTATUS_CLIPINTERSECTIONBACK = 0x00020000,
		D3DSTATUS_CLIPINTERSECTIONGEN0 = 0x00040000,
		D3DSTATUS_CLIPINTERSECTIONGEN1 = 0x00080000,
		D3DSTATUS_CLIPINTERSECTIONGEN2 = 0x00100000,
		D3DSTATUS_CLIPINTERSECTIONGEN3 = 0x00200000,
		D3DSTATUS_CLIPINTERSECTIONGEN4 = 0x00400000,
		D3DSTATUS_CLIPINTERSECTIONGEN5 = 0x00800000,
		D3DSTATUS_ZNOTVISIBLE = 0x01000000,
		D3DSTATUS_CLIPUNIONALL = 0x000fff,
		D3DSTATUS_CLIPINTERSECTIONALL = 0xfff000,
		D3DSTATUS_DEFAULT = 0x1fff000,
		D3DTRANSFORM_CLIPPED = 0x00000001,
		D3DTRANSFORM_UNCLIPPED = 0x00000002,
		D3DENUMRET_CANCEL = DDENUMRET_CANCEL,
		D3DENUMRET_OK = DDENUMRET_OK,
		D3DTRANSFORMCAPS_CLIP = 1,
		D3DLIGHTINGMODEL_RGB = 1,
		D3DLIGHTINGMODEL_MONO = 2,
		D3DLIGHTCAPS_POINT = 1,
		D3DLIGHTCAPS_SPOT = 2,
		D3DLIGHTCAPS_DIRECTIONAL = 4,
		D3DLIGHTCAPS_PARALLELPOINT = 8,
		D3DLIGHTCAPS_GLSPOT = 16,
		D3DPTBLENDCAPS_DECAL = 0x00000001,
		D3DPTBLENDCAPS_MODULATE = 0x00000002,
		D3DPTBLENDCAPS_DECALALPHA = 0x00000004,
		D3DPTBLENDCAPS_MODULATEALPHA = 0x00000008,
		D3DPTBLENDCAPS_DECALMASK = 0x00000010,
		D3DPTBLENDCAPS_MODULATEMASK = 0x00000020,
		D3DPTBLENDCAPS_COPY = 0x00000040,
		D3DPTBLENDCAPS_ADD = 0x00000080,
		D3DDD_COLORMODEL = 0x00000001,
		D3DDD_DEVCAPS = 0x00000002,
		D3DDD_TRANSFORMCAPS = 0x00000004,
		D3DDD_LIGHTINGCAPS = 0x00000008,
		D3DDD_BCLIPPING = 0x00000010,
		D3DDD_LINECAPS = 0x00000020,
		D3DDD_TRICAPS = 0x00000040,
		D3DDD_DEVICERENDERBITDEPTH = 0x00000080,
		D3DDD_DEVICEZBUFFERBITDEPTH = 0x00000100,
		D3DDD_MAXBUFFERSIZE = 0x00000200,
		D3DDD_MAXVERTEXCOUNT = 0x00000400,
		D3DDEBCAPS_SYSTEMMEMORY = 0x00000001,
		D3DDEBCAPS_VIDEOMEMORY = 0x00000002,
		D3DDEBCAPS_MEM = 0x00000003,
		D3DDEB_BUFSIZE = 0x00000001,
		D3DDEB_CAPS = 0x00000002,
		D3DDEB_LPDATA = 0x00000004,
		D3DFDS_COLORMODEL = 0x00000001,
		D3DFDS_GUID = 0x00000002,
		D3DFDS_HARDWARE = 0x00000004,
		D3DFDS_TRIANGLES = 0x00000008,
		D3DFDS_LINES = 0x00000010,
		D3DFDS_MISCCAPS = 0x00000020,
		D3DFDS_RASTERCAPS = 0x00000040,
		D3DFDS_ZCMPCAPS = 0x00000080,
		D3DFDS_ALPHACMPCAPS = 0x00000100,
		D3DFDS_SRCBLENDCAPS = 0x00000200,
		D3DFDS_DSTBLENDCAPS = 0x00000400,
		D3DFDS_SHADECAPS = 0x00000800,
		D3DFDS_TEXTURECAPS = 0x00001000,
		D3DFDS_TEXTUREFILTERCAPS = 0x00002000,
		D3DFDS_TEXTUREBLENDCAPS = 0x00004000,
		D3DFDS_TEXTUREADDRESSCAPS = 0x00008000,
	};

	typedef int32_t (*D3DVALIDATECALLBACK)(void* userarg, uint32_t offset);
	typedef int32_t (*D3DENUMTEXTUREFORMATSCALLBACK)(DDSURFACEDESC*, void* context);
	typedef int32_t (*D3DENUMPIXELFORMATSCALLBACK)(DDPIXELFORMAT*, void* context);
	
	typedef struct D3DHVERTEX {
    union {  float hx;  float dvHX;  };
    union {  float hy;  float dvHY;  };
    union {  float hz;  float dvHZ;  };
	} D3DHVERTEX;
	
	typedef struct D3DTLVERTEX {
    union {  float sx;        float dvSX;        };
    union {  float sy;        float dvSY;        };
    union {  float sz;        float dvSZ;        };
    union {  float rhw;       float dcRHW;       };
    union {  float color;     float dcColor;     };
    union {  float specular;  float dcSpecular;  };
    union {  float tu;        float dvTU;        };
    union {  float tv;        float dvTV;        };
	} D3DTLVERTEX;
	
	typedef struct D3DLVERTEX {
    union {  float x;         float dvX;         };
    union {  float y;         float dvY;         };
    union {  float z;         float dvZ;         };
		uint32_t dwReserved;
    union {  float color;     float dcColor;     };
    union {  float specular;  float dcSpecular;  };
    union {  float tu;        float dvTU;        };
    union {  float tv;        float dvTV;        };
	} D3DLVERTEX;
	
	typedef struct D3DVERTEX {
    union {  float x;   float dvX;   };
    union {  float y;   float dvY;   };
    union {  float z;   float dvZ;   };
    union {  float nx;  float dvNX;  };
    union {  float ny;  float dvNY;  };
    union {  float nz;  float dvNZ;  };
    union {  float tu;  float dvTU;  };
    union {  float tv;  float dvTV;  };
	} D3DVERTEX;
	
	typedef struct D3DVIEWPORT {
		uint32_t dwSize, dwX, dwY, dwWidth, dwHeight, dwScaleX, dwScaleY;
		float dvScaleX, dvScaleY, dvMaxX, dvMaxY, dvMinZ, dvMaxY;
	} D3DVIEWPORT;

	typedef struct D3DVIEWPORT2 {
		uint32_t dwSize, dwX, dwY, dwWidth, dwHeight;
		float dvClipX, dvClipY, dvClipWidth, dvClipHeight, dvMinZ, dvMaxZ;
	} D3DVIEWPORT2;

	typedef struct D3DVIEWPORT7 {
		uint32_t dwX, dwY, dwWidth, dwHeight;
		float dvMinZ, dvMaxZ;
	} D3DVIEWPORT7;
	
	typedef struct D3DTRANSFORMDATA {
    uint32_t    dwSize;
    void*       lpIn;
    uint32_t    dwInSize;
    void*       lpOut;
    uint32_t    dwOutSize;
    D3DHVERTEX* lpHOut;
    uint32_t    dwClip, dwClipIntersection, dwClipUnion;
    D3DRECT     drExtent;
	} D3DTRANSFORMDATA;

	typedef struct D3DLIGHTINGELEMENT {
    D3DVECTOR dvPosition, dvNormal;
	} D3DLIGHTINGELEMENT;

	typedef struct D3DMATERIAL {
    uint32_t dwSize;
    union {  D3DCOLORVALUE diffuse;   D3DCOLORVALUE dcvDiffuse;   };
    union {  D3DCOLORVALUE ambient;   D3DCOLORVALUE dcvAmbient;   };
    union {  D3DCOLORVALUE specular;  D3DCOLORVALUE dcvSpecular;  };
    union {  D3DCOLORVALUE emissive;  D3DCOLORVALUE dcvEmissive;  };
    union {  float power;             float dvPower;              };
    uint32_t hTexture, dwRampSize;
	} D3DMATERIAL;

	typedef struct D3DMATERIAL7 {
    union {  D3DCOLORVALUE diffuse;   D3DCOLORVALUE dcvDiffuse;   };
    union {  D3DCOLORVALUE ambient;   D3DCOLORVALUE dcvAmbient;   };
    union {  D3DCOLORVALUE specular;  D3DCOLORVALUE dcvSpecular;  };
    union {  D3DCOLORVALUE emissive;  D3DCOLORVALUE dcvEmissive;  };
    union {  float power;             float dvPower;              };
	} D3DMATERIAL7;

	typedef struct D3DLIGHT {
    uint32_t dwSize;
    D3Denum dltType;
    D3DCOLORVALUE dcvColor;
    D3DVECTOR dvPosition, dvDirection;
    float dvRange, dvFalloff, dvAttenuation0, dvAttenuation1, dvAttenuation2, dvTheta, dvPhi;
	} D3DLIGHT;

	typedef struct D3DLIGHT2 {
    uint32_t dwSize;
    D3Denum dltType;
    D3DCOLORVALUE dcvColor;
    D3DVECTOR dvPosition, dvDirection;
    float dvRange, dvFalloff, dvAttenuation0, dvAttenuation1, dvAttenuation2, dvTheta, dvPhi;
    uint32_t dwFlags;
	} D3DLIGHT2;

	typedef struct D3DLIGHT7 {
    D3Denum dltType;
    D3DCOLORVALUE dcvDiffuse, dcvSpecular, dcvAmbient;
    D3DVECTOR dvPosition, dvDirection;
    float dvRange, dvFalloff, dvAttenuation0, dvAttenuation1, dvAttenuation2, dvTheta, dvPhi;
	} D3DLIGHT7;
	
	typedef struct D3DLIGHTDATA {
    uint32_t dwSize;
    D3DLIGHTINGELEMENT* lpIn;
    uint32_t dwInSize;
    D3DTLVERTEX* lpOut;
    uint32_t dwOutSize;
	} D3DLIGHTDATA;

	typedef struct D3DINSTRUCTION {
    uint8_t bOpcode, bSize;
    uint16_t wCount;
	} D3DINSTRUCTION;

	typedef struct D3DTEXTURELOAD { uint32_t hDestTexture, hSrcTexture; } D3DTEXTURELOAD;

	typedef struct D3DPICKRECORD {
    uint8_t bOpcode, bPad;
    uint32_t dwOffset;
    float dvZ;
	} D3DPICKRECORD;

	typedef struct D3DSTATE {
    union {
			D3Denum  dtstTransformStateType;
			D3Denum  dlstLightStateType;
			D3Denum  drstRenderStateType;
    };
    union {
			uint32_t dwArg[1];
			float dvArg[1];
    };
	} D3DSTATE;

	typedef struct D3DMATRIXLOAD     { uint32_t hDestMatrix, hSrcMatrix;               } D3DMATRIXLOAD;
	typedef struct D3DMATRIXMULTIPLY { uint32_t hDestMatrix, hSrcMatrix1, hSrcMatrix2; } D3DMATRIXMULTIPLY;

	typedef struct D3DPROCESSVERTICES {
    uint32_t dwFlags;
    uint16_t wStart, wDest;
    uint32_t dwCount, dwReserved;
	} D3DPROCESSVERTICES;

	typedef struct D3DTRIANGLE {
    union {  uint16_t v1;  uint16_t wV1;  };
    union {  uint16_t v2;  uint16_t wV2;  };
    union {  uint16_t v3;  uint16_t wV3;  };
    uint16_t wFlags;
	} D3DTRIANGLE;

	typedef struct D3DLINE {
    union {  uint16_t v1;  uint16_t wV1;  };
    union {  uint16_t v2;  uint16_t wV2;  };
	} D3DLINE;

	typedef struct D3DSPAN { uint16_t wCount, wFirst; } D3DSPAN;
	typedef struct D3DPOINT { uint16_t wCount, wFirst; } D3DPOINT;
	
	typedef struct D3DBRANCH {
    uint32_t dwMask, dwValue;
    bool32 bNegate;
    uint32_t dwOffset;
	} D3DBRANCH;
	
	typedef struct D3DSTATUS {
    uint32_t dwFlags, dwStatus;
    D3DRECT drExtent;
	} D3DSTATUS;

	typedef struct D3DCLIPSTATUS {
    uint32_t dwFlags, dwStatus;
    float minx,maxx, miny,maxy, minz,maxz;
	} D3DCLIPSTATUS;

	typedef struct D3DSTATS {
    uint32_t dwSize, dwTrianglesDrawn, dwLinesDrawn, dwPointsDrawn, dwSpansDrawn, dwVerticesProcessed;
	} D3DSTATS;

	typedef struct D3DEXECUTEDATA {
    uint32_t dwSize, dwVertexOffset, dwVertexCount, dwInstructionOffset, dwInstructionLength, dwHVertexOffset;
    D3DSTATUS dsStatus;
	} D3DEXECUTEDATA;

	typedef struct D3DVERTEXBUFFERDESC { uint32_t dwSize, dwCaps, dwFVF, dwNumVertices; } D3DVERTEXBUFFERDESC;
	typedef struct D3DDP_PTRSTRIDE { void* lpvData; uint32_t dwStride; } D3DDP_PTRSTRIDE;
	
	typedef struct D3DDRAWPRIMITIVESTRIDEDDATA {
    D3DDP_PTRSTRIDE position, normal, diffuse, specular, textureCoords[D3DDP_MAXTEXCOORD];
	} D3DDRAWPRIMITIVESTRIDEDDATA;
	
	typedef struct D3DTRANSFORMCAPS { uint32_t dwSize, dwCaps; } D3DTRANSFORMCAPS;	
	typedef struct D3DLIGHTINGCAPS { uint32_t dwSize, dwCaps, dwLightingModel, dwNumLights; } D3DLIGHTINGCAPS;
	
	typedef struct D3DPRIMCAPS {
    uint32_t dwSize, dwMiscCaps, dwRasterCaps, dwZCmpCaps, dwSrcBlendCaps, dwDestBlendCaps, dwAlphaCmpCaps;
    uint32_t dwShadeCaps, dwTextureCaps, dwTextureFilterCaps, dwTextureBlendCaps, dwTextureAddressCaps;
    uint32_t dwStippleWidth, dwStippleHeight;
	} D3DPRIMCAPS;
	
	typedef struct D3DDEVICEDESC {
    uint32_t dwSize, dwFlags, dcmColorModel, dwDevCaps;
    D3DTRANSFORMCAPS dtcTransformCaps;
    bool32 bClipping;
    D3DLIGHTINGCAPS dlcLightingCaps;
    D3DPRIMCAPS dpcLineCaps, dpcTriCaps;
    uint32_t dwDeviceRenderBitDepth, dwDeviceZBufferBitDepth, dwMaxBufferSize, dwMaxVertexCount;
		// v5
    uint32_t dwMinTextureWidth, dwMinTextureHeight;
    uint32_t dwMaxTextureWidth, dwMaxTextureHeight;
    uint32_t dwMinStippleWidth, dwMaxStippleWidth;
    uint32_t dwMinStippleHeight, dwMaxStippleHeight;
    // v6
    uint32_t dwMaxTextureRepeat, dwMaxTextureAspectRatio, dwMaxAnisotropy;
    float dvGuardBandLeft, dvGuardBandTop, dvGuardBandRight, dvGuardBandBottom, dvExtentsAdjust;
    uint32_t dwStencilCaps, dwFVFCaps, dwTextureOpCaps;
    uint16_t wMaxTextureBlendStages, wMaxSimultaneousTextures;
	} D3DDEVICEDESC;

	typedef struct D3DDEVICEDESC7 {
    uint32_t dwDevCaps;
    D3DPRIMCAPS dpcLineCaps, dpcTriCaps;
    uint32_t dwDeviceRenderBitDepth, dwDeviceZBufferBitDepth;
    uint32_t dwMinTextureWidth, dwMinTextureHeight;
    uint32_t dwMaxTextureWidth, dwMaxTextureHeight;
    uint32_t dwMaxTextureRepeat, dwMaxTextureAspectRatio, dwMaxAnisotropy;
    float dvGuardBandLeft, dvGuardBandTop, dvGuardBandRight, dvGuardBandBottom, dvExtentsAdjust;
    uint32_t dwStencilCaps, dwFVFCaps, dwTextureOpCaps;
    uint16_t wMaxTextureBlendStages, wMaxSimultaneousTextures;
    uint32_t dwMaxActiveLights;
    float dvMaxVertexW;
    GUID deviceGUID;
    uint16_t wMaxUserClipPlanes, wMaxVertexBlendMatrices;
    uint32_t dwVertexProcessingCaps;
    uint32_t dwReserved1, dwReserved2, dwReserved3, dwReserved4;
	} D3DDEVICEDESC7;
	
	typedef struct D3DFINDDEVICESEARCH {
    uint32_t dwSize, dwFlags;
    bool32 bHardware;
    uint32_t dcmColorModel;
    GUID guid;
    uint32_t dwCaps;
    D3DPRIMCAPS dpcPrimCaps;
	} D3DFINDDEVICESEARCH;

	typedef struct D3DFINDDEVICERESULT {
    uint32_t dwSize;
    GUID guid;
    D3DDEVICEDESC ddHwDesc, ddSwDesc;
	} D3DFINDDEVICERESULT;

	typedef struct _D3DExecuteBufferDesc {
    uint32_t dwSize, dwFlags, dwCaps, dwBufferSize;
    void* lpData;
	} D3DEXECUTEBUFFERDESC;

	typedef struct D3DDEVINFO_TEXTUREMANAGER {
    bool32 bThrashing;
    uint32_t dwApproxBytesDownloaded, dwNumEvicts, dwNumVidCreates, dwNumTexturesUsed, dwNumUsedTexInVid;
    uint32_t dwWorkingSet, dwWorkingSetBytes, dwTotalManaged, dwTotalBytes, dwLastPri;
	} D3DDEVINFO_TEXTUREMANAGER;

	typedef struct D3DDEVINFO_TEXTURING {
    uint32_t dwNumLoads, dwApproxBytesLoaded, dwNumPreLoads, dwNumSet, dwNumCreates, dwNumDestroys;
		uint32_t dwNumSetPriorities, dwNumSetLODs, dwNumLocks, dwNumGetDCs;
	} D3DDEVINFO_TEXTURING;

	typedef int32_t (*D3DENUMDEVICESCALLBACK)(GUID* guid, char* lpDeviceDescription, char* lpDeviceName, D3DDEVICEDESC*, D3DDEVICEDESC*, void*);
	typedef int32_t (*D3DENUMDEVICESCALLBACK7)(char* lpDeviceDescription, char* lpDeviceName, D3DDEVICEDESC7*, void*);	
	
]]

--[[
define_guid( iid_idirect3drampdevice    	f2086b20-259f-11cf-a31a-00aa00b93356
define_guid( iid_idirect3drgbdevice     	a4665c60-2673-11cf-a31a-00aa00b93356
define_guid( iid_idirect3dhaldevice     	84e63de0-46aa-11cf-816f-0000c020156e
define_guid( iid_idirect3dmmxdevice     	881949a1-d6f3-11d0-89ab-00a0c9054129
define_guid( iid_idirect3drefdevice     	50936643-13e9-11d1-89aa-00a0c9054129
define_guid( iid_idirect3dnulldevice  		8767df22-bacc-11d1-8969-00a0c90629a8
define_guid( iid_idirect3dtnlhaldevice  	f5049e78-4861-11d2-a407-00a0c90629a8
--]]

com.def {
	{'IDirect3D';
		methods = {
			{'Initialize', 'GUID*'};
			{'EnumDevices', 'D3DENUMDEVICESCALLBACK*, void*'};
			{'CreateLight', 'IDirect3DLight**, IUnknown*'};
			{'CreateMaterial', 'IDirect3DMaterial**, IUnknown*'};
			{'CreateViewport', 'IDirect3DViewport**, IUnknown*'};
			{'FindDevice', 'D3DFINDDEVICESEARCH*, D3DFINDDEVICERESULT*'};
		};
		iid = '3bba0080-2421-11cf-a31a-00aa00b93356';
	};
	{'IDirect3DDevice';
		methods = {
			{'Initialize', 'IDirect3D*, GUID*, D3DDEVICEDESC*'};
			{'GetCaps', 'D3DDEVICEDESC*, D3DDEVICEDESC*'};
			{'SwapTextureHandles', 'IDirect3DTexture*, IDirect3DTexture*'};
			{'CreateExecuteBuffer', 'D3DEXECUTEBUFFERDESC*, IDirect3DExecuteBuffer**, IUnknown*'};
			{'GetStats', 'D3DSTATS*'};
			{'Execute', 'IDirect3DExecuteBuffer*, IDirect3DViewport*, uint32_t'};
			{'AddViewport', 'IDirect3DViewport*'};
			{'DeleteViewport', 'IDirect3DViewport*'};
			{'NextViewport', 'IDirect3DViewport*, IDirect3DViewport**, uint32_t'};
			{'Pick', 'IDirect3DExecuteBuffer*, IDirect3DViewport*, uint32_t, D3DRECT*'};
			{'GetPickRecords', 'uint32_t*, D3DPICKRECORD*'};
			{'EnumTextureFormats', 'D3DENUMTEXTUREFORMATSCALLBACK*, void*'};
			{'CreateMatrix', 'uint32_t*'};
			{'SetMatrix', 'uint32_t, const D3DMATRIX*'};
			{'GetMatrix', 'uint32_t, D3DMATRIX*'};
			{'DeleteMatrix', 'uint32_t'};
			{'BeginScene'};
			{'EndScene'};
			{'GetDirect3D', 'IDirect3D**'};
		};
		iid = '64108800-957d-11d0-89ab-00a0c9054129';
	};
	{'IDirect3DExecuteBuffer';
		methods = {
			{'Initialize', 'IDirect3DDevice*, D3DEXECUTEBUFFERDESC*'};
			{'Lock', 'D3DEXECUTEBUFFERDESC*'};
			{'Unlock'};
			{'SetExecuteData', 'D3DEXECUTEDATA*'};
			{'GetExecuteData', 'D3DEXECUTEDATA*'};
			{'Validate', 'uint32_t*, D3DVALIDATECALLBACK*, void*, uint32_t'};
			{'Optimize', 'uint32_t'};
		};
		iid = '4417c145-33ad-11cf-816f-0000c020156e';
	};
	{'IDirect3DLight';
		methods = {
			{'Initialize', 'IDirect3D*'};
			{'SetLight', 'D3DLIGHT*'};
			{'GetLight', 'D3DLIGHT*'};
		};
		iid = '4417c142-33ad-11cf-816f-0000c020156e';
	};
	{'IDirect3DMaterial';
		methods = {
			{'Initialize', 'IDirect3D*'};
			{'SetMaterial', 'D3DMATERIAL*'};
			{'GetMaterial', 'D3DMATERIAL*'};
			{'GetHandle', 'IDirect3DDevice*, uint32_t*'};
			{'Reserve'};
			{'Unreserve'};
		};
		iid = '4417c144-33ad-11cf-816f-0000c020156e';
	};
	{'IDirect3DTexture';
		methods = {
			{'Initialize', 'IDirect3DDevice*, IDirectDrawSurface*'};
			{'GetHandle', 'IDirect3DDevice*, uint32_t*'};
			{'PaletteChanged', 'uint32_t, uint32_t'};
			{'Load', 'IDirect3DTexture*'};
			{'Unload'};
		};
		iid = '2cdcd9e0-25a0-11cf-a31a-00aa00b93356';
	};
	{'IDirect3DViewport';
		methods = {
			{'Initialize', 'IDirect3D*'};
			{'GetViewport', 'D3DVIEWPORT*'};
			{'SetViewport', 'D3DVIEWPORT*'};
			{'TransformVertices', 'uint32_t, D3DTRANSFORMDATA*, uint32_t, uint32_t*'};
			{'LightElements', 'uint32_t, D3DLIGHTDATA*'};
			{'SetBackground', 'uint32_t'};
			{'GetBackground', 'uint32_t*, bool32*'};
			{'SetBackgroundDepth', 'IDirectDrawSurface*'};
			{'GetBackgroundDepth', 'IDirectDrawSurface**, bool32*'};
			{'Clear', 'uint32_t, D3DRECT*, uint32_t'};
			{'AddLight', 'IDirect3DLight*'};
			{'DeleteLight', 'IDirect3DLight*'};
			{'NextLight', 'IDirect3DLight*, IDirect3DLight**, uint32_t'};
		};
		iid = '4417c146-33ad-11cf-816f-0000c020156e';
	};
	
	{'IDirect3D2';
		methods = {
			{'EnumDevices', 'D3DENUMDEVICESCALLBACK*, void*'};
			{'CreateLight', 'IDirect3DLight**, IUnknown*'};
			{'CreateMaterial', 'IDirect3DMaterial2**, IUnknown*'};
			{'CreateViewport', 'IDirect3DViewport2**, IUnknown*'};
			{'FindDevice', 'D3DFINDDEVICESEARCH*, D3DFINDDEVICERESULT*'};
			{'CreateDevice', 'GUID*, IDirectDrawSurface*, IDirect3DDevice2**'};
		};
		iid = '6aae1ec1-662a-11d0-889d-00aa00bbb76a';
	};
	{'IDirect3DDevice2';
		methods = {
			{'GetCaps', 'D3DDEVICEDESC*, D3DDEVICEDESC*'};
			{'SwapTextureHandles', 'IDirect3DTexture2*, IDirect3DTexture2*'};
			{'GetStats', 'D3DSTATS*'};
			{'AddViewport', 'IDirect3DViewport2*'};
			{'DeleteViewport', 'IDirect3DViewport2*'};
			{'NextViewport', 'IDirect3DViewport2*, IDirect3DViewport2**, uint32_t'};
			{'EnumTextureFormats', 'D3DENUMTEXTUREFORMATSCALLBACK*, void*'};
			{'BeginScene'};
			{'EndScene'};
			{'GetDirect3D', 'IDirect3D2**'};
			{'SetCurrentViewport', 'IDirect3DViewport2*'};
			{'GetCurrentViewport', 'IDirect3DViewport2**'};
			{'SetRenderTarget', 'IDirectDrawSurface*, uint32_t'};
			{'GetRenderTarget', 'IDirectDrawSurface**'};
			{'Begin', 'D3Denum, D3Denum, uint32_t'};
			{'BeginIndexed', 'D3Denum, D3Denum, void*, uint32_t, uint32_t'};
			{'Vertex', 'void*'};
			{'Index', 'uint16_t'};
			{'End', 'uint32_t'};
			{'GetRenderState', 'D3Denum, uint32_t*'};
			{'SetRenderState', 'D3Denum, uint32_t'};
			{'GetLightState', 'D3Denum, uint32_t*'};
			{'SetLightState', 'D3Denum, uint32_t'};
			{'SetTransform', 'D3Denum, D3DMATRIX*'};
			{'GetTransform', 'D3Denum, D3DMATRIX*'};
			{'MultiplyTransform', 'D3Denum, D3DMATRIX*'};
			{'DrawPrimitive', 'D3Denum, D3Denum, void*, uint32_t, uint32_t'};
			{'DrawIndexedPrimitive', 'D3Denum, D3Denum, void*, uint32_t, uint16_t*, uint32_t, uint32_t'};
			{'SetClipStatus', 'D3DCLIPSTATUS*'};
			{'GetClipStatus', 'D3DCLIPSTATUS*'};
		};
		iid = '93281501-8cf8-11d0-89ab-00a0c9054129';
	};
	{'IDirect3DMaterial2';
		methods = {
			{'SetMaterial', 'D3DMATERIAL*'};
			{'GetMaterial', 'D3DMATERIAL*'};
			{'GetHandle', 'IDirect3DDevice2*, uint32_t*'};
		};
		iid = '93281503-8cf8-11d0-89ab-00a0c9054129';
	};
	{'IDirect3DTexture2';
		methods = {
			{'GetHandle', 'IDirect3DDevice2*, uint32_t*'};
			{'PaletteChanged', 'uint32_t, uint32_t'};
			{'Load', 'IDirect3DTexture2*'};
		};
		iid = '93281502-8cf8-11d0-89ab-00a0c9054129';
	};
	{'IDirect3DViewport2', inherits = 'IDirect3DViewport';
		methods = {
			{'GetViewport2', 'D3DVIEWPORT2*'};
			{'SetViewport2', 'D3DVIEWPORT2*'};
		};
		iid = '93281500-8cf8-11d0-89ab-00a0c9054129';
	};
	
	{'IDirect3D3';
		methods = {
			{'EnumDevices', 'D3DENUMDEVICESCALLBACK*, void*'};
			{'CreateLight', 'IDirect3DLight**, IUnknown*'};
			{'CreateMaterial', 'IDirect3DMaterial3**, IUnknown*'};
			{'CreateViewport', 'IDirect3DViewport3**, IUnknown*'};
			{'FindDevice', 'D3DFINDDEVICESEARCH*, D3DFINDDEVICERESULT*'};
			{'CreateDevice', 'GUID*, IDirectDrawSurface4*, IDirect3DDevice3**, IUnknown*'};
			{'CreateVertexBuffer', 'D3DVERTEXBUFFERDESC*, IDirect3DVertexBuffer**, uint32_t, IUnknown*'};
			{'EnumZBufferFormats', 'GUID*, D3DENUMPIXELFORMATSCALLBACK*, void*'};
			{'EvictManagedTextures'};
		};
		iid = 'bb223240-e72b-11d0-a9b4-00aa00c0993e';
	};
	{'IDirect3DDevice3';
		methods = {
			{'GetCaps', 'D3DDEVICEDESC*, D3DDEVICEDESC*'};
			{'GetStats', 'D3DSTATS*'};
			{'AddViewport', 'IDirect3DViewport3*'};
			{'DeleteViewport', 'IDirect3DViewport3*'};
			{'NextViewport', 'IDirect3DViewport3*, IDirect3DViewport3**, uint32_t'};
			{'EnumTextureFormats', 'D3DENUMPIXELFORMATSCALLBACK*, void*'};
			{'BeginScene'};
			{'EndScene'};
			{'GetDirect3D', 'IDirect3D3**'};
			{'SetCurrentViewport', 'IDirect3DViewport3*'};
			{'GetCurrentViewport', 'IDirect3DViewport3**'};
			{'SetRenderTarget', 'IDirectDrawSurface4*, uint32_t'};
			{'GetRenderTarget', 'IDirectDrawSurface4**'};
			{'Begin', 'D3Denum, uint32_t, uint32_t'};
			{'BeginIndexed', 'D3Denum, uint32_t, void*, uint32_t, uint32_t'};
			{'Vertex', 'void*'};
			{'Index', 'uint16_t'};
			{'End', 'uint32_t'};
			{'GetRenderState', 'D3Denum, uint32_t*'};
			{'SetRenderState', 'D3Denum, uint32_t'};
			{'GetLightState', 'D3Denum, uint32_t*'};
			{'SetLightState', 'D3Denum, uint32_t'};
			{'SetTransform', 'D3Denum, D3DMATRIX*'};
			{'GetTransform', 'D3Denum, D3DMATRIX*'};
			{'MultiplyTransform', 'D3Denum, D3DMATRIX*'};
			{'DrawPrimitive', 'D3Denum, uint32_t, void*, uint32_t, uint32_t'};
			{'DrawIndexedPrimitive', 'D3Denum, uint32_t, void*, uint32_t, uint16_t*, uint32_t, uint32_t'};
			{'SetClipStatus', 'D3DCLIPSTATUS*'};
			{'GetClipStatus', 'D3DCLIPSTATUS*'};
			{'DrawPrimitiveStrided', 'D3Denum, uint32_t, D3DDRAWPRIMITIVESTRIDEDDATA*, uint32_t, uint32_t'};
			{'DrawIndexedPrimitiveStrided', 'D3Denum, uint32_t, D3DDRAWPRIMITIVESTRIDEDDATA*, uint32_t, uint16_t*, uint32_t, uint32_t'};
			{'DrawPrimitiveVB', 'D3Denum, IDirect3DVertexBuffer*, uint32_t, uint32_t, uint32_t'};
			{'DrawIndexedPrimitiveVB', 'D3Denum, IDirect3DVertexBuffer*, uint16_t*, uint32_t, uint32_t'};
			{'ComputeSphereVisibility', 'D3DVECTOR*, float*, uint32_t, uint32_t, uint32_t*'};
			{'GetTexture', 'uint32_t, IDirect3DTexture2**'};
			{'SetTexture', 'uint32_t, IDirect3DTexture2*'};
			{'GetTextureStageState', 'uint32_t, D3Denum, uint32_t*'};
			{'SetTextureStageState', 'uint32_t, D3Denum, uint32_t'};
			{'ValidateDevice', 'uint32_t*'};
		};
		iid = 'b0ab3b60-33d7-11d1-a981-00c04fd7b174';
	};
	{'IDirect3DMaterial3';
		methods = {
			{'SetMaterial', 'D3DMATERIAL*'};
			{'GetMaterial', 'D3DMATERIAL*'};
			{'GetHandle', 'IDirect3DDevice3*, uint32_t*'};
		};
		iid = 'ca9c46f4-d3c5-11d1-b75a-00600852b312';
	};
	{'IDirect3DViewport3', inherits = 'IDirect3DViewport2';
		methods = {
			{'SetBackgroundDepth2', 'IDirectDrawSurface4*'};
			{'GetBackgroundDepth2', 'IDirectDrawSurface4**, bool32*'};
			{'Clear2', 'uint32_t, D3DRECT*, uint32_t, uint32_t color, float, uint32_t'};
		};
		iid = 'b0ab3b61-33d7-11d1-a981-00c04fd7b174';
	};
	{'IDirect3DVertexBuffer';
		methods = {
			{'Lock', 'uint32_t, void**, uint32_t*'};
			{'Unlock'};
			{'ProcessVertices', 'uint32_t, uint32_t, uint32_t, IDirect3DVertexBuffer*, uint32_t, IDirect3DDevice3*, uint32_t'};
			{'GetVertexBufferDesc', 'D3DVERTEXBUFFERDESC*'};
			{'Optimize', 'IDirect3DDevice3*, uint32_t'};
		};
		iid = '7a503555-4a83-11d1-a5db-00a0c90367f8';
	};
	
	{'IDirect3D7';
		methods = {
			{'EnumDevices', 'D3DENUMDEVICESCALLBACK7*, void*'};
			{'CreateDevice', 'GUID*, IDirectDrawSurface7*, IDirect3DDevice7**'};
			{'CreateVertexBuffer', 'D3DVERTEXBUFFERDESC*, IDirect3DVertexBuffer7**, uint32_t'};
			{'EnumZBufferFormats', 'GUID*, D3DENUMPIXELFORMATSCALLBACK*, void*'};
			{'EvictManagedTextures'};
		};
		iid = 'f5049e77-4861-11d2-a407-00a0c90629a8';
	};
	{'IDirect3DDevice7';
		methods = {
			{'GetCaps', 'D3DDEVICEDESC7*'};
			{'EnumTextureFormats', 'D3DENUMPIXELFORMATSCALLBACK*, void*'};
			{'BeginScene'};
			{'EndScene'};
			{'GetDirect3D', 'IDirect3D7**'};
			{'SetRenderTarget', 'IDirectDrawSurface7*, uint32_t'};
			{'GetRenderTarget', 'IDirectDrawSurface7**'};
			{'Clear', 'uint32_t, D3DRECT*, uint32_t, uint32_t color, float, uint32_t'};
			{'SetTransform', 'D3Denum, D3DMATRIX*'};
			{'GetTransform', 'D3Denum, D3DMATRIX*'};
			{'SetViewport', 'D3DVIEWPORT7*'};
			{'MultiplyTransform', 'D3Denum, D3DMATRIX*'};
			{'GetViewport', 'D3DVIEWPORT7*'};
			{'SetMaterial', 'D3DMATERIAL7*'};
			{'GetMaterial', 'D3DMATERIAL7*'};
			{'SetLight', 'uint32_t, D3DLIGHT7*'};
			{'GetLight', 'uint32_t, D3DLIGHT7*'};
			{'SetRenderState', 'D3Denum, uint32_t'};
			{'GetRenderState', 'D3Denum, uint32_t*'};
			{'BeginStateBlock'};
			{'EndStateBlock', 'uint32_t*'};
			{'PreLoad', 'IDirectDrawSurface7*'};
			{'DrawPrimitive', 'D3Denum, uint32_t, void*, uint32_t, uint32_t'};
			{'DrawIndexedPrimitive', 'D3Denum, uint32_t, void*, uint32_t, uint16_t*, uint32_t, uint32_t'};
			{'SetClipStatus', 'D3DCLIPSTATUS*'};
			{'GetClipStatus', 'D3DCLIPSTATUS*'};
			{'DrawPrimitiveStrided', 'D3Denum, uint32_t, D3DDRAWPRIMITIVESTRIDEDDATA*, uint32_t, uint32_t'};
			{'DrawIndexedPrimitiveStrided', 'D3Denum, uint32_t, D3DDRAWPRIMITIVESTRIDEDDATA*, uint32_t, uint16_t*, uint32_t, uint32_t'};
			{'DrawPrimitiveVB', 'D3Denum, IDirect3DVertexBuffer7*, uint32_t, uint32_t, uint32_t'};
			{'DrawIndexedPrimitiveVB', 'D3Denum, IDirect3DVertexBuffer7*, uint32_t, uint32_t, uint16_t*, uint32_t, uint32_t'};
			{'ComputeSphereVisibility', 'D3DVECTOR*, float*, uint32_t, uint32_t, uint32_t*'};
			{'GetTexture', 'uint32_t, IDirectDrawSurface7**'};
			{'SetTexture', 'uint32_t, IDirectDrawSurface7*'};
			{'GetTextureStageState', 'uint32_t, D3Denum, uint32_t*'};
			{'SetTextureStageState', 'uint32_t, D3Denum, uint32_t'};
			{'ValidateDevice', 'uint32_t*'};
			{'ApplyStateBlock', 'uint32_t'};
			{'CaptureStateBlock', 'uint32_t'};
			{'DeleteStateBlock', 'uint32_t'};
			{'CreateStateBlock', 'D3Denum, uint32_t*'};
			{'Load', 'IDirectDrawSurface7*, POINT*, IDirectDrawSurface7*, RECT*, uint32_t'};
			{'LightEnable', 'uint32_t, bool32'};
			{'GetLightEnable', 'uint32_t, bool32*'};
			{'SetClipPlane', 'uint32_t, float*'};
			{'GetClipPlane', 'uint32_t, float*'};
			{'GetInfo', 'uint32_t, void*, uint32_t'};
		};
		iid = 'f5049e79-4861-11d2-a407-00a0c90629a8';
	};
	{'IDirect3DVertexBuffer7';
		methods = {
			{'Lock', 'uint32_t, void**, uint32_t*'};
			{'Unlock'};
			{'ProcessVertices', 'uint32_t, uint32_t, uint32_t, IDirect3DVertexBuffer7*, uint32_t, IDirect3DDevice7*, uint32_t'};
			{'GetVertexBufferDesc', 'D3DVERTEXBUFFERDESC*'};
			{'Optimize', 'IDirect3DDevice7*, uint32_t'};
			{'ProcessVerticesStrided', 'uint32_t, uint32_t, uint32_t, D3DDRAWPRIMITIVESTRIDEDDATA*, uint32_t, IDirect3DDevice7*, uint32_t'};
		};
		iid = 'f5049e7d-4861-11d2-a407-00a0c90629a8';
	};
}

return ddraw
