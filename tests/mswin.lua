
local bit = require 'bit'
local ffi = require 'ffi'
local mswin = require 'extern.mswindows'

local hInstance = mswin.GetModuleHandleA(nil)
print(hInstance)

local CLASS_NAME = 'TestWindowClass'

local wndproc = ffi.cast('WNDPROC', function(hwnd, msg, wparam, lparam)
  --print(hwnd, msg, wparam, lparam)
  if (msg == mswin.WM_DESTROY) then
    mswin.PostQuitMessage(0)
  else
    return mswin.DefWindowProcA(hwnd, msg, wparam, lparam)
  end
  return 0
end)
local reg = mswin.RegisterClassExA(ffi.new('WNDCLASSEXA', {
  cbSize = ffi.sizeof 'WNDCLASSEXA';
  style = bit.bor(mswin.CS_HREDRAW, mswin.CS_VREDRAW);
  lpfnWndProc = wndproc;
  cbClsExtra = 0;
  cbWndExtra = 0;
  hInstance = hInstance;
  hIcon = nil;
  hCursor = nil;
  hbrBackground = nil;
  lpszMenuName = nil;
  lpszClassName = CLASS_NAME;
  hIconSm = nil;
}))

if (reg == 0) then
  error('error #' .. mswin.GetLastError())
end

print('reg', reg)

local testHwnd = mswin.CreateWindowExA(
  0,
  CLASS_NAME,
  'Test Window',
  mswin.WS_OVERLAPPEDWINDOW,
  mswin.CW_USEDEFAULT, mswin.CW_USEDEFAULT,
  500, 100,
  nil,
  nil,
  hInstance,
  nil)
  
if (testHwnd == nil) then
  error 'unable to create window'
end

mswin.ShowWindow(testHwnd, mswin.SW_SHOW)
mswin.UpdateWindow(testHwnd)

local msg = ffi.new 'MSG'

while (mswin.GetMessageA(msg, nil, 0, 0) ~= 0) do
  mswin.TranslateMessage(msg)
  mswin.DispatchMessageA(msg)
end
