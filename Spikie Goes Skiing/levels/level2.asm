L2_PLAYER_START_FACING equ DOWN
L2_PLAYER_START_X equ 13
L2_PLAYER_START_Y equ 32   

L2_PLAYER_START_STATE equ SKIING_WAITING
L2_END_FLAG_X equ 11
L2_END_FLAG_Y equ 192-32

L2_END_FLAG_W equ 5
L2_END_FLAG_H equ 3

l2_start:
    call 0xDAF
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ld b,DEFAULT_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes
    call init_ui_labels
    call init_ui_numbers
    
    call reset_flags_y
    call reset_trees_y
    call paint_background_l2
    call player_init_l2

    call sound_B_0_25
    ret

l2_update:
    call player_update 

    call l2_draw
    ret



l2_draw:
    call player_draw

    ld b,NUM_FLAGS
    ld ix,flag_y_positions
    ld de,flag_x_positions
    call l2_draw_flags

    ld b,NUM_TREES
    ld ix,tree_y_positions
    ld de,tree_x_positions
    call l2_draw_trees
    ld a,0


    ret


;B=num flags
;de=flags x
;IX=flags y
l2_draw_flags:
    ld l,(ix)
    ld h,(ix+1)
    call draw_flag
    ld l,(ix)
    ld h,(ix+1)
    call draw_flag_pair
    inc ix
    inc ix
    inc de
    djnz l2_draw_flags
    ret

;B=num trees
;de=trees x
;IX=trees y
l2_draw_trees:
    ld l,(ix)
    ld h,(ix+1)
    call draw_tree
    inc ix
    inc ix
    inc de
    djnz l2_draw_trees
    ret


paint_background_l2:
    ld hl,ATTRIBUTE_MEMORY_START
    ld iyl,L2_SNOW_COLOUR
    call pnt_bg_l2
    ret

;HL=0x5800
pnt_bg_l2:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    ld b,GAME_WINDOW_WIDTH
    call paint_line
    ld de,SCREEN_WIDTH-GAME_WINDOW_WIDTH
    add hl,de
    jp pnt_bg_l2
    ret