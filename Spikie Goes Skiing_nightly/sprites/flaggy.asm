FLAG_WIDTH equ 1
FLAG_HEIGHT equ 16

FLAG_START_Y equ 176

FLAG_START_GAP equ 6
FLAG_MIN_GAP equ 3

flag_current_gap equ FLAG_START_GAP

flag_y_positions:
    dw FLAG_START_Y    
    dw 500; FLAG_START_Y+(PIXELS_PER_CELL*4)    
    dw 600; FLAG_START_Y+(PIXELS_PER_CELL*8)    
    dw 700;FLAG_START_Y+(PIXELS_PER_CELL*12)    
    










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





;IX=flags
draw_flags:
    ; or a
    ; push ix
    ; pop hl
    ; ld de,(player_ski_y)
    ; sbc hl,de
    ; xor a
    ; cp h
    ; ret nz
    ; ld a,l
    ; cp FLAG_START_Y+1
    ; ret nc
    push ix
    pop hl
    ld a,h
    cp 0
    ret nz
    or a ;reset carry
    push ix
    pop hl
    ld de,(player_ski_y)
    sbc hl,de
    ld e,l
    ld a,5
    ld d,a
    ld bc,flagsprite
    call drawsprite8_16
    inc ix
    jp draw_flags
    