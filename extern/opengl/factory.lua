
local ffi = require 'ffi'

local factory = {}
do

	local loader_proto = {}
	local loader_meta = {__index = loader_proto}
	
	function loader_proto:mangleConstantName(rawName)
    return 'GL_' .. rawName
	end
	
	function loader_proto:mangleFunctionName(rawName)
    return 'gl' .. rawName
	end
	
	function loader_proto:loadPackage(package)
		for i, package in ipairs(package.inherits or {}) do
			self:loadPackage(package)
		end
		do
			local typedefs = {}
			for glType, basicType in pairs(package.basicTypes or {}) do
				if not pcall(ffi.typeof, glType) then
					typedefs[#typedefs+1] = 'typedef ' .. basicType .. ' ' .. glType .. ';'
				end
			end
			if typedefs[1] then
				ffi.cdef(table.concat(typedefs, '\r\n'))
			end
		end
		do
			for alias, glType in pairs(package.typeAliases or {}) do
				self.typeAliases[alias] = glType
			end
		end
		for constantName, constantValue in pairs(package.magicNumbers or {}) do
			self:loadConstant(constantName, constantValue)
		end
		for i, funcDef in ipairs(package.funcs or {}) do
			self:loadFunction(funcDef)
		end
	end
	
	function loader_proto:loadConstant(rawName, rawValue)
		local mangledName = self:mangleConstantName(rawName)
		self.context[mangledName] = rawValue
	end
	
	function loader_proto:loadFunction(funcDef)
		local importer = self.customImporters[funcDef[1]]
		if importer and (importer(self, funcDef) ~= 'default') then
			return
		end
		
		local func = self:importFunction(funcDef)
    
    if (funcDef.ret == 'String') then
      local _func = func
      function func(...)
        local str = ffi.string(_func(...))
        if (str == nil) then
          return nil
        else
          return str
        end
      end
    end
		
		self.context[self:mangleFunctionName(funcDef[1])] = func
	end
	
	function loader_proto:importFunction(funcDef)
		local getProcAddress = self.getProcAddress
		if getProcAddress then
			local funcName = 'gl' .. funcDef[1]
			local func = getProcAddress(funcName)
			if (func == nil) then
        return nil
			end
			local sigBuf = {self:mangleTypeName(funcDef.ret or 'void') .. ' (*)('}
			for i = 2, #funcDef, 2 do
				if (i > 2) then
					sigBuf[#sigBuf+1] = ', '
				end
				sigBuf[#sigBuf+1] = self:mangleTypeName(funcDef[i]) .. ' ' .. funcDef[i+1]
			end
			sigBuf[#sigBuf+1] = ')'
			return ffi.cast(table.concat(sigBuf), func)
		else
			if ffi.os == 'Windows' then
				local opengl32 = require 'extern.mswindows.opengl32'
				getProcAddress = opengl32.wglGetProcAddress
			end
			local library = getLibrary()
			local funcName = 'gl' .. funcDef[1]
			if getProcAddress then
				local func = getProcAddress(funcName)
				if func ~= nil then
					local sigBuf = {self:mangleTypeName(funcDef.ret or 'void') .. '(*)('}
					for i = 2, #funcDef, 2 do
						if (i > 2) then
							sigBuf[#sigBuf+1] = ', '
						end
						sigBuf[#sigBuf+1] = self:mangleTypeName(funcDef[i]) .. ' ' .. funcDef[i+1]
					end
					sigBuf[#sigBuf+1] = ')'
					return ffi.cast(table.concat(sigBuf), func)
				end
			end
			local cbuf = {self:mangleTypeName(funcDef.ret or 'void') .. ' ' .. funcName .. '('}
			for i = 2, #funcDef, 2 do
				if (i > 2) then
					cbuf[#cbuf+1] = ', '
				end
				cbuf[#cbuf+1] = self:mangleTypeName(funcDef[i]) .. ' ' .. funcDef[i+1]
			end
			cbuf[#cbuf+1] = ');'
			ffi.cdef(table.concat(cbuf))
			return library[funcName]
		end
	end
	
	function loader_proto:mangleTypeName(name)
		return name:gsub('[a-zA-Z_][a-zA-Z_0-9]*', self.typeAliases)
	end
	
	local paramTypes = {
		ACCUM_ALPHA_BITS = 'int';
		ACCUM_BLUE_BITS = 'int';
		ACCUM_CLEAR_VALUE = 'float4';
		ACCUM_GREEN_BITS = 'int';
		ACCUM_RED_BITS = 'int';
		ACTIVE_TEXTURE = 'int';
		ALIASED_POINT_SIZE_RANGE = 'float2';
		ALIASED_LINE_WIDTH_RANGE = 'float2';
		ALPHA_BIAS = 'float';
		ALPHA_BITS = 'int';
		ALPHA_SCALE = 'float';
		ALPHA_TEST = 'bool';
		ALPHA_TEST_FUNC = 'int';
		ALPHA_TEST_REF = 'float';
		ARRAY_BUFFER_BINDING = 'Buffer';
		ATTRIB_STACK_DEPTH = 'int';
		AUTO_NORMAL = 'bool';
		AUX_BUFFERS = 'int';
		BLEND = 'bool';
		BLEND_COLOR = 'float4';
		BLEND_DST_ALPHA = 'int';
		BLEND_DST_RGB = 'int';
		BLEND_EQUATION_RGB = 'int';
		BLEND_EQUATION_ALPHA = 'int';
		BLEND_SRC_ALPHA = 'int';
		BLEND_SRC_RGB = 'int';
		BLUE_BIAS = 'float';
		BLUE_BITS = 'int';
		BLUE_SCALE = 'float';
		CLIENT_ACTIVE_TEXTURE = 'int';
		CLIENT_ATTRIB_STACK_DEPTH = 'int';
		CLIP_PLANE0 = 'bool';
		CLIP_PLANE1 = 'bool';
		CLIP_PLANE2 = 'bool';
		CLIP_PLANE3 = 'bool';
		CLIP_PLANE4 = 'bool';
		CLIP_PLANE5 = 'bool';
		COLOR_ARRAY = 'bool';
		COLOR_ARRAY_BUFFER_BINDING = 'Buffer';
		COLOR_ARRAY_SIZE = 'int';
		COLOR_ARRAY_STRIDE = 'int';
		COLOR_ARRAY_TYPE = 'int';
		COLOR_CLEAR_VALUE = 'float4';
		COLOR_LOGIC_OP = 'int';
		COLOR_MATERIAL = 'bool';
		COLOR_MATERIAL_FACE = 'int';
		COLOR_MATERIAL_PARAMETER = 'int';
		COLOR_MATRIX = 'float16';
		COLOR_MATRIX_STACK_DEPTH = 'int';
		COLOR_SUM = 'bool';
		COLOR_TABLE = 'bool';
		COLOR_WRITEMASK = 'bool4';
		CONVOLUTION_1D = 'bool';
		CONVOLUTION_2D = 'bool';
		CULL_FACE = 'bool';
		CULL_FACE_MODE = 'int';
		CURRENT_COLOR = 'float4',
		CURRENT_FOG_COORD = 'float';
		CURRENT_INDEX = 'int';
		CURRENT_NORMAL = 'float3';
		CURRENT_PROGRAM = 'Program';
		CURRENT_RASTER_COLOR = 'float4';
		CURRENT_RASTER_DISTANCE = 'float';
		CURRENT_RASTER_INDEX = 'int';
		CURRENT_RASTER_POSITION = 'float4';
		CURRENT_RASTER_POSITION_VALID = 'bool';
		CURRENT_RASTER_SECONDARY_COLOR = 'float4';
		CURRENT_RASTER_TEXTURE_COORDS = 'float4';
		CURRENT_SECONDARY_COLOR = 'float4';
		CURRENT_TEXTURE_COORDS = 'float4';
		DEPTH_BIAS = 'float';
		DEPTH_BITS = 'int';
		DEPTH_CLEAR_VALUE = 'float';
		DEPTH_FUNC = 'int';
		DEPTH_RANGE = 'float2';
		DEPTH_SCALE = 'float';
		DEPTH_TEST = 'bool';
		DEPTH_WRITEMASK = 'bool';
		DITHER = 'bool';
		DOUBLEBUFFER = 'bool';
		DRAW_BUFFER0 = 'int',  DRAW_BUFFER1 = 'int',  DRAW_BUFFER2 = 'int',  DRAW_BUFFER3 = 'int';
		DRAW_BUFFER4 = 'int',  DRAW_BUFFER5 = 'int',  DRAW_BUFFER6 = 'int',  DRAW_BUFFER7 = 'int';
		DRAW_BUFFER8 = 'int',  DRAW_BUFFER9 = 'int',  DRAW_BUFFER10 = 'int', DRAW_BUFFER11 = 'int';
		DRAW_BUFFER12 = 'int', DRAW_BUFFER13 = 'int', DRAW_BUFFER14 = 'int', DRAW_BUFFER15 = 'int';
		EDGE_FLAG = 'bool';
		EDGE_FLAG_ARRAY = 'bool';
		EDGE_FLAG_ARRAY_BUFFER_BINDING = 'Buffer';
		EDGE_FLAG_ARRAY_STRIDE = 'int';
		ELEMENT_ARRAY_BUFFER_BINDING = 'Buffer';
		FEEDBACK_BUFFER_SIZE = 'int';
		FEEDBACK_BUFFER_TYPE = 'int';
		FOG = 'bool';
		FOG_COORD_ARRAY = 'bool';
		FOG_COORD_ARRAY_BUFFER_BINDING = 'Buffer';
		FOG_COORD_ARRAY_STRIDE = 'int';
		FOG_COORD_ARRAY_TYPE = 'int';
		FOG_COORD_SRC = 'int';
		FOG_COLOR = 'float4';
		FOG_DENSITY = 'float';
		FOG_END = 'float';
		FOG_HINT = 'int';
		FOG_INDEX = 'int';
		FOG_MODE = 'int';
		FOG_START = 'float';
		FRAGMENT_SHADER_DERIVATIVE_HINT = 'int';
		FRONT_FACE = 'int';
		GENERATE_MIPMAP_HINT = 'int';
		GREEN_BIAS = 'float';
		GREEN_BITS = 'int';
		GREEN_SCALE = 'float';
		HISTOGRAM = 'bool';
		INDEX_ARRAY = 'bool';
		INDEX_ARRAY_BUFFER_BINDING = 'Buffer';
		INDEX_ARRAY_STRIDE = 'int';
		INDEX_ARRAY_TYPE = 'int';
		INDEX_BITS = 'int';
		INDEX_CLEAR_VALUE = 'int';
		INDEX_LOGIC_OP = 'int';
		INDEX_MODE = 'bool';
		INDEX_OFFSET = 'int';
		INDEX_SHIFT = 'int';
		INDEX_WRITEMASK = 'int';
		LIGHT0 = 'bool', LIGHT1 = 'bool', LIGHT2 = 'bool', LIGHT3 = 'bool';
		LIGHT4 = 'bool', LIGHT5 = 'bool', LIGHT6 = 'bool', LIGHT7 = 'bool';
		LIGHTING = 'bool';
		LIGHT_MODEL_AMBIENT = 'float4';
		LIGHT_MODEL_COLOR_CONTROL = 'int';
		LIGHT_MODEL_LOCAL_VIEWER = 'bool';
		LIGHT_MODEL_TWO_SIDE = 'bool';
		LINE_SMOOTH = 'bool';
		LINE_SMOOTH_HINT = 'int';
		LINE_STIPPLE = 'bool';
		LINE_STIPPLE_PATTERN = 'int';
		LINE_STIPPLE_REPEAT = 'int';
		LINE_WIDTH = 'float';
		LINE_WIDTH_GRANULARITY = 'float';
		LINE_WIDTH_RANGE = 'float2';
		LIST_BASE = 'int';
		LIST_INDEX = 'int';
		LIST_MODE = 'int';
		LOGIC_OP_MODE = 'int';
		MAP1_COLOR_4 = 'bool';
		MAP1_GRID_DOMAIN = 'float2';
		MAP1_GRID_SEGMENTS = 'int';
		MAP1_INDEX = 'bool';
		MAP1_NORMAL = 'bool';
		MAP1_TEXTURE_COORD_1 = 'bool';
		MAP1_TEXTURE_COORD_2 = 'bool';
		MAP1_TEXTURE_COORD_3 = 'bool';
		MAP1_TEXTURE_COORD_4 = 'bool';
		MAP1_VERTEX_3 = 'bool';
		MAP1_VERTEX_4 = 'bool';
		MAP2_COLOR_4 = 'bool';
		MAP2_GRID_DOMAIN = 'float4';
		MAP2_GRID_SEGMENTS = 'float2';
		MAP2_INDEX = 'bool';
		MAP2_NORMAL = 'bool';
		MAP2_TEXTURE_COORD_1 = 'bool';
		MAP2_TEXTURE_COORD_2 = 'bool';
		MAP2_TEXTURE_COORD_3 = 'bool';
		MAP2_TEXTURE_COORD_4 = 'bool';
		MAP2_VERTEX_3 = 'bool';
		MAP2_VERTEX_4 = 'bool';
		MAP_COLOR = 'bool';
		MAP_STENCIL = 'bool';
		MATRIX_MODE = 'int';
		MAX_3D_TEXTURE_SIZE = 'int';
		MAX_CLIENT_ATTRIB_STACK_DEPTH = 'int';
		MAX_ATTRIB_STACK_DEPTH = 'int';
		MAX_CLIP_PLANES = 'int';
		MAX_COLOR_MATRIX_STACK_DEPTH = 'int';
		MAX_COMBINED_TEXTURE_IMAGE_UNITS = 'int';
		MAX_CUBE_MAP_TEXTURE_SIZE = 'int';
		MAX_DRAW_BUFFERS = 'int';
		MAX_ELEMENTS_INDICES = 'int';
		MAX_ELEMENTS_VERTICES = 'int';
		MAX_EVAL_ORDER = 'int';
		MAX_FRAGMENT_UNIFORM_COMPONENTS = 'int';
		MAX_LIGHTS = 'int';
		MAX_LIST_NESTING = 'int';
		MAX_MODELVIEW_STACK_DEPTH = 'int';
		MAX_NAME_STACK_DEPTH = 'int';
		MAX_PIXEL_MAP_TABLE = 'int';
		MAX_PROJECTION_STACK_DEPTH = 'int';
		MAX_TEXTURE_COORDS = 'int';
		MAX_TEXTURE_IMAGE_UNITS = 'int';
		MAX_TEXTURE_LOD_BIAS = 'int';
		MAX_TEXTURE_SIZE = 'int';
		MAX_TEXTURE_STACK_DEPTH = 'int';
		MAX_TEXTURE_UNITS = 'int';
		MAX_VARYING_FLOATS = 'int';
		MAX_VERTEX_ATTRIBS = 'int';
		MAX_VERTEX_TEXTURE_IMAGE_UNITS = 'int';
		MAX_VERTEX_UNIFORM_COMPONENTS = 'int';
		MAX_VIEWPORT_DIMS = 'int2';
		MINMAX = 'bool';
		MODELVIEW_MATRIX = 'float16';
		MODELVIEW_STACK_DEPTH = 'int';
		NAME_STACK_DEPTH = 'int';
		NORMAL_ARRAY = 'bool';
		NORMAL_ARRAY_BUFFER_BINDING = 'Buffer';
		NORMAL_ARRAY_STRIDE = 'int';
		NORMAL_ARRAY_TYPE = 'int';
		NORMALIZE = 'bool';
		NUM_COMPRESSED_TEXTURE_FORMATS = 'int';
		PACK_ALIGNMENT = 'int';
		PACK_IMAGE_HEIGHT = 'int';
		PACK_LSB_FIRST = 'bool';
		PACK_ROW_LENGTH = 'int';
		PACK_SKIP_IMAGES = 'int';
		PACK_SKIP_PIXELS = 'int';
		PACK_SKIP_ROWS = 'int';
		PACK_SWAP_BYTES = 'bool';
		PERSPECTIVE_CORRECTION_HINT = 'int';
		PIXEL_MAP_A_TO_A_SIZE = 'float';
		PIXEL_MAP_B_TO_B_SIZE = 'float';
		PIXEL_MAP_G_TO_G_SIZE = 'float';
		PIXEL_MAP_I_TO_A_SIZE = 'float';
		PIXEL_MAP_I_TO_B_SIZE = 'float';
		PIXEL_MAP_I_TO_G_SIZE = 'float';
		PIXEL_MAP_I_TO_I_SIZE = 'float';
		PIXEL_MAP_I_TO_R_SIZE = 'float';
		PIXEL_MAP_R_TO_R_SIZE = 'float';
		PIXEL_MAP_S_TO_S_SIZE = 'float';
		PIXEL_PACK_BUFFER_BINDING = 'Buffer';
		PIXEL_UNPACK_BUFFER_BINDING = 'Buffer';
		POINT_DISTANCE_ATTENUATION = 'float3';
		POINT_FADE_THRESHOLD_SIZE = 'float';
		POINT_SIZE = 'float';
		POINT_SIZE_GRANULARITY = 'float';
		POINT_SIZE_MAX = 'float';
		POINT_SIZE_MIN = 'float';
		POINT_SIZE_RANGE = 'float2';
		POINT_SMOOTH = 'bool';
		POINT_SMOOTH_HINT = 'int';
		POINT_SPRITE = 'bool';
		POLYGON_MODE = 'int2';
		POLYGON_OFFSET_FACTOR = 'float';
		POLYGON_OFFSET_UNITS = 'float';
		POLYGON_OFFSET_FILL = 'bool';
		POLYGON_OFFSET_LINE = 'bool';
		POLYGON_OFFSET_POINT = 'bool';
		POLYGON_SMOOTH = 'bool';
		POLYGON_SMOOTH_HINT = 'int';
		POLYGON_STIPPLE = 'bool';
		POST_COLOR_MATRIX_COLOR_TABLE = 'bool';
		POST_COLOR_MATRIX_RED_BIAS = 'float';
		POST_COLOR_MATRIX_GREEN_BIAS = 'float';
		POST_COLOR_MATRIX_BLUE_BIAS = 'float';
		POST_COLOR_MATRIX_ALPHA_BIAS = 'float';
		POST_COLOR_MATRIX_RED_SCALE = 'float';
		POST_COLOR_MATRIX_GREEN_SCALE = 'float';
		POST_COLOR_MATRIX_BLUE_SCALE = 'float';
		POST_COLOR_MATRIX_ALPHA_SCALE = 'float';
		POST_CONVOLUTION_COLOR_TABLE = 'bool';
		POST_CONVOLUTION_RED_BIAS = 'float';
		POST_CONVOLUTION_GREEN_BIAS = 'float';
		POST_CONVOLUTION_BLUE_BIAS = 'float';
		POST_CONVOLUTION_ALPHA_BIAS = 'float';
		POST_CONVOLUTION_RED_SCALE = 'float';
		POST_CONVOLUTION_GREEN_SCALE = 'float';
		POST_CONVOLUTION_BLUE_SCALE = 'float';
		POST_CONVOLUTION_ALPHA_SCALE = 'float';
		PROJECTION_MATRIX = 'float16';
		PROJECTION_STACK_DEPTH = 'int';
		READ_BUFFER = 'int';
		RED_BIAS = 'float';
		RED_BITS = 'int';
		RED_SCALE = 'float';
		RENDER_MODE = 'int';
		RESCALE_NORMAL = 'bool';
		RGBA_MODE = 'bool';
		SAMPLE_BUFFERS = 'int';
		SAMPLE_COVERAGE_VALUE = 'float';
		SAMPLE_COVERAGE_INVERT = 'bool';
		SAMPLES = 'int';
		SCISSOR_BOX = 'int4';
		SCISSOR_TEST = 'bool';
		SECONDARY_COLOR_ARRAY = 'bool';
		SECONDARY_COLOR_ARRAY_BUFFER_BINDING = 'Buffer';
		SECONDARY_COLOR_ARRAY_SIZE = 'int';
		SECONDARY_COLOR_ARRAY_STRIDE = 'int';
		SECONDARY_COLOR_ARRAY_TYPE = 'int';
		SELECTION_BUFFER_SIZE = 'int';
		SEPARABLE_2D = 'bool';
		SHADE_MODEL = 'int';
		SMOOTH_LINE_WIDTH_RANGE = 'float2';
		SMOOTH_LINE_WIDTH_GRANULARITY = 'float';
		SMOOTH_POINT_SIZE_RANGE = 'float2';
		SMOOTH_POINT_SIZE_GRANULARITY = 'float';
		STENCIL_BACK_FAIL = 'int';
		STENCIL_BACK_FUNC = 'int';
		STENCIL_BACK_PASS_DEPTH_FAIL = 'int';
		STENCIL_BACK_PASS_DEPTH_PASS = 'int';
		STENCIL_BACK_REF = 'int';
		STENCIL_BACK_VALUE_MASK = 'int';
		STENCIL_BACK_WRITEMASK = 'int';
		STENCIL_BITS = 'int';
		STENCIL_CLEAR_VALUE = 'int';
		STENCIL_FAIL = 'int';
		STENCIL_FUNC = 'int';
		STENCIL_PASS_DEPTH_FAIL = 'int';
		STENCIL_PASS_DEPTH_PASS = 'int';
		STENCIL_REF = 'int';
		STENCIL_TEST = 'bool';
		STENCIL_VALUE_MASK = 'int';
		STENCIL_WRITEMASK = 'int';
		STEREO = 'bool';
		SUBPIXEL_BITS = 'int';
		TEXTURE_1D = 'bool';
		TEXTURE_BINDING_1D = 'Texture';
		TEXTURE_2D = 'bool';
		TEXTURE_BINDING_2D = 'Texture';
		TEXTURE_3D = 'bool';
		TEXTURE_BINDING_3D = 'Texture';
		TEXTURE_BINDING_CUBE_MAP = 'Texture';
		TEXTURE_COMPRESSION_HINT = 'int';
		TEXTURE_COORD_ARRAY = 'bool';
		TEXTURE_COORD_ARRAY_BUFFER_BINDING = 'Buffer';
		TEXTURE_COORD_ARRAY_SIZE = 'int';
		TEXTURE_COORD_ARRAY_STRIDE = 'int';
		TEXTURE_COORD_ARRAY_TYPE = 'int';
		TEXTURE_CUBE_MAP = 'bool';
		TEXTURE_GEN_Q = 'bool';
		TEXTURE_GEN_R = 'bool';
		TEXTURE_GEN_S = 'bool';
		TEXTURE_GEN_T = 'bool';
		TEXTURE_MATRIX = 'float16';
		TEXTURE_STACK_DEPTH = 'int';
		TRANSPOSE_COLOR_MATRIX = 'float16';
		TRANSPOSE_MODELVIEW_MATRIX = 'float16';
		TRANSPOSE_PROJECTION_MATRIX = 'float16';
		TRANSPOSE_TEXTURE_MATRIX = 'float16';
		UNPACK_ALIGNMENT = 'int';
		UNPACK_IMAGE_HEIGHT = 'int';
		UNPACK_LSB_FIRST = 'bool';
		UNPACK_ROW_LENGTH = 'int';
		UNPACK_SKIP_IMAGES = 'int';
		UNPACK_SKIP_PIXELS = 'int';
		UNPACK_SKIP_ROWS = 'int';
		UNPACK_SWAP_BYTES = 'bool';
		VERTEX_ARRAY = 'bool';
		VERTEX_ARRAY_BUFFER_BINDING = 'Buffer';
		VERTEX_ARRAY_SIZE = 'int';
		VERTEX_ARRAY_STRIDE = 'int';
		VERTEX_ARRAY_TYPE = 'int';
		VERTEX_PROGRAM_POINT_SIZE = 'bool';
		VERTEX_PROGRAM_TWO_SIDE = 'bool';
		VIEWPORT = 'int4';
		ZOOM_X = 'float', ZOOM_Y = 'float';
		
		VENDOR = 'string';
		RENDERER = 'string';
		VERSION = 'string';
		SHADING_LANGUAGE_VERSION = 'string';
		EXTENSIONS = 'string';
	}
	_G.paramTypes = paramTypes
	
	function factory.create(loader)
		loader = setmetatable(loader or {}, loader_meta)
		loader.typeAliases = loader.typeAliases or {}
		local context = {}
		loader.context = context
		context.loader = loader
		
		loader.returnWrappers = {
			Boolean = function(b)
				return (b ~= 0)
			end;
			String = function(str)
				if (str == nil) then
					return nil
				end
				return ffi.string(str)
			end;
		}
		loader.paramWrappers = {
		}
		loader.customImporters = {
		}
		
		loader:loadPackage(require 'extern.opengl.packages.VERSION_1_1')
		
		local getString = context[loader:mangleFunctionName("GetString")]
		local VERSION = context[loader:mangleConstantName("VERSION")]
    
		local v = getString(VERSION)
		
		local major, minor = v:match('^(%d+)%.(%d+)')
		loader:loadPackage(require('extern.opengl.packages.VERSION_' .. major .. '_' .. minor))
		
		return context
	end

end
return factory
