
local ffi = require 'ffi'
local sdl = require 'extern.sdl'

ffi.cdef [[

  enum {
    SDL_IMAGE_MAJOR_VERSION	= 1,
    SDL_IMAGE_MINOR_VERSION =	2,
    SDL_IMAGE_PATCHLEVEL = 10
  };

  const SDL_version* IMG_Linked_Version();

  typedef enum {
		IMG_INIT_JPG = 0x00000001,
		IMG_INIT_PNG = 0x00000002,
		IMG_INIT_TIF = 0x00000004
  } IMG_InitFlags;

  int IMG_Init(int flags);
  void IMG_Quit();

  SDL_Surface* IMG_LoadTyped_RW(SDL_RWops* src, int freesrc, char* type);
  SDL_Surface* IMG_Load(const char* file);
  SDL_Surface* IMG_Load_RW(SDL_RWops* src, int freesrc);
  int IMG_InvertAlpha(int on);
  int IMG_isICO(SDL_RWops* src);
  int IMG_isCUR(SDL_RWops* src);
  int IMG_isBMP(SDL_RWops* src);
  int IMG_isGIF(SDL_RWops* src);
  int IMG_isJPG(SDL_RWops* src);
  int IMG_isLBM(SDL_RWops* src);
  int IMG_isPCX(SDL_RWops* src);
  int IMG_isPNG(SDL_RWops* src);
  int IMG_isPNM(SDL_RWops* src);
  int IMG_isTIF(SDL_RWops* src);
  int IMG_isXCF(SDL_RWops* src);
  int IMG_isXPM(SDL_RWops* src);
  int IMG_isXV(SDL_RWops* src);

  SDL_Surface* IMG_LoadICO_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadCUR_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadBMP_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadGIF_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadJPG_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadLBM_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadPCX_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadPNG_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadPNM_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadTGA_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadTIF_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadXCF_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadXPM_RW(SDL_RWops* src);
  SDL_Surface* IMG_LoadXV_RW(SDL_RWops* src);

  SDL_Surface* IMG_ReadXPMFromArray(char** xpm);
  
]]

return ffi.load 'SDL_image'
