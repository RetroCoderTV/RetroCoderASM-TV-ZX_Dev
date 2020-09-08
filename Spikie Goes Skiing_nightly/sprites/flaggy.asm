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
    dw SKI_UNIT*0
    dw SKI_UNIT*1
    dw SKI_UNIT*2
    dw SKI_UNIT*3
    dw SKI_UNIT*4
    dw SKI_UNIT*5
    dw SKI_UNIT*6
    dw SKI_UNIT*7
    dw SKI_UNIT*8
    dw SKI_UNIT*9
    dw SKI_UNIT*10
    dw SKI_UNIT*11
    dw SKI_UNIT*12
    dw SKI_UNIT*13
    dw SKI_UNIT*14
    dw SKI_UNIT*15
    dw SKI_UNIT*16
    dw SKI_UNIT*17
    dw SKI_UNIT*18
    dw SKI_UNIT*19
    
flag_x_positions:
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
    db 6
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
move_flag:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SPEED_Y
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

    push bc
    ld e,l
    ld a,c
    ld d,a
    pop bc
    push bc 
    ld bc,flagsprite
    call drawsprite8_16
    pop bc
    
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


      
    push bc
    ld e,l
    ld a,c
    add a,1
    ld d,a
    pop bc
    push bc 
    ld bc,flagsprite
    call drawsprite8_16
    pop bc
    
    ret
;
    
