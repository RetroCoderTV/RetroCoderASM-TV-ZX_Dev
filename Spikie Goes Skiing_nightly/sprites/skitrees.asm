; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
treesprite:
    db %00000001, %10000000
    db %00000011, %11000000
    db %00000111, %11100000
    db %00001111, %11110000
    db %00011111, %11111000
    db %00111111, %11111100
    db %00001111, %11110000
    db %00011111, %11111000
    db %00111111, %11111100
    db %01111111, %11111110
    db %00001111, %11110000
    db %00011111, %11111000
    db %00111111, %11111100
    db %01111111, %11111110
    db %11111111, %11111111
    db %00001111, %11110000
    db %00011111, %11111000
    db %00111111, %11111100
    db %01111111, %11111110
    db %11111111, %11111111
    db %00000011, %11000000
    db %00000011, %11000000
    db %00000011, %11000000
    db %00000011, %11000000
;

TREE_WIDTH equ 2
TREE_HEIGHT equ 24
TREE_START_Y equ 168
TREE_MIN_X equ 4
TREE_MAX_X equ 16

TREE_UNIT equ 24
NUM_TREES equ 20
tree_y_positions:
    dw TREE_UNIT*4
    dw TREE_UNIT*5
    dw TREE_UNIT*9
    dw TREE_UNIT*11
    dw TREE_UNIT*13
    dw TREE_UNIT*14
    dw TREE_UNIT*19
    dw TREE_UNIT*19
    dw TREE_UNIT*21
    dw TREE_UNIT*23
    dw TREE_UNIT*23
    dw TREE_UNIT*28
    dw TREE_UNIT*32
    dw TREE_UNIT*40
    dw TREE_UNIT*48
    dw TREE_UNIT*48
    dw TREE_UNIT*52
    dw TREE_UNIT*52
    dw TREE_UNIT*60
    dw TREE_UNIT*61
    
tree_x_positions:
    db 8
    db 4
    db 14
    db 12
    db 4
    db 7
    db 17
    db 22
    db 14
    db 3
    db 7
    db 9
    db 9
    db 12
    db 3
    db 10
    db 6
    db 18
    db 8
    db 14
; 


;IX=tree
;HL=tree y
move_tree_slow:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SKI_SPEED_SLOW
    sbc hl,bc
    pop bc
    ret

;IX=tree
;HL=tree y
move_tree_medium:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SKI_SPEED_MEDIUM
    sbc hl,bc
    pop bc
    ret

;IX=tree
;HL=tree y
move_tree_fast:
    ld a,h
    or l
    ret z ;ret if y=0
    push bc
    ld bc,PLAYER_SKI_SPEED_FAST
    sbc hl,bc
    pop bc
    ret


;HL=(tree y)
draw_tree:
    xor a
    cp h
    ret nz
    ld a,l
    cp TREE_START_Y+1
    ret nc
    or a ;cp 0 same
    ret z

    push de
    
    ld a,(de)
    ld e,l
    ld d,a

    push bc 
    ld bc,treesprite
    push de
    call drawsprite16_24
    pop de
    ld b,TREE_COLOUR
    call paint_sprite_2_3

    pop bc
    pop de
    
    ret
;
    
    
