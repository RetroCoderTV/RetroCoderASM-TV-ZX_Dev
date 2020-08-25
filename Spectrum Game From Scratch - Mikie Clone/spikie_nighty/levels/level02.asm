
L2_PLAYER_DIRECTION equ DOWN
L2_PLAYER_STATE equ STANDARD
L2_PLAYER_START_Y equ MIN_Y
L2_PLAYER_START_X equ 15

L2_EXIT_SIGN_START_Y equ 0
L2_EXIT_SIGN_START_X equ 5


L2_TOTAL_HEARTS equ 5

L2_LOCKER_DATA_LENGTH equ 5
l2_lockers:
    db 5,6,88,2,24
    db 5,8,88,2,24
    db 255


level_02_init:
    ld hl,ATTRIBUTE_MEMORY_START
    ld de,bg_attributes
    call paint_bg

    ld a,L2_PLAYER_START_X
    ld (playerx),a
    ld a,L2_PLAYER_START_Y
    ld (playery),a

    ld a,L2_EXIT_SIGN_START_X
    ld (exitx),a
    ld a,L2_EXIT_SIGN_START_Y
    ld (exity),a

    ld a,EXIT_SIGN_TEXT_COLOUR
    ld (exit_text_current_colour),a 

    ld a,L2_PLAYER_STATE
    ld (player_state),a

    ld a,L2_PLAYER_DIRECTION
    ld (player_direction),a

    xor a
    ld (hearts_collected),a

    ret

level_02_update:    
    ld hl,GAME_WINDOW_START
    call cleargamewindow 

    call ui_update

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

    call player_update_l2
    call check_victory_level02

    ld bc,(doory)
    ld iyl,DOOR_COLOUR_EXIT
    call paintsprite_16_32

    ld bc,(door2y)
    ld iyl,DOOR_COLOUR_NOTEXIT
    call paintsprite_16_32

    ld ix,l2_lockers
    call drawlockers

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


    

    jp level_02_update


