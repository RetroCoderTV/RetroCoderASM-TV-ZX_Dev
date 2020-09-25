py dw 0x1000
px dw 0x0500

vy dw 0
vx dw 0


MAX_THRUST equ 1000


; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite:
    db %00011111, %11000000
    db %00110010, %01100000
    db %01100010, %00110000
    db %11111111, %11111111
    db %11111111, %11111111
    db %10000111, %11100001
    db %10110111, %11101101
    db %00110000, %00001100
;



player_update:
    call plyr_apply_gravity
    ret



player_draw:
    ld hl,px
    inc hl
    ld d,(hl)
    ld hl,py
    inc hl
    ld e,(hl)
    ld bc,playersprite
    call drawsprite16_8
    ret





plyr_apply_gravity:
    ld hl,(py)
    ld de,GRAVITY
    add hl,de
    ld (py),hl
    ret