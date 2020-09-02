

;Character Set
ASCII_ZERO equ 0x30
ASCII_SPACE equ 0x20
ASCII_AT equ 0x16
ASCII_ERASE equ 0xd2

;Spectrum
PIXEL_PER_CELL equ 8


;16 is players width, also 16 is margin so the screen colours at edges 
;can use ink and paper colours without worrying about player ink
MIN_X equ 3
MID_X equ 11
MAX_X equ 20
MIN_Y equ 48
MAX_Y equ 152 
PLAYER_MAX_Y equ 156

;bools
TRUE equ 1
FALSE equ 0
FIFTY50 equ 128

;directions
UP equ 0
DOWN equ 1
LEFT equ 2
RIGHT equ 3

;player state
STANDARD equ 0
ATTACK equ 1
SHOUT equ 2
SIT equ 3

;enemy states
PATROL equ 0
TURNING equ 1
WAITING equ 2
HUNTING equ 3
TEETH equ 4
BASKETBALL equ 5

;bob actions
BOB_GO_UP equ 0
BOB_GO_DOWN equ 1
BOB_GO_LEFT equ 2
BOB_GO_RIGHT equ 3

;ball states:
BALL_DEAD equ 0
BALL_HELD equ 1
BALL_FLYING equ 2

;teeth states
TEETH_DEAD equ 0
TEETH_AIMING equ 1
TEETH_FLYING equ 2

;game state
GAME_OVER equ 255
MAIN_MENU equ 0
LEVEL_01_CLASS equ 1
LEVEL_02_DINER equ 2

;objects
LOCKER_DATA_LENGTH equ 5
DESK_DATA_LENGTH equ 5
HEART_DATA_LENGTH equ 5
HEART_ICON_DATA_LENGTH equ 3
BASKET_DATA_LENGTH equ 4
NODE_DATA_LENGTH equ 3

;nearest enemies
NEAREST_BOB equ 0
NEAREST_MUTTSKI equ 1






