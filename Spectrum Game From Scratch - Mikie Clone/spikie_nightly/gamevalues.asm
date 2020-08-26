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
MAX_X equ 24-2-2
MIN_Y equ 45
MAX_Y equ 192-20 ;24 is players height, we allow him to go a little bit off screen at bottom

;bools
TRUE equ 1
FALSE equ 0

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

;bob actions
BOB_GO_UP equ 0
BOB_GO_DOWN equ 1
BOB_GO_LEFT equ 2
BOB_GO_RIGHT equ 3


;game state
MAIN_MENU equ 0
LEVEL_01_CLASS equ 1
LEVEL_02_DINER equ 2

;objects
LOCKER_DATA_LENGTH equ 5
DESK_DATA_LENGTH equ 5
HEART_DATA_LENGTH equ 5
HEART_ICON_DATA_LENGTH equ 3
BASKET_DATA_LENGTH equ 4






