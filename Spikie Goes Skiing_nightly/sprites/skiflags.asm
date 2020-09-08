FLAG_WIDTH equ 1
FLAG_HEIGHT equ 16

FLAG_START_Y equ 176

FLAG_START_GAP equ 6
FLAG_MIN_GAP equ 3

flag_current_gap equ 5



FLAG_MIN_X equ 4
FLAG_MAX_X equ 16


SKI_UNIT equ 16
previous_flag_x db 0
current_flag_x db 0

NUM_FLAGS equ 20
flag_y_positions:
    dw SKI_UNIT*10
    dw SKI_UNIT*12
    dw SKI_UNIT*14
    dw SKI_UNIT*24
    dw SKI_UNIT*26
    dw SKI_UNIT*28
    dw SKI_UNIT*40
    dw SKI_UNIT*44
    dw SKI_UNIT*48
    dw SKI_UNIT*50
    dw SKI_UNIT*60
    dw SKI_UNIT*62
    dw SKI_UNIT*64
    dw SKI_UNIT*66
    dw SKI_UNIT*68
    dw SKI_UNIT*70
    dw SKI_UNIT*80
    dw SKI_UNIT*81
    dw SKI_UNIT*82
    dw SKI_UNIT*83
    
flag_x_positions:
    db 16
    db 16
    db 16
    db 6
    db 6
    db 6
    db 7
    db 8
    db 9
    db 10
    db 16
    db 15
    db 14
    db 12
    db 11
    db 10
    db 6
    db 7
    db 8
    db 9
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


spawn_first_flag
    call rand
    and %00001111 ;and 15
    add a,1
    cp FLAG_MIN_X
    jp c, spawn_first_flag

    ld (current_flag_x),a

    ret


;IX=flag
;HL=flag y
move_flag_slow:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SKI_SPEED_SLOW
    sbc hl,bc
    pop bc
    ret

;IX=flag
;HL=flag y
move_flag_medium:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SKI_SPEED_MEDIUM
    sbc hl,bc
    pop bc
    ret

;IX=flag
;HL=flag y
move_flag_fast:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SKI_SPEED_FAST
    sbc hl,bc
    pop bc
    ret


;HL=(flag y)
draw_flag:
    xor a
    cp h
    ret nz
    ld a,l
    cp FLAG_START_Y+1
    ret nc
    or a ;cp 0 same
    ret z

    push de
    
    
    ld a,(de)
    ld e,l
    ld d,a

    
    
    push bc 
    ld bc,flagsprite
    call drawsprite8_16
    pop bc
    pop de
    
    ret
;
    

;HL=(flag y)
draw_flag_pair:
    xor a
    cp h
    ret nz
    ld a,l
    cp FLAG_START_Y+1
    ret nc
    or a ;cp 0 same
    ret z


    push de
    
    
    ld a,(de)
    add a,4
    ld e,l
    ld d,a

    
    
    push bc 
    ld bc,flagsprite
    call drawsprite8_16
    pop bc
    pop de
    
    ret
;
    
