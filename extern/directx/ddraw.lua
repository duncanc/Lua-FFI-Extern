
local ffi = require 'ffi'
local mswindows = require 'extern.mswindows'
local com = require 'extern.mswindows.com'

ffi.cdef [[

	typedef uint32_t DDenum;

	enum {
		DDBD_1 = 0x00004000,
		DDBD_16 = 0x00000400,
		DDBD_2 = 0x00002000,
		DDBD_24 = 0X00000200,
		DDBD_32 = 0x00000100,
		DDBD_4 = 0x00001000,
		DDBD_8 = 0x00000800,
		DDBLTFAST_DESTCOLORKEY = 0x00000002,
		DDBLTFAST_DONOTWAIT = 0x00000020,
		DDBLTFAST_NOCOLORKEY = 0x00000000,
		DDBLTFAST_SRCCOLORKEY = 0x00000001,
		DDBLTFAST_WAIT = 0x00000010,
		DDBLTFX_ARITHSTRETCHY = 0x00000001,
		DDBLTFX_MIRRORLEFTRIGHT = 0x00000002,
		DDBLTFX_MIRRORUPDOWN = 0x00000004,
		DDBLTFX_NOTEARING = 0x00000008,
		DDBLTFX_ROTATE180 = 0x00000010,
		DDBLTFX_ROTATE270 = 0x00000020,
		DDBLTFX_ROTATE90 = 0x00000040,
		DDBLTFX_ZBUFFERBASEDEST = 0x00000100,
		DDBLTFX_ZBUFFERRANGE = 0x00000080,
		DDBLT_ALPHADEST = 0x00000001,
		DDBLT_ALPHADESTCONSTOVERRIDE = 0x00000002,
		DDBLT_ALPHADESTNEG = 0x00000004,
		DDBLT_ALPHADESTSURFACEOVERRIDE = 0x00000008,
		DDBLT_ALPHAEDGEBLEND = 0x00000010,
		DDBLT_ALPHASRC = 0x00000020,
		DDBLT_ALPHASRCCONSTOVERRIDE = 0x00000040,
		DDBLT_ALPHASRCNEG = 0x00000080,
		DDBLT_ALPHASRCSURFACEOVERRIDE = 0x00000100,
		DDBLT_ASYNC = 0x00000200,
		DDBLT_COLORFILL = 0x00000400,
		DDBLT_DDFX = 0x00000800,
		DDBLT_DDROPS = 0x00001000,
		DDBLT_DEPTHFILL = 0x02000000,
		DDBLT_DONOTWAIT = 0x08000000,
		DDBLT_KEYDEST = 0x00002000,
		DDBLT_KEYDESTOVERRIDE = 0x00004000,
		DDBLT_KEYSRC = 0x00008000,
		DDBLT_KEYSRCOVERRIDE = 0x00010000,
		DDBLT_LAST_PRESENTATION = 0x20000000,
		DDBLT_PRESENTATION = 0x10000000,
		DDBLT_ROP = 0x00020000,
		DDBLT_ROTATIONANGLE = 0x00040000,
		DDBLT_WAIT = 0x01000000,
		DDBLT_ZBUFFER = 0x00080000,
		DDBLT_ZBUFFERDESTCONSTOVERRIDE = 0x00100000,
		DDBLT_ZBUFFERDESTOVERRIDE = 0x00200000,
		DDBLT_ZBUFFERSRCCONSTOVERRIDE = 0x00400000,
		DDBLT_ZBUFFERSRCOVERRIDE = 0x00800000,
		DDCAPS2_AUTOFLIPOVERLAY = 0x00000008,
		DDCAPS2_CANBOBHARDWARE = 0x00004000,
		DDCAPS2_CANBOBINTERLEAVED = 0x00000010,
		DDCAPS2_CANBOBNONINTERLEAVED = 0x00000020,
		DDCAPS2_CANCALIBRATEGAMMA = 0x00100000,
		DDCAPS2_CANDROPZ16BIT = 0x00000100,
		DDCAPS2_CANFLIPODDEVEN = 0x00002000,
		DDCAPS2_CANMANAGERESOURCE = 0x10000000,
		DDCAPS2_CANMANAGETEXTURE = 0x00800000,
		DDCAPS2_CANRENDERWINDOWED = 0x00080000,
		DDCAPS2_CERTIFIED = 0x00000001,
		DDCAPS2_COLORCONTROLOVERLAY = 0x00000040,
		DDCAPS2_COLORCONTROLPRIMARY = 0x00000080,
		DDCAPS2_COPYFOURCC = 0x00008000,
		DDCAPS2_DYNAMICTEXTURES = 0x20000000,
		DDCAPS2_FLIPINTERVAL = 0x00200000,
		DDCAPS2_FLIPNOVSYNC = 0x00400000,
		DDCAPS2_NO2DDURING3DSCENE = 0x00000002,
		DDCAPS2_NONLOCALVIDMEM = 0x00000200,
		DDCAPS2_NONLOCALVIDMEMCAPS = 0x00000400,
		DDCAPS2_NOPAGELOCKREQUIRED = 0x00000800,
		DDCAPS2_PRIMARYGAMMA = 0x00020000,
		DDCAPS2_RESERVED1 = 0x08000000,
		DDCAPS2_STEREO = 0x02000000,
		DDCAPS2_SYSTONONLOCAL_AS_SYSTOLOCAL = 0x04000000,
		DDCAPS2_TEXMANINNONLOCALVIDMEM = 0x01000000,
		DDCAPS2_VIDEOPORT = 0x00000004,
		DDCAPS2_WIDESURFACES = 0x00001000,
		DDCAPS_3D = 0x00000001,
		DDCAPS_ALIGNBOUNDARYDEST = 0x00000002,
		DDCAPS_ALIGNBOUNDARYSRC = 0x00000008,
		DDCAPS_ALIGNSIZEDEST = 0x00000004,
		DDCAPS_ALIGNSIZESRC = 0x00000010,
		DDCAPS_ALIGNSTRIDE = 0x00000020,
		DDCAPS_ALPHA = 0x00800000,
		DDCAPS_BANKSWITCHED = 0x08000000,
		DDCAPS_BLT = 0x00000040,
		DDCAPS_BLTCOLORFILL = 0x04000000,
		DDCAPS_BLTDEPTHFILL = 0x10000000,
		DDCAPS_BLTFOURCC = 0x00000100,
		DDCAPS_BLTQUEUE = 0x00000080,
		DDCAPS_BLTSTRETCH = 0x00000200,
		DDCAPS_CANBLTSYSMEM = 0x80000000,
		DDCAPS_CANCLIP = 0x20000000,
		DDCAPS_CANCLIPSTRETCHED = 0x40000000,
		DDCAPS_COLORKEY = 0x00400000,
		DDCAPS_COLORKEYHWASSIST = 0x01000000,
		DDCAPS_GDI = 0x00000400,
		DDCAPS_NOHARDWARE = 0x02000000,
		DDCAPS_OVERLAY = 0x00000800,
		DDCAPS_OVERLAYCANTCLIP = 0x00001000,
		DDCAPS_OVERLAYFOURCC = 0x00002000,
		DDCAPS_OVERLAYSTRETCH = 0x00004000,
		DDCAPS_PALETTE = 0x00008000,
		DDCAPS_PALETTEVSYNC = 0x00010000,
		DDCAPS_READSCANLINE = 0x00020000,
		DDCAPS_RESERVED1 = 0x00040000,
		DDCAPS_VBI = 0x00080000,
		DDCAPS_ZBLTS = 0x00100000,
		DDCAPS_ZOVERLAYS = 0x00200000,
		DDCKEYCAPS_DESTBLT = 0x00000001,
		DDCKEYCAPS_DESTBLTCLRSPACE = 0x00000002,
		DDCKEYCAPS_DESTBLTCLRSPACEYUV = 0x00000004,
		DDCKEYCAPS_DESTBLTYUV = 0x00000008,
		DDCKEYCAPS_DESTOVERLAY = 0x00000010,
		DDCKEYCAPS_DESTOVERLAYCLRSPACE = 0x00000020,
		DDCKEYCAPS_DESTOVERLAYCLRSPACEYUV = 0x00000040,
		DDCKEYCAPS_DESTOVERLAYONEACTIVE = 0x00000080,
		DDCKEYCAPS_DESTOVERLAYYUV = 0x00000100,
		DDCKEYCAPS_NOCOSTOVERLAY = 0x00040000,
		DDCKEYCAPS_SRCBLT = 0x00000200,
		DDCKEYCAPS_SRCBLTCLRSPACE = 0x00000400,
		DDCKEYCAPS_SRCBLTCLRSPACEYUV = 0x00000800,
		DDCKEYCAPS_SRCBLTYUV = 0x00001000,
		DDCKEYCAPS_SRCOVERLAY = 0x00002000,
		DDCKEYCAPS_SRCOVERLAYCLRSPACE = 0x00004000,
		DDCKEYCAPS_SRCOVERLAYCLRSPACEYUV = 0x00008000,
		DDCKEYCAPS_SRCOVERLAYONEACTIVE = 0x00010000,
		DDCKEYCAPS_SRCOVERLAYYUV = 0x00020000,
		DDCKEY_COLORSPACE = 0x00000001,
		DDCKEY_DESTBLT = 0x00000002,
		DDCKEY_DESTOVERLAY = 0x00000004,
		DDCKEY_SRCBLT = 0x00000008,
		DDCKEY_SRCOVERLAY = 0x00000010,
		DDCOLOR_BRIGHTNESS = 0x00000001,
		DDCOLOR_COLORENABLE = 0x00000040,
		DDCOLOR_CONTRAST = 0x00000002,
		DDCOLOR_GAMMA = 0x00000020,
		DDCOLOR_HUE = 0x00000004,
		DDCOLOR_SATURATION = 0x00000008,
		DDCOLOR_SHARPNESS = 0x00000010,
		DDCREATE_EMULATIONONLY = 0x00000002,
		DDCREATE_HARDWAREONLY = 0x00000001,
		DDEDM_REFRESHRATES = 0x00000001,
		DDEDM_STANDARDVGAMODES = 0x00000002,
		DDEM_MODEFAILED = 0x00000002,
		DDEM_MODEPASSED = 0x00000001,
		DDENUMOVERLAYZ_BACKTOFRONT = 0x00000000,
		DDENUMOVERLAYZ_FRONTTOBACK = 0x00000001,
		DDENUMRET_CANCEL = 0,
		DDENUMRET_OK = 1,
		DDENUMSURFACES_ALL = 0x00000001,
		DDENUMSURFACES_CANBECREATED = 0x00000008,
		DDENUMSURFACES_DOESEXIST = 0x00000010,
		DDENUMSURFACES_MATCH = 0x00000002,
		DDENUMSURFACES_NOMATCH = 0x00000004,
		DDENUM_ATTACHEDSECONDARYDEVICES = 0x00000001,
		DDENUM_DETACHEDSECONDARYDEVICES = 0x00000002,
		DDENUM_NONDISPLAYDEVICES = 0x00000004,
		DDERR_ALREADYINITIALIZED = 0x88760005,
		DDERR_BLTFASTCANTCLIP = 0x8876023E,
		DDERR_CANNOTATTACHSURFACE = 0x8876000A,
		DDERR_CANNOTDETACHSURFACE = 0x88760014,
		DDERR_CANTCREATEDC = 0x88760249,
		DDERR_CANTDUPLICATE = 0x88760247,
		DDERR_CANTLOCKSURFACE = 0x887601B3,
		DDERR_CANTPAGELOCK = 0x88760280,
		DDERR_CANTPAGEUNLOCK = 0x88760294,
		DDERR_CLIPPERISUSINGHWND = 0x88760237,
		DDERR_COLORKEYNOTSET = 0x88760190,
		DDERR_CURRENTLYNOTAVAIL = 0x88760028,
		DDERR_D3DNOTINITIALIZED = 0x887602B6,
		DDERR_DCALREADYCREATED = 0x8876026C,
		DDERR_DDSCAPSCOMPLEXREQUIRED = 0x8876021E,
		DDERR_DEVICEDOESNTOWNSURFACE = 0x887602BB,
		DDERR_DIRECTDRAWALREADYCREATED = 0x88760232,
		DDERR_EXCEPTION = 0x88760037,
		DDERR_EXCLUSIVEMODEALREADYSET = 0x88760245,
		DDERR_EXPIRED = 0x887602B3,
		DDERR_GENERIC = 0x80004005,
		DDERR_HEIGHTALIGN = 0x8876005A,
		DDERR_HWNDALREADYSET = 0x8876023B,
		DDERR_HWNDSUBCLASSED = 0x8876023A,
		DDERR_IMPLICITLYCREATED = 0x8876024C,
		DDERR_INCOMPATIBLEPRIMARY = 0x8876005F,
		DDERR_INVALIDCAPS = 0x88760064,
		DDERR_INVALIDCLIPLIST = 0x8876006E,
		DDERR_INVALIDDIRECTDRAWGUID = 0x88760231,
		DDERR_INVALIDMODE = 0x88760078,
		DDERR_INVALIDOBJECT = 0x88760082,
		DDERR_INVALIDPARAMS = 0x80070057,
		DDERR_INVALIDPIXELFORMAT = 0x88760091,
		DDERR_INVALIDPOSITION = 0x88760243,
		DDERR_INVALIDRECT = 0x88760096,
		DDERR_INVALIDSTREAM = 0x88760209,
		DDERR_INVALIDSURFACETYPE = 0x88760250,
		DDERR_LOCKEDSURFACES = 0x887600A0,
		DDERR_MOREDATA = 0x887602B2,
		DDERR_NEWMODE = 0x887602B5,
		DDERR_NO3D = 0x887600AA,
		DDERR_NOALPHAHW = 0x887600B4,
		DDERR_NOBLTHW = 0x8876023F,
		DDERR_NOCLIPLIST = 0x887600CD,
		DDERR_NOCLIPPERATTACHED = 0x88760238,
		DDERR_NOCOLORCONVHW = 0x887600D2,
		DDERR_NOCOLORKEY = 0x887600D7,
		DDERR_NOCOLORKEYHW = 0x887600DC,
		DDERR_NOCOOPERATIVELEVELSET = 0x887600D4,
		DDERR_NODC = 0x8876024A,
		DDERR_NODDROPSHW = 0x88760240,
		DDERR_NODIRECTDRAWHW = 0x88760233,
		DDERR_NODIRECTDRAWSUPPORT = 0x887600DE,
		DDERR_NODRIVERSUPPORT = 0x887602B9,
		DDERR_NOEMULATION = 0x88760235,
		DDERR_NOEXCLUSIVEMODE = 0x887600E1,
		DDERR_NOFLIPHW = 0x887600E6,
		DDERR_NOFOCUSWINDOW = 0x8876025A,
		DDERR_NOGDI = 0x887600F0,
		DDERR_NOHWND = 0x88760239,
		DDERR_NOMIPMAPHW = 0x8876024F,
		DDERR_NOMIRRORHW = 0x887600FA,
		DDERR_NOMONITORINFORMATION = 0x887602B8,
		DDERR_NONONLOCALVIDMEM = 0x88760276,
		DDERR_NOOPTIMIZEHW = 0x88760258,
		DDERR_NOOVERLAYDEST = 0x88760242,
		DDERR_NOOVERLAYHW = 0x88760104,
		DDERR_NOPALETTEATTACHED = 0x8876023C,
		DDERR_NOPALETTEHW = 0x8876023D,
		DDERR_NORASTEROPHW = 0x88760118,
		DDERR_NOROTATIONHW = 0x88760122,
		DDERR_NOSTEREOHARDWARE = 0x887600B5,
		DDERR_NOSTRETCHHW = 0x88760136,
		DDERR_NOSURFACELEFT = 0x887600B6,
		DDERR_NOT4BITCOLOR = 0x8876013C,
		DDERR_NOT4BITCOLORINDEX = 0x8876013D,
		DDERR_NOT8BITCOLOR = 0x88760140,
		DDERR_NOTAOVERLAYSURFACE = 0x88760244,
		DDERR_NOTEXTUREHW = 0x8876014A,
		DDERR_NOTFLIPPABLE = 0x88760246,
		DDERR_NOTFOUND = 0x887600FF,
		DDERR_NOTINITIALIZED = 0x800401F0,
		DDERR_NOTLOADED = 0x88760259,
		DDERR_NOTLOCKED = 0x88760248,
		DDERR_NOTONMIPMAPSUBLEVEL = 0x8876025B,
		DDERR_NOTPAGELOCKED = 0x887602A8,
		DDERR_NOTPALETTIZED = 0x8876024D,
		DDERR_NOVSYNCHW = 0x8876014F,
		DDERR_NOZBUFFERHW = 0x88760154,
		DDERR_NOZOVERLAYHW = 0x8876015E,
		DDERR_OUTOFCAPS = 0x88760168,
		DDERR_OUTOFMEMORY = 0x8007000E,
		DDERR_OUTOFVIDEOMEMORY = 0x8876017C,
		DDERR_OVERLAPPINGRECTS = 0x8876010E,
		DDERR_OVERLAYCANTCLIP = 0x8876017E,
		DDERR_OVERLAYCOLORKEYONLYONEACTIVE = 0x88760180,
		DDERR_OVERLAYNOTVISIBLE = 0x88760241,
		DDERR_PALETTEBUSY = 0x88760183,
		DDERR_PRIMARYSURFACEALREADYEXISTS = 0x88760234,
		DDERR_REGIONTOOSMALL = 0x88760236,
		DDERR_SURFACEALREADYATTACHED = 0x8876019A,
		DDERR_SURFACEALREADYDEPENDENT = 0x887601A4,
		DDERR_SURFACEBUSY = 0x887601AE,
		DDERR_SURFACEISOBSCURED = 0x887601B8,
		DDERR_SURFACELOST = 0x887601C2,
		DDERR_SURFACENOTATTACHED = 0x887601CC,
		DDERR_TESTFINISHED = 0x887602B4,
		DDERR_TOOBIGHEIGHT = 0x887601D6,
		DDERR_TOOBIGSIZE = 0x887601E0,
		DDERR_TOOBIGWIDTH = 0x887601EA,
		DDERR_UNSUPPORTED = 0x80004001,
		DDERR_UNSUPPORTEDFORMAT = 0x887601FE,
		DDERR_UNSUPPORTEDMASK = 0x88760208,
		DDERR_UNSUPPORTEDMODE = 0x8876024E,
		DDERR_VERTICALBLANKINPROGRESS = 0x88760219,
		DDERR_VIDEONOTACTIVE = 0x887602B7,
		DDERR_WASSTILLDRAWING = 0x8876021C,
		DDERR_WRONGMODE = 0x8876024B,
		DDERR_XALIGN = 0x88760230,
		DDFLIP_DONOTWAIT = 0x00000020,
		DDFLIP_EVEN = 0x00000002,
		DDFLIP_INTERVAL2 = 0x02000000,
		DDFLIP_INTERVAL3 = 0x03000000,
		DDFLIP_INTERVAL4 = 0x04000000,
		DDFLIP_NOVSYNC = 0x00000008,
		DDFLIP_ODD = 0x00000004,
		DDFLIP_STEREO = 0x00000010,
		DDFLIP_WAIT = 0x00000001,
		DDFXALPHACAPS_BLTALPHAEDGEBLEND = 0x00000001,
		DDFXALPHACAPS_BLTALPHAPIXELS = 0x00000002,
		DDFXALPHACAPS_BLTALPHAPIXELSNEG = 0x00000004,
		DDFXALPHACAPS_BLTALPHASURFACES = 0x00000008,
		DDFXALPHACAPS_BLTALPHASURFACESNEG = 0x00000010,
		DDFXALPHACAPS_OVERLAYALPHAEDGEBLEND = 0x00000020,
		DDFXALPHACAPS_OVERLAYALPHAPIXELS = 0x00000040,
		DDFXALPHACAPS_OVERLAYALPHAPIXELSNEG = 0x00000080,
		DDFXALPHACAPS_OVERLAYALPHASURFACES = 0x00000100,
		DDFXALPHACAPS_OVERLAYALPHASURFACESNEG = 0x00000200,
		DDFXCAPS_BLTALPHA = 0x00000001,
		DDFXCAPS_BLTARITHSTRETCHY = 0x00000020,
		DDFXCAPS_BLTARITHSTRETCHYN = 0x00000010,
		DDFXCAPS_BLTFILTER = DDFXCAPS_BLTARITHSTRETCHY,
		DDFXCAPS_BLTMIRRORLEFTRIGHT = 0x00000040,
		DDFXCAPS_BLTMIRRORUPDOWN = 0x00000080,
		DDFXCAPS_BLTROTATION = 0x00000100,
		DDFXCAPS_BLTROTATION90 = 0x00000200,
		DDFXCAPS_BLTSHRINKX = 0x00000400,
		DDFXCAPS_BLTSHRINKXN = 0x00000800,
		DDFXCAPS_BLTSHRINKY = 0x00001000,
		DDFXCAPS_BLTSHRINKYN = 0x00002000,
		DDFXCAPS_BLTSTRETCHX = 0x00004000,
		DDFXCAPS_BLTSTRETCHXN = 0x00008000,
		DDFXCAPS_BLTSTRETCHY = 0x00010000,
		DDFXCAPS_BLTSTRETCHYN = 0x00020000,
		DDFXCAPS_OVERLAYALPHA = 0x00000004,
		DDFXCAPS_OVERLAYARITHSTRETCHY = 0x00040000,
		DDFXCAPS_OVERLAYARITHSTRETCHYN = 0x00000008,
		DDFXCAPS_OVERLAYDEINTERLACE = 0x20000000,
		DDFXCAPS_OVERLAYFILTER = DDFXCAPS_OVERLAYARITHSTRETCHY,
		DDFXCAPS_OVERLAYMIRRORLEFTRIGHT = 0x08000000,
		DDFXCAPS_OVERLAYMIRRORUPDOWN = 0x10000000,
		DDFXCAPS_OVERLAYSHRINKX = 0x00080000,
		DDFXCAPS_OVERLAYSHRINKXN = 0x00100000,
		DDFXCAPS_OVERLAYSHRINKY = 0x00200000,
		DDFXCAPS_OVERLAYSHRINKYN = 0x00400000,
		DDFXCAPS_OVERLAYSTRETCHX = 0x00800000,
		DDFXCAPS_OVERLAYSTRETCHXN = 0x01000000,
		DDFXCAPS_OVERLAYSTRETCHY = 0x02000000,
		DDFXCAPS_OVERLAYSTRETCHYN = 0x04000000,
		DDGBS_CANBLT = 0x00000001,
		DDGBS_ISBLTDONE = 0x00000002,
		DDGDI_GETHOSTIDENTIFIER = 0x00000001,
		DDGFS_CANFLIP = 0x00000001,
		DDGFS_ISFLIPDONE = 0x00000002,
		DDLOCK_DISCARDCONTENTS = 0x00002000,
		DDLOCK_DONOTWAIT = 0x00004000,
		DDLOCK_EVENT = 0x00000002,
		DDLOCK_HASVOLUMETEXTUREBOXRECT = 0x00008000,
		DDLOCK_NODIRTYUPDATE = 0x00010000,
		DDLOCK_NOOVERWRITE = 0x00001000,
		DDLOCK_NOSYSLOCK = 0x00000800,
		DDLOCK_OKTOSWAP = 0x00002000,
		DDLOCK_READONLY = 0x00000010,
		DDLOCK_SURFACEMEMORYPTR = 0x00000000,
		DDLOCK_WAIT = 0x00000001,
		DDLOCK_WRITEONLY = 0x00000020,
		DDOSDCAPS_MONOLITHICMIPMAP = 0x00000004,
		DDOSDCAPS_OPTCOMPRESSED = 0x00000001,
		DDOSDCAPS_OPTREORDERED = 0x00000002,
		DDOSDCAPS_VALIDOSCAPS = 0x00000007,
		DDOSDCAPS_VALIDSCAPS = 0x30004800,
		DDOSD_ALL = 0x0000000f,
		DDOSD_COMPRESSION_RATIO = 0x00000002,
		DDOSD_GUID = 0x00000001,
		DDOSD_OSCAPS = 0x00000008,
		DDOSD_SCAPS = 0x00000004,
		DDOVERFX_ARITHSTRETCHY = 0x00000001,
		DDOVERFX_DEINTERLACE = 0x00000008,
		DDOVERFX_MIRRORLEFTRIGHT = 0x00000002,
		DDOVERFX_MIRRORUPDOWN = 0x00000004,
		DDOVERZ_INSERTINBACKOF = 0x00000005,
		DDOVERZ_INSERTINFRONTOF = 0x00000004,
		DDOVERZ_MOVEBACKWARD = 0x00000003,
		DDOVERZ_MOVEFORWARD = 0x00000002,
		DDOVERZ_SENDTOBACK = 0x00000001,
		DDOVERZ_SENDTOFRONT = 0x00000000,
		DDOVER_ADDDIRTYRECT = 0x00008000,
		DDOVER_ALPHADEST = 0x00000001,
		DDOVER_ALPHADESTCONSTOVERRIDE = 0x00000002,
		DDOVER_ALPHADESTNEG = 0x00000004,
		DDOVER_ALPHADESTSURFACEOVERRIDE = 0x00000008,
		DDOVER_ALPHAEDGEBLEND = 0x00000010,
		DDOVER_ALPHASRC = 0x00000020,
		DDOVER_ALPHASRCCONSTOVERRIDE = 0x00000040,
		DDOVER_ALPHASRCNEG = 0x00000080,
		DDOVER_ALPHASRCSURFACEOVERRIDE = 0x00000100,
		DDOVER_ARGBSCALEFACTORS = 0x02000000,
		DDOVER_AUTOFLIP = 0x00100000,
		DDOVER_BOB = 0x00200000,
		DDOVER_BOBHARDWARE = 0x01000000,
		DDOVER_DDFX = 0x00080000,
		DDOVER_DEGRADEARGBSCALING = 0x04000000,
		DDOVER_HIDE = 0x00000200,
		DDOVER_INTERLEAVED = 0x00800000,
		DDOVER_KEYDEST = 0x00000400,
		DDOVER_KEYDESTOVERRIDE = 0x00000800,
		DDOVER_KEYSRC = 0x00001000,
		DDOVER_KEYSRCOVERRIDE = 0x00002000,
		DDOVER_OVERRIDEBOBWEAVE = 0x00400000,
		DDOVER_REFRESHALL = 0x00020000,
		DDOVER_REFRESHDIRTYRECTS = 0x00010000,
		DDOVER_SHOW = 0x00004000,
		DDPCAPS_1BIT = 0x00000100,
		DDPCAPS_2BIT = 0x00000200,
		DDPCAPS_4BIT = 0x00000001,
		DDPCAPS_8BIT = 0x00000004,
		DDPCAPS_8BITENTRIES = 0x00000002,
		DDPCAPS_ALLOW256 = 0x00000040,
		DDPCAPS_ALPHA = 0x00000400,
		DDPCAPS_INITIALIZE = 0x00000000,
		DDPCAPS_PRIMARYSURFACE = 0x00000010,
		DDPCAPS_PRIMARYSURFACELEFT = 0x00000020,
		DDPCAPS_VSYNC = 0x00000080,
		DDPF_ALPHA = 0x00000002,
		DDPF_ALPHAPIXELS = 0x00000001,
		DDPF_ALPHAPREMULT = 0x00008000,
		DDPF_BUMPDUDV = 0x00080000,
		DDPF_BUMPLUMINANCE = 0x00040000,
		DDPF_COMPRESSED = 0x00000080,
		DDPF_FOURCC = 0x00000004,
		DDPF_LUMINANCE = 0x00020000,
		DDPF_PALETTEINDEXED1 = 0x00000800,
		DDPF_PALETTEINDEXED2 = 0x00001000,
		DDPF_PALETTEINDEXED4 = 0x00000008,
		DDPF_PALETTEINDEXED8 = 0x00000020,
		DDPF_PALETTEINDEXEDTO8 = 0x00000010,
		DDPF_RGB = 0x00000040,
		DDPF_RGBTOYUV = 0x00000100,
		DDPF_STENCILBUFFER = 0x00004000,
		DDPF_YUV = 0x00000200,
		DDPF_ZBUFFER = 0x00000400,
		DDPF_ZPIXELS = 0x00002000,
		DDSCAPS2_CUBEMAP = 0x00000200,
		DDSCAPS2_CUBEMAP_ALLFACES = 0x0000FC00,
		DDSCAPS2_CUBEMAP_NEGATIVEX = 0x00000800,
		DDSCAPS2_CUBEMAP_NEGATIVEY = 0x00002000,
		DDSCAPS2_CUBEMAP_NEGATIVEZ = 0x00008000,
		DDSCAPS2_CUBEMAP_POSITIVEX = 0x00000400,
		DDSCAPS2_CUBEMAP_POSITIVEY = 0x00001000,
		DDSCAPS2_CUBEMAP_POSITIVEZ = 0x00004000,
		DDSCAPS2_D3DTEXTUREMANAGE = 0x00020000,
		DDSCAPS2_DISCARDBACKBUFFER = 0x10000000,
		DDSCAPS2_DONOTPERSIST = 0x00040000,
		DDSCAPS2_ENABLEALPHACHANNEL = 0x20000000,
		DDSCAPS2_HARDWAREDEINTERLACE = 0x00000000,
		DDSCAPS2_HINTANTIALIASING = 0x00000100,
		DDSCAPS2_HINTDYNAMIC = 0x00000004,
		DDSCAPS2_HINTSTATIC = 0x00000008,
		DDSCAPS2_MIPMAPSUBLEVEL = 0x00010000,
		DDSCAPS2_NOTUSERLOCKABLE = 0x00400000,
		DDSCAPS2_NPATCHES = 0x02000000,
		DDSCAPS2_OPAQUE = 0x00000080,
		DDSCAPS2_POINTS = 0x00800000,
		DDSCAPS2_RESERVED1 = 0x00000020,
		DDSCAPS2_RESERVED2 = 0x00000040,
		DDSCAPS2_RESERVED3 = 0x04000000,
		DDSCAPS2_RESERVED4 = 0x00000002,
		DDSCAPS2_RTPATCHES = 0x01000000,
		DDSCAPS2_STEREOSURFACELEFT = 0x00080000,
		DDSCAPS2_TEXTUREMANAGE = 0x00000010,
		DDSCAPS2_VOLUME = 0x00200000,
		DDSCAPS3_MULTISAMPLE_MASK = 0x0000001F,
		DDSCAPS_3DDEVICE = 0x00002000,
		DDSCAPS_ALLOCONLOAD = 0x04000000,
		DDSCAPS_ALPHA = 0x00000002,
		DDSCAPS_BACKBUFFER = 0x00000004,
		DDSCAPS_COMPLEX = 0x00000008,
		DDSCAPS_FLIP = 0x00000010,
		DDSCAPS_FRONTBUFFER = 0x00000020,
		DDSCAPS_HWCODEC = 0x00100000,
		DDSCAPS_LIVEVIDEO = 0x00080000,
		DDSCAPS_LOCALVIDMEM = 0x10000000,
		DDSCAPS_MIPMAP = 0x00400000,
		DDSCAPS_MODEX = 0x00200000,
		DDSCAPS_NONLOCALVIDMEM = 0x20000000,
		DDSCAPS_OFFSCREENPLAIN = 0x00000040,
		DDSCAPS_OPTIMIZED = 0x80000000,
		DDSCAPS_OVERLAY = 0x00000080,
		DDSCAPS_OWNDC = 0x00040000,
		DDSCAPS_PALETTE = 0x00000100,
		DDSCAPS_PRIMARYSURFACE = 0x00000200,
		DDSCAPS_PRIMARYSURFACELEFT = 0x00000000,
		DDSCAPS_RESERVED1 = 0x00000001,
		DDSCAPS_RESERVED2 = 0x00800000,
		DDSCAPS_RESERVED3 = 0x00000400,
		DDSCAPS_STANDARDVGAMODE = 0x40000000,
		DDSCAPS_SYSTEMMEMORY = 0x00000800,
		DDSCAPS_TEXTURE = 0x00001000,
		DDSCAPS_VIDEOMEMORY = 0x00004000,
		DDSCAPS_VIDEOPORT = 0x08000000,
		DDSCAPS_VISIBLE = 0x00008000,
		DDSCAPS_WRITEONLY = 0x00010000,
		DDSCAPS_ZBUFFER = 0x00020000,
		DDSCL_ALLOWMODEX = 0x00000040,
		DDSCL_ALLOWREBOOT = 0x00000002,
		DDSCL_CREATEDEVICEWINDOW = 0x00000200,
		DDSCL_EXCLUSIVE = 0x00000010,
		DDSCL_FPUPRESERVE = 0x00001000,
		DDSCL_FPUSETUP = 0x00000800,
		DDSCL_FULLSCREEN = 0x00000001,
		DDSCL_MULTITHREADED = 0x00000400,
		DDSCL_NORMAL = 0x00000008,
		DDSCL_NOWINDOWCHANGES = 0x00000004,
		DDSCL_SETDEVICEWINDOW = 0x00000100,
		DDSCL_SETFOCUSWINDOW = 0x00000080,
		DDSDM_STANDARDVGAMODE = 0x00000001,
		DDSD_ALL = 0x00fff9ee,
		DDSD_ALPHABITDEPTH = 0x00000080,
		DDSD_BACKBUFFERCOUNT = 0x00000020,
		DDSD_CAPS = 0x00000001,
		DDSD_CKDESTBLT = 0x00004000,
		DDSD_CKDESTOVERLAY = 0x00002000,
		DDSD_CKSRCBLT = 0x00010000,
		DDSD_CKSRCOVERLAY = 0x00008000,
		DDSD_DEPTH = 0x00800000,
		DDSD_FVF = 0x00200000,
		DDSD_HEIGHT = 0x00000002,
		DDSD_LINEARSIZE = 0x00080000,
		DDSD_LPSURFACE = 0x00000800,
		DDSD_MIPMAPCOUNT = 0x00020000,
		DDSD_PITCH = 0x00000008,
		DDSD_PIXELFORMAT = 0x00001000,
		DDSD_REFRESHRATE = 0x00040000,
		DDSD_SRCVBHANDLE = 0x00400000,
		DDSD_TEXTURESTAGE = 0x00100000,
		DDSD_WIDTH = 0x00000004,
		DDSD_ZBUFFERBITDEPTH = 0x00000040,
		DDSGR_CALIBRATE = 0x00000001,
		DDSMT_ISTESTREQUIRED = 0x00000001,
		DDSPD_IUNKNOWNPOINTER = 0x00000001,
		DDSPD_VOLATILE = 0x00000002,
		DDSVCAPS_RESERVED1 = 0x00000001,
		DDSVCAPS_RESERVED2 = 0x00000002,
		DDSVCAPS_RESERVED3 = 0x00000004,
		DDSVCAPS_RESERVED4 = 0x00000008,
		DDSVCAPS_STEREOSEQUENTIAL = 0x00000010,
		DDWAITVB_BLOCKBEGIN = 0x00000001,
		DDWAITVB_BLOCKBEGINEVENT = 0x00000002,
		DDWAITVB_BLOCKEND = 0x00000004,
		DD_FALSE = S_FALSE,
		DD_OK = S_OK,
		DD_ROP_SPACE = 8,
		FOURCC_DXT1 = 0x31545844,
		FOURCC_DXT2 = 0x32545844,
		FOURCC_DXT3 = 0x33545844,
		FOURCC_DXT4 = 0x34545844,
		FOURCC_DXT5 = 0x35545844,
		MAX_DDDEVICEID_STRING = 512
	};
	
]]

