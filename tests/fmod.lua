
package.path = package.path .. ';./?/init.lua'

local bit = require 'bit'
local ffi = require 'ffi'
local fmod = require 'extern.fmod'
local fmod_e = require 'extern.fmod.errors'

local function fmod_assert(retcode)
  if (retcode ~= fmod.FMOD_OK) then
    error(fmod_e[retcode], 2)
  end
end

local function create_system()
  local out_system = ffi.new 'FMOD_SYSTEM*[1]'
  fmod_assert( fmod.FMOD_System_Create(out_system) )
  local system = out_system[0]
  fmod.FMOD_System_Init(system, 4, fmod.FMOD_INIT_NORMAL, nil)
  return system
end

local function load_stream(system, filename)
  local out_sound = ffi.new 'FMOD_SOUND*[1]'
  fmod_assert( fmod.FMOD_System_CreateSound(system, filename, fmod.FMOD_CREATESTREAM, nil, out_sound) )
  return ffi.gc(out_sound[0], fmod.FMOD_Sound_Release)
end

local function play_sound(system, sound)
  local out_channel = ffi.new 'FMOD_CHANNEL*[1]'
  fmod_assert( fmod.FMOD_System_PlaySound(system, fmod.FMOD_CHANNEL_FREE, sound, false, out_channel) )
  return out_channel[0]
end

local function is_channel_paused(channel)
  local out_bool = ffi.new 'FMOD_BOOL[1]'
  fmod_assert( fmod.FMOD_Channel_GetPaused(channel, out_bool) )
  return out_bool[0] ~= 0
end

local fm = create_system()

local tune = load_stream(fm, "tests/greenochrome.xm")

local channel = play_sound(fm, tune)

print 'Enter p to pause/play or s to stop:'
while true do
  io.write '>>'
  local cmd = io.read('*l')
  if (cmd == nil) then
    break
  end
  cmd = cmd:lower()
  if (cmd == 'p') then
    fmod_assert( fmod.FMOD_Channel_SetPaused(channel, not is_channel_paused(channel)) )
  elseif (cmd == 's') then
    break
  else
    print 'Enter p to pause/play or s to stop:'
  end
end
