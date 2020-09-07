L2_PLAYER_START_FACING equ DOWN
L2_PLAYER_START_X equ 13
L2_PLAYER_START_Y equ 16   




l2_start:
    call paint_background_l2
    call player_init_l2
    ret

l2_update:
    call player_update

    

    call l2_draw
    ret



l2_draw:
    call player_draw

    ld b,NUM_FLAGS
    ld ix,flag_y_positions
    call l2_flags_loop
 
    ret


l2_flags_loop:
    ld l,(ix)
    ld h,(ix+1)
    call draw_flag
    inc ix
    inc ix
    djnz l2_flags_loop
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