com.predef (
	'IDirectDraw',
	'IDirectDraw2',
	'IDirectDraw4',
	'IDirectDraw7',
	'IDirectDrawSurface',
	'IDirectDrawSurface2',
	'IDirectDrawSurface3',
	'IDirectDrawSurface4',
	'IDirectDrawSurface7',
	'IDirectDrawPalette',
	'IDirectDrawClipper',
	'IDirectDrawColorControl',
	'IDirectDrawGammaControl')

ffi.cdef [[

	typedef struct DDARGB { uint8_t blue, green, red, alpha; } DDARGB;
	typedef struct DDRGBA { uint8_t red, green, blue, alpha; } DDARGB;
	typedef struct DDCOLORKEY { uint32_t dwColorSpaceLowValue, dwColorSpaceHighValue; } DDCOLORKEY;
	
	typedef struct DDBLTFX {
		uint32_t dwSize, dwDDFX, dwROP, dwDDROP, dwRotationAngle;
    uint32_t dwZBufferOpCode, dwZBufferLow, dwZBufferHigh, dwZBufferBaseDest, dwZDestConstBitDepth;
    union {
			uint32_t dwZDestConst;
			IDirectDrawSurface* lpDDSZBufferDest;
    };
    uint32_t dwZSrcConstBitDepth;
    union {
			uint32_t dwZSrcConst;
			IDirectDrawSurface* lpDDSZBufferSrc;
    };
    uint32_t dwAlphaEdgeBlendBitDepth, dwAlphaEdgeBlend;
    uint32_t dwReserved;
    uint32_t dwAlphaDestConstBitDepth;
    union {
			uint32_t   dwAlphaDestConst;
			IDirectDrawSurface* lpDDSAlphaDest;
    };
    uint32_t dwAlphaSrcConstBitDepth;
    union {
			uint32_t dwAlphaSrcConst;
			IDirectDrawSurface* lpDDSAlphaSrc;
    };
    union {
			uint32_t dwFillColor;
			uint32_t dwFillDepth;
			uint32_t dwFillPixel;
			IDirectDrawSurface* lpDDSPattern;
    };
    DDCOLORKEY ddckDestColorkey;
    DDCOLORKEY ddckSrcColorkey;
	} DDBLTFX;

	typedef struct DDSCAPS { uint32_t dwCaps; } DDSCAPS;
  typedef struct DDOSCAPS { uint32_t dwCaps; } DDOSCAPS;
	
  typedef struct DDSCAPSEX {
    uint32_t dwCaps2, dwCaps3;
    union {
      uint32_t dwCaps4;
      uint32_t dwVolumeDepth;
    };
	} DDSCAPSEX;
	
	typedef struct DDSCAPS2 {
    uint32_t dwCaps, dwCaps2, dwCaps3;
    union {
			uint32_t       dwCaps4;
			uint32_t       dwVolumeDepth;
    };
	} DDSCAPS2;

	typedef struct DDCAPS_DX1 {
    uint32_t dwSize, dwCaps, dwCaps2, dwCKeyCaps, dwFXCaps, dwFXAlphaCaps, dwPalCaps, dwSVCaps;
    uint32_t dwAlphaBltConstBitDepths, dwAlphaBltPixelBitDepths, dwAlphaBltSurfaceBitDepths;
		uint32_t dwAlphaOverlayConstBitDepths, dwAlphaOverlayPixelBitDepths, dwAlphaOverlaySurfaceBitDepths;
    uint32_t dwZBufferBitDepths, dwVidMemTotal, dwVidMemFree, dwMaxVisibleOverlays, dwCurrVisibleOverlays;
    uint32_t dwNumFourCCCodes;
    uint32_t dwAlignBoundarySrc, dwAlignSizeSrc, dwAlignBoundaryDest, dwAlignSizeDest, dwAlignStrideAlign;
    uint32_t dwRops[DD_ROP_SPACE];
    DDSCAPS ddsCaps;
    uint32_t dwMinOverlayStretch, dwMaxOverlayStretch;
    uint32_t dwMinLiveVideoStretch, dwMaxLiveVideoStretch;
    uint32_t dwMinHwCodecStretch, dwMaxHwCodecStretch;
    uint32_t dwReserved1, dwReserved2, dwReserved3;
	} DDCAPS_DX1;

	typedef struct DDCAPS_DX3 {
    uint32_t dwSize, dwCaps, dwCaps2, dwCKeyCaps, dwFXCaps, dwFXAlphaCaps, dwPalCaps, dwSVCaps;
    uint32_t dwAlphaBltConstBitDepths, dwAlphaBltPixelBitDepths, dwAlphaBltSurfaceBitDepths;
		uint32_t dwAlphaOverlayConstBitDepths, dwAlphaOverlayPixelBitDepths, dwAlphaOverlaySurfaceBitDepths;
    uint32_t dwZBufferBitDepths, dwVidMemTotal, dwVidMemFree, dwMaxVisibleOverlays, dwCurrVisibleOverlays;
    uint32_t dwNumFourCCCodes;
    uint32_t dwAlignBoundarySrc, dwAlignSizeSrc, dwAlignBoundaryDest, dwAlignSizeDest, dwAlignStrideAlign;
		uint32_t dwRops[DD_ROP_SPACE];
		DDSCAPS ddsCaps;
    uint32_t dwMinOverlayStretch, dwMaxOverlayStretch;
    uint32_t dwMinLiveVideoStretch, dwMaxLiveVideoStretch;
    uint32_t dwMinHwCodecStretch, dwMaxHwCodecStretch;
    uint32_t dwReserved1, dwReserved2, dwReserved3;
		uint32_t dwSVBCaps, dwSVBCKeyCaps, dwSVBFXCaps, dwSVBRops[DD_ROP_SPACE];
		uint32_t dwVSBCaps, dwVSBCKeyCaps, dwVSBFXCaps, dwVSBRops[DD_ROP_SPACE];
		uint32_t dwSSBCaps, dwSSBCKeyCaps, dwSSBFXCaps, dwSSBRops[DD_ROP_SPACE];
		uint32_t dwReserved4, dwReserved5, dwReserved6;
	} DDCAPS_DX3;

	typedef struct DDCAPS_DX5 {
    uint32_t dwSize, dwCaps, dwCaps2, dwCKeyCaps, dwFXCaps, dwFXAlphaCaps, dwPalCaps, dwSVCaps;
    uint32_t dwAlphaBltConstBitDepths, dwAlphaBltPixelBitDepths, dwAlphaBltSurfaceBitDepths;
		uint32_t dwAlphaOverlayConstBitDepths, dwAlphaOverlayPixelBitDepths, dwAlphaOverlaySurfaceBitDepths;
    uint32_t dwZBufferBitDepths, dwVidMemTotal, dwVidMemFree, dwMaxVisibleOverlays, dwCurrVisibleOverlays;
    uint32_t dwNumFourCCCodes;
    uint32_t dwAlignBoundarySrc, dwAlignSizeSrc, dwAlignBoundaryDest, dwAlignSizeDest, dwAlignStrideAlign;
		uint32_t dwRops[DD_ROP_SPACE];
		DDSCAPS ddsCaps;
    uint32_t dwMinOverlayStretch, dwMaxOverlayStretch;
    uint32_t dwMinLiveVideoStretch, dwMaxLiveVideoStretch;
    uint32_t dwMinHwCodecStretch, dwMaxHwCodecStretch;
    uint32_t dwReserved1, dwReserved2, dwReserved3;
		uint32_t dwSVBCaps, dwSVBCKeyCaps, dwSVBFXCaps, dwSVBRops[DD_ROP_SPACE];
		uint32_t dwVSBCaps, dwVSBCKeyCaps, dwVSBFXCaps, dwVSBRops[DD_ROP_SPACE];
		uint32_t dwSSBCaps, dwSSBCKeyCaps, dwSSBFXCaps, dwSSBRops[DD_ROP_SPACE];
		uint32_t dwMaxVideoPorts, dwCurrVideoPorts, dwSVBCaps2;
		uint32_t dwNLVBCaps, dwNLVBCaps2, dwNLVBCKeyCaps, dwNLVBFXCaps, dwNLVBRops[DD_ROP_SPACE];
	} DDCAPS_DX5;

	typedef struct DDCAPS_DX6 {
    uint32_t dwSize, dwCaps, dwCaps2, dwCKeyCaps, dwFXCaps, dwFXAlphaCaps, dwPalCaps, dwSVCaps;
    uint32_t dwAlphaBltConstBitDepths, dwAlphaBltPixelBitDepths, dwAlphaBltSurfaceBitDepths;
		uint32_t dwAlphaOverlayConstBitDepths, dwAlphaOverlayPixelBitDepths, dwAlphaOverlaySurfaceBitDepths;
		uint32_t dwZBufferBitDepths, dwVidMemTotal, dwVidMemFree, dwMaxVisibleOverlays, dwCurrVisibleOverlays;
		uint32_t dwNumFourCCCodes;
		uint32_t dwAlignBoundarySrc, dwAlignSizeSrc, dwAlignBoundaryDest, dwAlignSizeDest, dwAlignStrideAlign;
		uint32_t dwRops[DD_ROP_SPACE];
		DDSCAPS ddsOldCaps;
		uint32_t dwMinOverlayStretch, dwMaxOverlayStretch;
		uint32_t dwMinLiveVideoStretch, dwMaxLiveVideoStretch;
		uint32_t dwMinHwCodecStretch, dwMaxHwCodecStretch;
		uint32_t dwReserved1, dwReserved2, dwReserved3;
		uint32_t dwSVBCaps, dwSVBCKeyCaps, dwSVBFXCaps, dwSVBRops[DD_ROP_SPACE];
		uint32_t dwVSBCaps, dwVSBCKeyCaps, dwVSBFXCaps, dwVSBRops[DD_ROP_SPACE];
		uint32_t dwSSBCaps, dwSSBCKeyCaps, dwSSBFXCaps, dwSSBRops[DD_ROP_SPACE];
		uint32_t dwMaxVideoPorts, dwCurrVideoPorts, dwSVBCaps2;
		uint32_t dwNLVBCaps, dwNLVBCaps2, dwNLVBCKeyCaps, dwNLVBFXCaps, dwNLVBRops[DD_ROP_SPACE];
		DDSCAPS2 ddsCaps;
	} DDCAPS_DX6;

	typedef struct DDCAPS_DX7 {
		uint32_t dwSize, dwCaps, dwCaps2, dwCKeyCaps, dwFXCaps, dwFXAlphaCaps, dwPalCaps, dwSVCaps;
		uint32_t dwAlphaBltConstBitDepths, dwAlphaBltPixelBitDepths, dwAlphaBltSurfaceBitDepths;
		uint32_t dwAlphaOverlayConstBitDepths, dwAlphaOverlayPixelBitDepths, dwAlphaOverlaySurfaceBitDepths;
		uint32_t dwZBufferBitDepths, dwVidMemTotal, dwVidMemFree, dwMaxVisibleOverlays, dwCurrVisibleOverlays;
		uint32_t dwNumFourCCCodes;
		uint32_t dwAlignBoundarySrc, dwAlignSizeSrc, dwAlignBoundaryDest, dwAlignSizeDest, dwAlignStrideAlign;
		uint32_t dwRops[DD_ROP_SPACE];
		DDSCAPS ddsOldCaps;
		uint32_t dwMinOverlayStretch, dwMaxOverlayStretch;
		uint32_t dwMinLiveVideoStretch, dwMaxLiveVideoStretch;
		uint32_t dwMinHwCodecStretch, dwMaxHwCodecStretch;
		uint32_t dwReserved1, dwReserved2, dwReserved3;
		uint32_t dwSVBCaps, dwSVBCKeyCaps, dwSVBFXCaps, dwSVBRops[DD_ROP_SPACE];
		uint32_t dwVSBCaps, dwVSBCKeyCaps, dwVSBFXCaps, dwVSBRops[DD_ROP_SPACE];
		uint32_t dwSSBCaps, dwSSBCKeyCaps, dwSSBFXCaps, dwSSBRops[DD_ROP_SPACE];
		uint32_t dwMaxVideoPorts, dwCurrVideoPorts, dwSVBCaps2;
		uint32_t dwNLVBCaps, dwNLVBCaps2, dwNLVBCKeyCaps, dwNLVBFXCaps, dwNLVBRops[DD_ROP_SPACE];
		DDSCAPS2 ddsCaps;
	} DDCAPS_DX7;

	typedef struct DDPIXELFORMAT {
    uint32_t dwSize, dwFlags, dwFourCC;
    union {
			uint32_t   dwRGBBitCount;
			uint32_t   dwYUVBitCount;
			uint32_t   dwZBufferBitDepth;
			uint32_t   dwAlphaBitDepth;
			uint32_t   dwLuminanceBitCount;
			uint32_t   dwBumpBitCount;
			uint32_t   dwPrivateFormatBitCount;
    };
    union {
			uint32_t dwRBitMask;
			uint32_t dwYBitMask;
			uint32_t dwStencilBitDepth;
			uint32_t dwLuminanceBitMask;
			uint32_t dwBumpDuBitMask;
			uint32_t dwOperations;
    };
    union {
			uint32_t dwGBitMask;
			uint32_t dwUBitMask;
			uint32_t dwZBitMask;
			uint32_t dwBumpDvBitMask;
			struct {
				uint16_t wFlipMSTypes;
				uint16_t wBltMSTypes;
			} MultiSampleCaps;
    };
    union {
			uint32_t dwBBitMask;
			uint32_t dwVBitMask;
			uint32_t dwStencilBitMask;
			uint32_t dwBumpLuminanceBitMask;
    };
    union {
			uint32_t dwRGBAlphaBitMask;
			uint32_t dwYUVAlphaBitMask;
			uint32_t dwLuminanceAlphaBitMask;
			uint32_t dwRGBZBitMask;
			uint32_t dwYUVZBitMask;
    };
	} DDPIXELFORMAT;

	typedef struct DDOVERLAYFX {
    uint32_t dwSize, dwAlphaEdgeBlendBitDepth, dwAlphaEdgeBlend;
    uint32_t dwReserved;
    uint32_t dwAlphaDestConstBitDepth;
    union {
			uint32_t dwAlphaDestConst;
			IDirectDrawSurface* lpDDSAlphaDest;
    };
    uint32_t dwAlphaSrcConstBitDepth;
    union {
			uint32_t   dwAlphaSrcConst;
			IDirectDrawSurface* lpDDSAlphaSrc;
    };
    DDCOLORKEY dckDestColorkey, dckSrcColorkey;
    uint32_t dwDDFX, dwFlags;
	} DDOVERLAYFX;

	typedef struct DDBLTBATCH {
    RECT* lprDest;
    IDirectDrawSurface* lpDDSSrc;
    RECT* lprSrc;
    uint32_t dwFlags;
    DDBLTFX* lpDDBltFx;
	} DDBLTBATCH;

	typedef struct DDGAMMARAMP { uint16_t red[256], green[256], blue[256]; } DDGAMMARAMP;

	typedef struct DDDEVICEIDENTIFIER {
    char szDriver[MAX_DDDEVICEID_STRING], szDescription[MAX_DDDEVICEID_STRING];
    int64_t liDriverVersion;      /* Defined for applications and other 32 bit components*/
    uint32_t dwVendorId, dwDeviceId, dwSubSysId, dwRevision;
    GUID guidDeviceIdentifier;
	} DDDEVICEIDENTIFIER;

	typedef struct DDDEVICEIDENTIFIER2 {
    char szDriver[MAX_DDDEVICEID_STRING], szDescription[MAX_DDDEVICEID_STRING];
		int64_t liDriverVersion;
    uint32_t dwVendorId, dwDeviceId, dwSubSysId, dwRevision;
    GUID guidDeviceIdentifier;
    uint32_t dwWHQLLevel;
	} DDDEVICEIDENTIFIER2;

	typedef struct DDSURFACEDESC {
    uint32_t dwSize, dwFlags, dwHeight, dwWidth;
    union {
			int32_t lPitch;
			uint32_t dwLinearSize;
    };
    uint32_t dwBackBufferCount;
    union {
			uint32_t dwMipMapCount;
			uint32_t dwZBufferBitDepth;
			uint32_t dwRefreshRate;
    };
    uint32_t dwAlphaBitDepth;
    uint32_t dwReserved;
    void* lpSurface;
    DDCOLORKEY ddckCKDestOverlay, ddckCKDestBlt, ddckCKSrcOverlay, ddckCKSrcBlt;
    DDPIXELFORMAT ddpfPixelFormat;
    DDSCAPS ddsCaps;
	} DDSURFACEDESC;

	typedef struct DDSURFACEDESC2 {
    uint32_t dwSize, dwFlags, dwHeight, dwWidth;
    union {
			int32_t lPitch;
			uint32_t dwLinearSize;
    };
    union {
			uint32_t dwBackBufferCount;
			uint32_t dwDepth;
    };
    union {
			uint32_t dwMipMapCount;
			uint32_t dwRefreshRate;
			uint32_t dwSrcVBHandle;
    };
    uint32_t dwAlphaBitDepth;
    uint32_t dwReserved;
    void* lpSurface;
    union {
			DDCOLORKEY ddckCKDestOverlay;
			uint32_t dwEmptyFaceColor;
    };
    DDCOLORKEY ddckCKDestBlt, ddckCKSrcOverlay, ddckCKSrcBlt;
    union {
			DDPIXELFORMAT ddpfPixelFormat;
			uint32_t dwFVF;
    };
    DDSCAPS2 ddsCaps;
    uint32_t dwTextureStage;
	} DDSURFACEDESC2;

	typedef struct DDOPTSURFACEDESC {
		uint32_t dwSize, dwFlags;
    DDSCAPS2 ddSCaps;
    DDOSCAPS ddOSCaps;
    GUID guid;
    uint32_t dwCompressionRatio;
	} DDOPTSURFACEDESC;

	typedef struct DDCOLORCONTROL {
    uint32_t dwSize, dwFlags;
    int32_t lBrightness, lContrast, lHue, lSaturation, lSharpness, lGamma, lColorEnable;
    uint32_t dwReserved1;
	} DDCOLORCONTROL;

	typedef uint32_t (*CLIPPERCALLBACK)(IDirectDrawClipper* clipper, HWND window, uint32_t code, void* context);
	typedef uint32_t (*SURFACESTREAMINGCALLBACK)(uint32_t);
	typedef int32_t (*DDENUMMODESCALLBACK)(DDSURFACEDESC*, void*);
	typedef int32_t (*DDENUMMODESCALLBACK2)(DDSURFACEDESC2*, void*);
	typedef int32_t (*DDENUMSURFACESCALLBACK)(IDirectDrawSurface*, DDSURFACEDESC*, void*);
	typedef int32_t (*DDENUMSURFACESCALLBACK2)(IDirectDrawSurface4*, DDSURFACEDESC2*, void*);
	typedef int32_t (*DDENUMSURFACESCALLBACK7)(IDirectDrawSurface7*, DDSURFACEDESC2*, void*);
	typedef bool32 (*DDENUMCALLBACKEXA)(GUID*, char*, char*, void*, HMONITOR);
	typedef bool32 (*DDENUMCALLBACKEXW)(GUID*, wchar_t*, wchar_t*, void*, HMONITOR);
	typedef int32_t (*DIRECTDRAWENUMERATEEXA)(DDENUMCALLBACKEXA* callback, void* context, uint32_t dwFlags);
	typedef int32_t (*DIRECTDRAWENUMERATEEXW)(DDENUMCALLBACKEXW* callback, void* context, uint32_t dwFlags);
	typedef bool32 (*DDENUMCALLBACKA)(GUID*, char*, char*, void*);
	typedef bool32 (*DDENUMCALLBACKW)(GUID*, wchar_t*, wchar_t*, void*);
	
	typedef struct DDCAPS DDCAPS; // cast specific versions of the caps struct to this

]]

