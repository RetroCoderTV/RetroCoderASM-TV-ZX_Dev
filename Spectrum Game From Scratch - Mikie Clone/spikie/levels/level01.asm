level_01_init:
    ld ix,bg
    ld b,TILE_COUNT
    call paintbgtiles

    ret


level_01_update:
    call check_keys
    call sync 

    call player_update

    ld bc,(doory)
    ld iyl,DOOR_COLOUR
    call paintsprite_16_32

    ld ix,desksdata
    ld iyl,DESK_COLOUR
    call paintdesks
    
    ld ix,bg
    ld iy,bg+TILE_PROPERTIES_LENGTH
    ld b,TILE_COUNT
    call drawtiles16_16

    ld ix,desksdata
    ld iyl,DESK_COLOUR
    call drawdesks

    ld bc,doorsprite
    ld de,(doory)
    call drawsprite16_32

    call player_draw

    halt
    call drawgamewindow

    jp level_01_update