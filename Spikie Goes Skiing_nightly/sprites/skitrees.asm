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
NUM_TREES equ 67


TREEY1 equ 88
TREEY2 equ 88
TREEY3 equ 88
TREEY4 equ 128
TREEY5 equ 128
TREEY6 equ 128
TREEY7 equ 168
TREEY8 equ 168
TREEY9 equ 168
TREEY10 equ 344
TREEY11 equ 344
TREEY12 equ 344
TREEY13 equ 384
TREEY14 equ 384
TREEY15 equ 384
TREEY16 equ 416
TREEY17 equ 424
TREEY18 equ 416
TREEY19 equ 768
TREEY20 equ 768
TREEY21 equ 768
TREEY22 equ 808
TREEY23 equ 808
TREEY24 equ 808
TREEY25 equ 848
TREEY26 equ 840
TREEY27 equ 848
TREEY28 equ 1040
TREEY29 equ 1040
TREEY30 equ 1040
TREEY31 equ 1080
TREEY32 equ 1080
TREEY33 equ 1080
TREEY34 equ 1120
TREEY35 equ 1120
TREEY36 equ 1120
TREEY37 equ 1264
TREEY38 equ 1264
TREEY39 equ 1264
TREEY40 equ 1304
TREEY41 equ 1304
TREEY42 equ 1304
TREEY43 equ 1336
TREEY44 equ 1336
TREEY45 equ 1336
TREEY46 equ 1480
TREEY47 equ 1480
TREEY48 equ 1480
TREEY49 equ 1520
TREEY50 equ 1520
TREEY51 equ 1520
TREEY52 equ 1552
TREEY53 equ 1552
TREEY54 equ 1552
TREEY55 equ 1696
TREEY56 equ 1696
TREEY57 equ 1736
TREEY58 equ 1736
TREEY59 equ 1832
TREEY60 equ 1832
TREEY61 equ 1832
TREEY62 equ 1872
TREEY63 equ 1872
TREEY64 equ 1872
TREEY65 equ 1904
TREEY66 equ 1904
TREEY67 equ 1904



tree_y_positions:
    ds 67*2
    
;
    
tree_x_positions:
    db 4,8,12
    db 4,8,12
    db 4,8,12
    db 14,18,22
    db 14,18,22
    db 14,18,22
    db 5,9,13
    db 5,9,13
    db 5,9,13
    db 14,18,22
    db 14,18,22
    db 14,18,22
    db 5,9,13
    db 5,9,13
    db 5,9,13
    db 5,9,13
    db 5,9,13
    db 5,9,13
    db 19,22
    db 19,22
    db 4,8,12
    db 4,8,12
    db 4,8,12    
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
    inc hl
    ld de,TREEY12
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY13
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY14
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY15
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY16
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY17
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY18
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY19
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY20
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY21
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY22
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY23
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY24
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY25
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY26
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY27
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY28
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY29
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY30
    ld (hl),e
    inc hl
    ld (hl),d

    ld de,TREEY31
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY32
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY33
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY34
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY35
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY36
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY37
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY38
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY39
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY40
    ld (hl),e
    inc hl
    ld (hl),d

    ld de,TREEY41
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY42
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY43
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY44
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY45
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY46
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY47
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY48
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY49
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY50
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY51
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY52
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY53
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY54
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY55
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY56
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY57
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY58
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY59
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY60
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl


    ld de,TREEY61
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY62
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY63
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY64
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY65
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY66
    ld (hl),e
    inc hl
    ld (hl),d
    inc hl
    ld de,TREEY67
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
    
    