com.CLSID_DirectDraw = mswindows.guid 'd7b70ee0-4340-11cf-b063-0020afc2cd35'
com.CLSID_DirectDraw7 = mswindows.guid '3c305196-50db-11d3-9cfe-00c04fd930c5'
com.CLSID_DirectDrawClipper = mswindows.guid '593817a0-7db3-11cf-a2de-00aa00b93356'

com.def {
	{'IDirectDraw';
		methods = {
			{'Compact'};
			{'CreateClipper', 'uint32_t, IDirectDrawClipper**, IUnknown*'};
			{'CreatePalette', 'uint32_t, PALETTEENTRY*, IDirectDrawPalette**, IUnknown*'};
			{'CreateSurface', 'DDSURFACEDESC*, IDirectDrawSurface** out_surface, IUnknown*'};
			{'DuplicateSurface', 'IDirectDrawSurface* surface, IDirectDrawSurface** out_surface'};
			{'EnumDisplayModes', 'uint32_t, DDSURFACEDESC*, void*, DDENUMMODESCALLBACK*'};
			{'EnumSurfaces', 'uint32_t, DDSURFACEDESC*, void*, DDENUMSURFACESCALLBACK*'};
			{'FlipToGDISurface'};
			{'GetCaps', 'DDCAPS*, DDCAPS*'};
			{'GetDisplayMode', 'DDSURFACEDESC*'};
			{'GetFourCCCodes', 'uint32_t*, uint32_t*'};
			{'GetGDISurface', 'IDirectDrawSurface**'};
			{'GetMonitorFrequency', 'uint32_t*'};
			{'GetScanLine', 'uint32_t*'};
			{'GetVerticalBlankStatus', 'bool32*'};
			{'Initialize', 'GUID*'};
			{'RestoreDisplayMode'};
			{'SetCooperativeLevel', 'HWND, uint32_t'};
			{'SetDisplayMode', 'uint32_t, uint32_t, uint32_t'};
			{'WaitForVerticalBlank', 'uint32_t, HANDLE'};
		};
		iid = '6c14db80-a733-11ce-a521-0020af0be560';
	};
	{'IDirectDraw2';
		-- does not inherit from IDirectDraw
		-- because SetDisplayMode() now has 2 more parameters
		methods = {
			{'Compact'};
			{'CreateClipper', 'uint32_t, IDirectDrawClipper** out_clipper, IUnknown*'};
			{'CreatePalette', 'uint32_t, PALETTEENTRY*, IDirectDrawPalette**, IUnknown*'};
			{'CreateSurface', ' DDSURFACEDESC*, IDirectDrawSurface**, IUnknown*'};
			{'DuplicateSurface', 'IDirectDrawSurface*, IDirectDrawSurface**'};
			{'EnumDisplayModes', 'uint32_t, DDSURFACEDESC*, void*, DDENUMMODESCALLBACK*'};
			{'EnumSurfaces', 'uint32_t, DDSURFACEDESC*, void*, DDENUMSURFACESCALLBACK*'};
			{'FlipToGDISurface'};
			{'GetCaps', 'DDCAPS*, DDCAPS*'};
			{'GetDisplayMode', 'DDSURFACEDESC*'};
			{'GetFourCCCodes', ' uint32_t*, uint32_t*'};
			{'GetGDISurface', 'IDirectDrawSurface**'};
			{'GetMonitorFrequency', 'uint32_t*'};
			{'GetScanLine', 'uint32_t*'};
			{'GetVerticalBlankStatus', 'bool32*'};
			{'Initialize', 'GUID*'};
			{'RestoreDisplayMode'};
			{'SetCooperativeLevel', 'HWND, uint32_t'};
			{'SetDisplayMode', 'uint32_t, uint32_t, uint32_t, uint32_t, uint32_t'}; -- 2 new params in v2
			{'WaitForVerticalBlank', 'uint32_t, HANDLE'};
			-- v2
			{'GetAvailableVidMem', 'DDSCAPS*, uint32_t*, uint32_t*'};
		};
		iid = 'b3a6f3e0-2b43-11cf-a2de-00aa00b93356';
	};
	{'IDirectDraw4';
		methods = {
			{'Compact'};
			{'CreateClipper', 'uint32_t, IDirectDrawClipper**, IUnknown*'};
			{'CreatePalette', 'uint32_t, PALETTEENTRY*, IDirectDrawPalette**, IUnknown*'};
			{'CreateSurface', ' DDSURFACEDESC2*, IDirectDrawSurface4**, IUnknown*'};
			{'DuplicateSurface', 'IDirectDrawSurface4*, IDirectDrawSurface4**'};
			{'EnumDisplayModes', 'uint32_t, DDSURFACEDESC2*, void*, DDENUMMODESCALLBACK2*'};
			{'EnumSurfaces', 'uint32_t, DDSURFACEDESC2*, void*, DDENUMSURFACESCALLBACK2*'};
			{'FlipToGDISurface'};
			{'GetCaps', 'DDCAPS*, DDCAPS*'};
			{'GetDisplayMode', 'DDSURFACEDESC2*'};
			{'GetFourCCCodes', ' uint32_t*, uint32_t*'};
			{'GetGDISurface', 'IDirectDrawSurface4**'};
			{'GetMonitorFrequency', 'uint32_t*'};
			{'GetScanLine', 'uint32_t*'};
			{'GetVerticalBlankStatus', 'bool32*'};
			{'Initialize', 'GUID*'};
			{'RestoreDisplayMode'};
			{'SetCooperativeLevel', 'HWND, uint32_t'};
			{'SetDisplayMode', 'uint32_t, uint32_t, uint32_t, uint32_t, uint32_t'};
			{'WaitForVerticalBlank', 'uint32_t, HANDLE'};
			-- v2
			{'GetAvailableVidMem', 'DDSCAPS2*, uint32_t*, uint32_t*'};
			-- v4
			{'GetSurfaceFromDC', 'HDC, IDirectDrawSurface4**'};
			{'RestoreAllSurfaces'};
			{'TestCooperativeLevel'};
			{'GetDeviceIdentifier', 'DDDEVICEIDENTIFIER*, uint32_t'};
		};
		iid = '9c59509a-39bd-11d1-8c4a-00c04fd930c5';
	};
	{'IDirectDraw7';
		methods = {
			{'Compact'};
			{'CreateClipper', 'uint32_t, IDirectDrawClipper**, IUnknown*'};
			{'CreatePalette', 'uint32_t, PALETTEENTRY*, IDirectDrawPalette**, IUnknown*'};
			{'CreateSurface', ' DDSURFACEDESC2*, IDirectDrawSurface7**, IUnknown*'};
			{'DuplicateSurface', 'IDirectDrawSurface7*, IDirectDrawSurface7**'};
			{'EnumDisplayModes', 'uint32_t, DDSURFACEDESC2*, void*, DDENUMMODESCALLBACK2*'};
			{'EnumSurfaces', 'uint32_t, DDSURFACEDESC2*, void*, DDENUMSURFACESCALLBACK7*'};
			{'FlipToGDISurface'};
			{'GetCaps', 'DDCAPS*, DDCAPS*'};
			{'GetDisplayMode', 'DDSURFACEDESC2*'};
			{'GetFourCCCodes', ' uint32_t*, uint32_t*'};
			{'GetGDISurface', 'IDirectDrawSurface7**'};
			{'GetMonitorFrequency', 'uint32_t*'};
			{'GetScanLine', 'uint32_t*'};
			{'GetVerticalBlankStatus', 'bool32*'};
			{'Initialize', 'GUID*'};
			{'RestoreDisplayMode'};
			{'SetCooperativeLevel', 'HWND, uint32_t'};
			{'SetDisplayMode', 'uint32_t, uint32_t, uint32_t, uint32_t, uint32_t'};
			{'WaitForVerticalBlank', 'uint32_t, HANDLE'};
			-- v2
			{'GetAvailableVidMem', 'DDSCAPS2*, uint32_t*, uint32_t*'};
			-- v4
			{'GetSurfaceFromDC', 'HDC, IDirectDrawSurface7**'};
			{'RestoreAllSurfaces'};
			{'TestCooperativeLevel'};
			{'GetDeviceIdentifier', 'DDDEVICEIDENTIFIER2*, uint32_t'};
			-- v7
			{'StartModeTest', 'SIZE*, uint32_t, uint32_t'};
			{'EvaluateMode', 'uint32_t, uint32_t*'};
		};
		iid = '15e65ec0-3b9c-11d2-b92f-00609797ea5b';
	};
	{'IDirectDrawSurface';
		methods = {
			{'AddAttachedSurface', 'IDirectDrawSurface*'};
			{'AddOverlayDirtyRect', 'RECT*'};
			{'Blt', 'RECT*, IDirectDrawSurface*, RECT*, uint32_t, DDBLTFX*'};
			{'BltBatch', 'DDBLTBATCH*, uint32_t, uint32_t'};
			{'BltFast', 'uint32_t, uint32_t, IDirectDrawSurface*, RECT*, uint32_t'};
			{'DeleteAttachedSurface', 'uint32_t, IDirectDrawSurface*'};
			{'EnumAttachedSurfaces', 'void*, DDENUMSURFACESCALLBACK*'};
			{'EnumOverlayZOrders', 'uint32_t, void*, DDENUMSURFACESCALLBACK*'};
			{'Flip', 'IDirectDrawSurface*, uint32_t'};
			{'GetAttachedSurface', 'DDSCAPS*, IDirectDrawSurface**'};
			{'GetBltStatus', 'uint32_t'};
			{'GetCaps', 'DDSCAPS*'};
			{'GetClipper', 'IDirectDrawClipper**'};
			{'GetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'GetDC', 'HDC*'};
			{'GetFlipStatus', 'uint32_t'};
			{'GetOverlayPosition', 'int32_t*, int32_t*'};
			{'GetPalette', 'IDirectDrawPalette**'};
			{'GetPixelFormat', 'DDPIXELFORMAT*'};
			{'GetSurfaceDesc', 'DDSURFACEDESC*'};
			{'Initialize', 'IDirectDraw*, DDSURFACEDESC*'};
			{'IsLost'};
			{'Lock', 'RECT*, DDSURFACEDESC*, uint32_t, HANDLE'};
			{'ReleaseDC', 'HDC'};
			{'Restore'};
			{'SetClipper', 'IDirectDrawClipper*'};
			{'SetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'SetOverlayPosition', 'int32_t, int32_t'};
			{'SetPalette', 'IDirectDrawPalette*'};
			{'Unlock', 'void*'};
			{'UpdateOverlay', 'RECT*, IDirectDrawSurface*, RECT*, uint32_t, DDOVERLAYFX*'};
			{'UpdateOverlayDisplay', 'uint32_t'};
			{'UpdateOverlayZOrder', 'uint32_t, IDirectDrawSurface*'};
		};
		iid = '6c14db81-a733-11ce-a521-0020af0be560';
	};
	{'IDirectDrawSurface2';
		methods = {
			{'AddAttachedSurface', 'IDirectDrawSurface2*'};
			{'AddOverlayDirtyRect', 'RECT*'};
			{'Blt', 'RECT*, IDirectDrawSurface2*, RECT*, uint32_t, DDBLTFX*'};
			{'BltBatch', 'DDBLTBATCH*, uint32_t, uint32_t'};
			{'BltFast', 'uint32_t, uint32_t, IDirectDrawSurface2*, RECT*, uint32_t'};
			{'DeleteAttachedSurface', 'uint32_t, IDirectDrawSurface2*'};
			{'EnumAttachedSurfaces', 'void*, DDENUMSURFACESCALLBACK*'};
			{'EnumOverlayZOrders', 'uint32_t, void*, DDENUMSURFACESCALLBACK*'};
			{'Flip', 'IDirectDrawSurface2*, uint32_t'};
			{'GetAttachedSurface', 'DDSCAPS*, IDirectDrawSurface2**'};
			{'GetBltStatus', 'uint32_t'};
			{'GetCaps', 'DDSCAPS*'};
			{'GetClipper', 'IDirectDrawClipper**'};
			{'GetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'GetDC', 'HDC*'};
			{'GetFlipStatus', 'uint32_t'};
			{'GetOverlayPosition', 'int32_t*, int32_t*'};
			{'GetPalette', 'IDirectDrawPalette**'};
			{'GetPixelFormat', 'DDPIXELFORMAT*'};
			{'GetSurfaceDesc', 'DDSURFACEDESC*'};
			{'Initialize', 'IDirectDraw*, DDSURFACEDESC*'};
			{'IsLost'};
			{'Lock', 'RECT*, DDSURFACEDESC*, uint32_t, HANDLE'};
			{'ReleaseDC', 'HDC'};
			{'Restore'};
			{'SetClipper', 'IDirectDrawClipper*'};
			{'SetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'SetOverlayPosition', 'int32_t, int32_t'};
			{'SetPalette', 'IDirectDrawPalette*'};
			{'Unlock', 'void*'};
			{'UpdateOverlay', 'RECT*, IDirectDrawSurface2*, RECT*, uint32_t, DDOVERLAYFX*'};
			{'UpdateOverlayDisplay', 'uint32_t'};
			{'UpdateOverlayZOrder', 'uint32_t, IDirectDrawSurface2*'};
			-- v2
			{'GetDDInterface', 'void**'};
			{'PageLock', 'uint32_t'};
			{'PageUnlock', 'uint32_t'};
		};
		iid = '57805885-6eec-11cf-9441-a82303c10e27';
	};
	{'IDirectDrawSurface3';
		methods = {
			{'AddAttachedSurface', 'IDirectDrawSurface3*'};
			{'AddOverlayDirtyRect', 'RECT*'};
			{'Blt', 'RECT*, IDirectDrawSurface3*, RECT*, uint32_t, DDBLTFX*'};
			{'BltBatch', 'DDBLTBATCH*, uint32_t, uint32_t'};
			{'BltFast', 'uint32_t, uint32_t, IDirectDrawSurface3*, RECT*, uint32_t'};
			{'DeleteAttachedSurface', 'uint32_t, IDirectDrawSurface3*'};
			{'EnumAttachedSurfaces', 'void*, DDENUMSURFACESCALLBACK*'};
			{'EnumOverlayZOrders', 'uint32_t, void*, DDENUMSURFACESCALLBACK*'};
			{'Flip', 'IDirectDrawSurface3*, uint32_t'};
			{'GetAttachedSurface', 'DDSCAPS*, IDirectDrawSurface3**'};
			{'GetBltStatus', 'uint32_t'};
			{'GetCaps', 'DDSCAPS*'};
			{'GetClipper', 'IDirectDrawClipper**'};
			{'GetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'GetDC', 'HDC*'};
			{'GetFlipStatus', 'uint32_t'};
			{'GetOverlayPosition', 'int32_t*, int32_t*'};
			{'GetPalette', 'IDirectDrawPalette**'};
			{'GetPixelFormat', 'DDPIXELFORMAT*'};
			{'GetSurfaceDesc', 'DDSURFACEDESC*'};
			{'Initialize', 'IDirectDraw*, DDSURFACEDESC*'};
			{'IsLost'};
			{'Lock', 'RECT*, DDSURFACEDESC*, uint32_t, HANDLE'};
			{'ReleaseDC', 'HDC'};
			{'Restore'};
			{'SetClipper', 'IDirectDrawClipper*'};
			{'SetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'SetOverlayPosition', 'int32_t, int32_t'};
			{'SetPalette', 'IDirectDrawPalette*'};
			{'Unlock', 'void*'};
			{'UpdateOverlay', 'RECT*, IDirectDrawSurface3*, RECT*, uint32_t, DDOVERLAYFX*'};
			{'UpdateOverlayDisplay', 'uint32_t'};
			{'UpdateOverlayZOrder', 'uint32_t, IDirectDrawSurface3*'};
			-- v2
			{'GetDDInterface', 'void**'};
			{'PageLock', 'uint32_t'};
			{'PageUnlock', 'uint32_t'};
			-- v3
			{'SetSurfaceDesc', 'DDSURFACEDESC*, uint32_t'};
		};
		iid = 'da044e00-69b2-11d0-a1d5-00aa00b8dfbb';
	};
	{'IDirectDrawSurface4';
		methods = {
			{'AddAttachedSurface', 'IDirectDrawSurface4*'};
			{'AddOverlayDirtyRect', 'RECT*'};
			{'Blt', 'RECT*, IDirectDrawSurface4*, RECT*, uint32_t, DDBLTFX*'};
			{'BltBatch', 'DDBLTBATCH*, uint32_t, uint32_t'};
			{'BltFast', 'uint32_t, uint32_t, IDirectDrawSurface4*, RECT*, uint32_t'};
			{'DeleteAttachedSurface', 'uint32_t, IDirectDrawSurface4*'};
			{'EnumAttachedSurfaces', 'void*, DDENUMSURFACESCALLBACK2*'};
			{'EnumOverlayZOrders', 'uint32_t, void*, DDENUMSURFACESCALLBACK2*'};
			{'Flip', 'IDirectDrawSurface4*, uint32_t'};
			{'GetAttachedSurface', 'DDSCAPS2*, IDirectDrawSurface4**'};
			{'GetBltStatus', 'uint32_t'};
			{'GetCaps', 'DDSCAPS2*'};
			{'GetClipper', 'IDirectDrawClipper**'};
			{'GetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'GetDC', 'HDC*'};
			{'GetFlipStatus', 'uint32_t'};
			{'GetOverlayPosition', 'int32_t*, int32_t*'};
			{'GetPalette', 'IDirectDrawPalette**'};
			{'GetPixelFormat', 'DDPIXELFORMAT*'};
			{'GetSurfaceDesc', 'DDSURFACEDESC2*'};
			{'Initialize', 'IDirectDraw*, DDSURFACEDESC2*'};
			{'IsLost'};
			{'Lock', 'RECT*, DDSURFACEDESC2*, uint32_t, HANDLE'};
			{'ReleaseDC', 'HDC'};
			{'Restore'};
			{'SetClipper', 'IDirectDrawClipper*'};
			{'SetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'SetOverlayPosition', 'int32_t, int32_t'};
			{'SetPalette', 'IDirectDrawPalette*'};
			{'Unlock', 'RECT*'};
			{'UpdateOverlay', 'RECT*, IDirectDrawSurface4*, RECT*, uint32_t, DDOVERLAYFX*'};
			{'UpdateOverlayDisplay', 'uint32_t'};
			{'UpdateOverlayZOrder', 'uint32_t, IDirectDrawSurface4*'};
			-- v2
			{'GetDDInterface', 'void**'};
			{'PageLock', 'uint32_t'};
			{'PageUnlock', 'uint32_t'};
			-- v3
			{'SetSurfaceDesc', 'DDSURFACEDESC2*, uint32_t'};
			-- v4
			{'SetPrivateData', 'GUID*, void*, uint32_t, uint32_t'};
			{'GetPrivateData', 'GUID*, void*, uint32_t*'};
			{'FreePrivateData', 'GUID*'};
			{'GetUniquenessValue', 'uint32_t*'};
			{'ChangeUniquenessValue'};
		};
		iid = '0b2b8630-ad35-11d0-8ea6-00609797ea5b';
	};
	{'IDirectDrawSurface7';
		methods = {
			{'AddAttachedSurface', 'IDirectDrawSurface7*'};
			{'AddOverlayDirtyRect', 'RECT*'};
			{'Blt', 'RECT*, IDirectDrawSurface7*, RECT*, uint32_t, DDBLTFX*'};
			{'BltBatch', 'DDBLTBATCH*, uint32_t, uint32_t'};
			{'BltFast', 'uint32_t, uint32_t, IDirectDrawSurface7*, RECT*, uint32_t'};
			{'DeleteAttachedSurface', 'uint32_t, IDirectDrawSurface7*'};
			{'EnumAttachedSurfaces', 'void*, DDENUMSURFACESCALLBACK7*'};
			{'EnumOverlayZOrders', 'uint32_t, void*, DDENUMSURFACESCALLBACK7*'};
			{'Flip', 'IDirectDrawSurface7*, uint32_t'};
			{'GetAttachedSurface', 'DDSCAPS2*, IDirectDrawSurface7**'};
			{'GetBltStatus', 'uint32_t'};
			{'GetCaps', 'DDSCAPS2*'};
			{'GetClipper', 'IDirectDrawClipper**'};
			{'GetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'GetDC', 'HDC*'};
			{'GetFlipStatus', 'uint32_t'};
			{'GetOverlayPosition', 'int32_t*, int32_t*'};
			{'GetPalette', 'IDirectDrawPalette**'};
			{'GetPixelFormat', 'DDPIXELFORMAT*'};
			{'GetSurfaceDesc', 'DDSURFACEDESC2*'};
			{'Initialize', 'IDirectDraw*, DDSURFACEDESC2*'};
			{'IsLost'};
			{'Lock', 'RECT*, DDSURFACEDESC2*, uint32_t, HANDLE'};
			{'ReleaseDC', 'HDC'};
			{'Restore'};
			{'SetClipper', 'IDirectDrawClipper*'};
			{'SetColorKey', 'uint32_t, DDCOLORKEY*'};
			{'SetOverlayPosition', 'int32_t, int32_t'};
			{'SetPalette', 'IDirectDrawPalette*'};
			{'Unlock', 'RECT*'};
			{'UpdateOverlay', 'RECT*, IDirectDrawSurface7*, RECT*, uint32_t, DDOVERLAYFX*'};
			{'UpdateOverlayDisplay', 'uint32_t'};
			{'UpdateOverlayZOrder', 'uint32_t, IDirectDrawSurface7*'};
			-- v2
			{'GetDDInterface', 'void**'};
			{'PageLock', 'uint32_t'};
			{'PageUnlock', 'uint32_t'};
			-- v3
			{'SetSurfaceDesc', 'DDSURFACEDESC2*, uint32_t'};
			-- v4
			{'SetPrivateData', 'GUID*, void*, uint32_t, uint32_t'};
			{'GetPrivateData', 'GUID*, void*, uint32_t*'};
			{'FreePrivateData', 'GUID*'};
			{'GetUniquenessValue', 'uint32_t*'};
			{'ChangeUniquenessValue'};
			-- v5
			{'SetPriority', 'uint32_t'};
			{'GetPriority', 'uint32_t*'};
			{'SetLOD', 'uint32_t'};
			{'GetLOD', 'uint32_t*'};
		};
		iid = '06675a80-3b9b-11d2-b92f-00609797ea5b';
	};
	{'IDirectDrawPalette';
		methods = {
			{'GetCaps', 'uint32_t*'};
			{'GetEntries', 'uint32_t, uint32_t, uint32_t, PALETTEENTRY*'};
			{'Initialize', 'IDirectDraw*, uint32_t, PALETTEENTRY*'};
			{'SetEntries', 'uint32_t, uint32_t, uint32_t, PALETTEENTRY*'};
		};
		iid = '6c14db84-a733-11ce-a521-0020af0be560';
	};
	{'IDirectDrawClipper';
		methods = {
			{'GetClipList', 'RECT*, RGNDATA*, uint32_t*'};
			{'GetHWnd', 'HWND* out_hwnd'};
			{'Initialize', 'IDirectDraw*, uint32_t'};
			{'IsClipListChanged', 'bool32*'};
			{'SetClipList', 'RGNDATA*, uint32_t'};
			{'SetHWnd', 'uint32_t, HWND'};
		};
		iid = '6c14db85-a733-11ce-a521-0020af0be560';
	};
	{'IDirectDrawColorControl';
		methods = {
			{'GetColorControls', 'DDCOLORCONTROL*'};
			{'SetColorControls', 'DDCOLORCONTROL*'};
		};
		iid = '4b9f0ee0-0d7e-11d0-9b06-00a0c903a3b8';
	};
	{'IDirectDrawGammaControl';
		methods = {
			{'GetGammaRamp', 'uint32_t, DDGAMMARAMP*'};
			{'SetGammaRamp', 'uint32_t, DDGAMMARAMP*'};
		};
		iid = '69c11c3e-b46b-11d1-ad7a-00c04fc29b4e';
	};
}

ffi.cdef [[

	int32_t DirectDrawCreate(GUID* guid, IDirectDraw** out_dd, IUnknown* outer);
	int32_t DirectDrawCreateEx(GUID* guid, void** out_dd, GUID* iid, IUnknown* outer);
	int32_t DirectDrawEnumerateA(DDENUMCALLBACKA callback, void* context);
	int32_t DirectDrawEnumerateW(DDENUMCALLBACKW callback, void* context);
	int32_t DirectDrawEnumerateExA(DDENUMCALLBACKEXA callback, void* context, uint32_t flags);
	int32_t DirectDrawEnumerateExW(DDENUMCALLBACKEXW callback, void* context, uint32_t flags);
	int32_t DirectDrawCreateClipper(uint32_t flags, IDirectDrawClipper** out_clipper, IUnknown* outer);

]]

return ffi.load 'ddraw'
