FLAG_WIDTH equ 1
FLAG_HEIGHT equ 16

FLAG_START_Y equ 176

FLAG_START_GAP equ 6
FLAG_MIN_GAP equ 3

flag_current_gap equ 5
NUM_FLAGS equ 6
flag_y_positions:
    dw 128
    dw 144
    dw 160
    dw 176
    dw 256
    dw 400 
; 


flagsprite:
    db %11111111
    db %01111110
    db %00111100
    db %01111110
    db %11111111
    db %00011000
    db %00011000
    db %00011000
    ;
    db %00011000
    db %00011000
    db %00011000
    db %00011000
    db %00011000
    db %00011000
    db %00011000
    db %00011000
;

;HL=(flag y)
draw_flag:
    xor a
    cp h
    ret nz
    ld a,l
    cp FLAG_START_Y+1
    ret nc
    ; cp 0
    ; ret z
    ld e,l
    ld a,8
    ld d,a
    push bc
    ld bc,flagsprite
    call drawsprite8_16
    pop bc
    ret
;
    