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

TREEY1 equ 120
TREEY2 equ 168
TREEY3 equ 360
TREEY4 equ 384
TREEY5 equ 424
TREEY6 equ 520
TREEY7 equ 648
TREEY8 equ 752
TREEY9 equ 872
TREEY10 equ 888
TREEY11 equ 920

NUM_TREES equ 11
tree_y_positions:
    ds 11*2
;
    
tree_x_positions:
    db 6  
    db 10  
    db 16  
    db 21  
    db 16  
    db 3
    db 6
    db 5
    db 18
    db 22
    db 18
    db 255
; 


reset_trees_y:
    ld hl,tree_y_positions
    ld de,TREEY1
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY2
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY3
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY4
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY5
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY6
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY7
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY8
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY9
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY10
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY11
    ld (hl),e
    inc hl
    ld (hl),d
    
    ret
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
    
    
