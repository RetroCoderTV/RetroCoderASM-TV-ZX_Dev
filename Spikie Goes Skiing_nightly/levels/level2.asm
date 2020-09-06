
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
    ld ix,flag_y_positions
    call draw_flags
    ret





paint_background_l2:
    ld hl,ATTRIBUTE_MEMORY_START
    call pnt_bg_l2
    ret

;HL=0x5800
pnt_bg_l2:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    ld (hl),L1_PAVEMENT_COLOUR
    inc hl
    jp pnt_bg_l2
    ret