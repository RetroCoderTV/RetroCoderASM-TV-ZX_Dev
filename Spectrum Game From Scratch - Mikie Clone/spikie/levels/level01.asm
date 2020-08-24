L1_TOTAL_HEARTS equ 5

L1_PLAYER_START_Y equ 156
L1_PLAYER_START_X equ 7

L1_EXIT_SIGN_START_Y equ 0
L1_EXIT_SIGN_START_X equ 5


level_01_init:
    ld hl,ATTRIBUTE_MEMORY_START
    ld de,bg_attributes
    call paint_bg

    ld a,L1_PLAYER_START_X
    ld (playerx),a
    ld a,L1_PLAYER_START_Y
    ld (playery),a

    ld a,L1_EXIT_SIGN_START_X
    ld (exitx),a
    ld a,L1_EXIT_SIGN_START_Y
    ld (exity),a

    ld a,EXIT_SIGN_TEXT_COLOUR_FLASH
    ld (exit_text_current_colour),a 

    ret

level_01_update:    
    ld hl,GAME_WINDOW_START
    call cleargamewindow 

    call exitsign_paint

    ld bc,bg_top_left
    ld de,(bg_top_left_y)
    call drawsprite24_64
    ld bc,bg_top_right
    ld de,(bg_top_right_y)
    call drawsprite24_64

    ld bc,bg_left
    ld de,(bg_left_y)
    call drawsprite16_128
    ld bc,bg_right
    ld de,(bg_right_y)
    call drawsprite16_128

    call check_keys
    call sync 

    call player_update
    call check_victory_level01

    ld bc,(doory)
    ld iyl,DOOR_COLOUR_EXIT
    call paintsprite_16_32

    ld bc,(door2y)
    ld iyl,DOOR_COLOUR_NOTEXIT
    call paintsprite_16_32

    ld ix,desksdata
    ld iyl,DESK_COLOUR
    call paintdesks

    ld ix,desksdata
    call drawdesks

    ld bc,exitsign_sprite
    ld de,(exity)
    call drawsprite32_24

    ld bc,doorsprite
    ld de,(doory)
    call drawsprite16_32

    ld bc,doorsprite
    ld de,(door2y)
    call drawsprite16_32

    ld bc,doorframesprite
    ld de,(doorframey)
    call drawdoorframe

    ld bc,doorframesprite
    ld de,(doorframe2y)
    call drawdoorframe

    call player_draw
    
    call sync_late 
    call drawgamewindow
    

    jp level_01_update