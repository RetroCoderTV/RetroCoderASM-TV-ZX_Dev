
;Colours
COLOUR_BLACK equ 0  ;%000
COLOUR_BLUE equ 1   ;%001
COLOUR_RED equ 2    ;%010
COLOUR_PINK equ 3   ;%011
COLOUR_GREEN equ 4  ;%100
COLOUR_CYAN equ 5   ;%101
COLOUR_YELLOW equ 6 ;%110
COLOUR_WHITE equ 7  ;%111

;ink only, use masking for paper bits
BLACK_INK   equ %00000000
BLUE_INK    equ %00000001
YELLOW_INK  equ %00000110 

;paper only, use masking for ink bits
BLACK_PAPER   equ %00000000
BLUE_PAPER    equ %00001000
YELLOW_PAPER  equ %00110000 

;Speccy mem address
ATTRIBUTE_MEMORY_START equ 0x5800
ATTRIBUTE_MEMORY_END_UB equ 0x5B
ATTRIBUTE_MEMORY_LENGTH equ 0x300

setborderblue:
    ld a,1
    call 0x229B
    ret

setborderpink:
    ld a,3
    call 0x229B
    ret

setbordergreen:
    ld a,4
    call 0x229B
    ret
