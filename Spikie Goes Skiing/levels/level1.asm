L1_PAVEMENT_COLOUR equ %01111000
L1_ROAD_COLOUR equ %01000111
L1_WHITELINE_Y equ 96


roadline_sprite:
    db %00000000
    db %00000000
    db %11111111
    db %11111111
    db %11111111
    db %11111111
    db %00000000
    db %00000000


l1_start:
    call paint_background
    ret

l1_draw_whitelines: 
    xor a
    ld d,a
    ld a,L1_WHITELINE_Y
    ld e,a
    call l1_drw_wl
    ret

l1_drw_wl:
    push de
    ld bc,roadline_sprite
    call drawsprite8_8
    pop de
    inc d
    inc d
    ld a,d
    cp GAME_WINDOW_WIDTH
    jp c, l1_drw_wl
    ret



l1_update:
    call getrandom
    cp 10
    call c, spawn_vehicle_right

    call vehicles_update

    call player_update

    call setborderblue

    ret



l1_draw:
    call vehicles_draw
    call l1_draw_whitelines

    call player_draw
    ret