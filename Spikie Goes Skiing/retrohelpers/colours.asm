
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
    ld a,COLOUR_BLUE
    call 0x229B
    ret

setborderpink:
    ld a,COLOUR_PINK
    call 0x229B
    ret

setbordergreen:
    ld a,COLOUR_GREEN
    call 0x229B
    ret

paint_background:
    ld hl,ATTRIBUTE_MEMORY_START
    xor a
    ld c,a
    ld iyl,L1_PAVEMENT_COLOUR
    call pnt_bg
    ret

;HL=0x5800
pnt_bg:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    ld a,c
    cp ROAD_START_LINE
    call nc,pnt_bg_setroadcolour
    cp ROAD_END_LINE
    call nc,pnt_bg_setpavementcolour
    ld b,GAME_WINDOW_WIDTH
    call pnt_line
    ld de,SCREEN_WIDTH-GAME_WINDOW_WIDTH
    add hl,de
    inc c
    jp pnt_bg
    ret

pnt_bg_setpavementcolour:
    ld iyl,L1_PAVEMENT_COLOUR
    ret
pnt_bg_setroadcolour:
    ld iyl,L1_ROAD_COLOUR
    ret

;iyl=colour
;b=window width
pnt_line:
    ld a,iyl
    ld (hl),a
    inc hl
    inc de
    djnz pnt_line
    ret

