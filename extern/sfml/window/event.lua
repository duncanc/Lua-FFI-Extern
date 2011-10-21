
local ffi = require 'ffi'

require 'extern.sfml.config'

ffi.cdef [[

  typedef enum {
    sfKeyA = 'a',
    sfKeyB = 'b',
    sfKeyC = 'c',
    sfKeyD = 'd',
    sfKeyE = 'e',
    sfKeyF = 'f',
    sfKeyG = 'g',
    sfKeyH = 'h',
    sfKeyI = 'i',
    sfKeyJ = 'j',
    sfKeyK = 'k',
    sfKeyL = 'l',
    sfKeyM = 'm',
    sfKeyN = 'n',
    sfKeyO = 'o',
    sfKeyP = 'p',
    sfKeyQ = 'q',
    sfKeyR = 'r',
    sfKeyS = 's',
    sfKeyT = 't',
    sfKeyU = 'u',
    sfKeyV = 'v',
    sfKeyW = 'w',
    sfKeyX = 'x',
    sfKeyY = 'y',
    sfKeyZ = 'z',
    sfKeyNum0 = '0',
    sfKeyNum1 = '1',
    sfKeyNum2 = '2',
    sfKeyNum3 = '3',
    sfKeyNum4 = '4',
    sfKeyNum5 = '5',
    sfKeyNum6 = '6',
    sfKeyNum7 = '7',
    sfKeyNum8 = '8',
    sfKeyNum9 = '9', 
    sfKeyEscape = 256,
    sfKeyLControl,
    sfKeyLShift,
    sfKeyLAlt,
    sfKeyLSystem,
    sfKeyRControl,
    sfKeyRShift,
    sfKeyRAlt,
    sfKeyRSystem,
    sfKeyMenu,
    sfKeyLBracket,
    sfKeyRBracket,
    sfKeySemiColon,
    sfKeyComma,
    sfKeyPeriod,
    sfKeyQuote,
    sfKeySlash,
    sfKeyBackSlash,
    sfKeyTilde,
    sfKeyEqual,
    sfKeyDash,
    sfKeySpace,
    sfKeyReturn,
    sfKeyBack,
    sfKeyTab,
    sfKeyPageUp,
    sfKeyPageDown,
    sfKeyEnd,
    sfKeyHome,
    sfKeyInsert,
    sfKeyDelete,
    sfKeyAdd,
    sfKeySubtract,
    sfKeyMultiply,
    sfKeyDivide,
    sfKeyLeft,
    sfKeyRight,
    sfKeyUp,
    sfKeyDown,
    sfKeyNumpad0,
    sfKeyNumpad1,
    sfKeyNumpad2,
    sfKeyNumpad3,
    sfKeyNumpad4,
    sfKeyNumpad5,
    sfKeyNumpad6,
    sfKeyNumpad7,
    sfKeyNumpad8,
    sfKeyNumpad9,
    sfKeyF1,
    sfKeyF2,
    sfKeyF3,
    sfKeyF4,
    sfKeyF5,
    sfKeyF6,
    sfKeyF7,
    sfKeyF8,
    sfKeyF9,
    sfKeyF10,
    sfKeyF11,
    sfKeyF12,
    sfKeyF13,
    sfKeyF14,
    sfKeyF15,
    sfKeyPause,

    sfKeyCount
  } sfKeyCode;

  typedef enum {
    sfButtonLeft,
    sfButtonRight,
    sfButtonMiddle,
    sfButtonX1,
    sfButtonX2
  } sfMouseButton;

  typedef enum {
    sfJoyAxisX,
    sfJoyAxisY,
    sfJoyAxisZ,
    sfJoyAxisR,
    sfJoyAxisU,
    sfJoyAxisV,
    sfJoyAxisPOV
  } sfJoyAxis;

  typedef enum {
    sfEvtClosed,
    sfEvtResized,
    sfEvtLostFocus,
    sfEvtGainedFocus,
    sfEvtTextEntered,
    sfEvtKeyPressed,
    sfEvtKeyReleased,
    sfEvtMouseWheelMoved,
    sfEvtMouseButtonPressed,
    sfEvtMouseButtonReleased,
    sfEvtMouseMoved,
    sfEvtMouseEntered,
    sfEvtMouseLeft,
    sfEvtJoyButtonPressed,
    sfEvtJoyButtonReleased,
    sfEvtJoyMoved
  } sfEventType;

  struct sfKeyEvent {
    sfEventType Type;
    sfKeyCode   Code;
    sfBool      Alt;
    sfBool      Control;
    sfBool      Shift;
  };

  struct sfTextEvent {
    sfEventType Type;
    sfUint32    Unicode;
  };

  struct sfMouseMoveEvent {
    sfEventType Type;
    int         X;
    int         Y;
  };

  struct sfMouseButtonEvent {
    sfEventType   Type;
    sfMouseButton Button;
    int           X;
    int           Y;
  };

  struct sfMouseWheelEvent {
    sfEventType Type;
    int         Delta;
  };

  struct sfJoyMoveEvent {
    sfEventType  Type;
    unsigned int JoystickId;
    sfJoyAxis    Axis;
    float        Position;
  };
  
  struct sfJoyButtonEvent {
    sfEventType  Type;
    unsigned int JoystickId;
    unsigned int Button;
  };
  
  struct sfSizeEvent {
    sfEventType  Type;
    unsigned int Width;
    unsigned int Height;
  };
  
  typedef union {
    sfEventType               Type;
    struct sfKeyEvent         Key;
    struct sfTextEvent        Text;
    struct sfMouseMoveEvent   MouseMove;
    struct sfMouseButtonEvent MouseButton;
    struct sfMouseWheelEvent  MouseWheel;
    struct sfJoyMoveEvent     JoyMove;
    struct sfJoyButtonEvent   JoyButton;
    struct sfSizeEvent        Size;
  } sfEvent;

]]
