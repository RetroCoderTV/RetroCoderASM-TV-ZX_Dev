
L1_PLAYER_STATE equ SIT
L1_PLAYER_START_Y equ 156
L1_PLAYER_START_X equ 7

L1_BOB_STATE equ STANDARD
L1_BOB_DIRECTION equ DOWN
L1_BOB_START_Y equ MIN_Y
L1_BOB_START_X equ MID_X

L1_EXIT_SIGN_START_Y equ 0
L1_EXIT_SIGN_START_X equ 5


L1_TOTAL_HEARTS equ 5


l1_hearts:
    db 1,7,88+24,4,16
    db 2,15,88+24,4,16
    db 3,7,120+24,4,16
    db 6,15,120+24,4,16
    db 5,15,152+24,4,16
    db 255


level_01_init:
    ld hl,ATTRIBUTE_MEMORY_START
    ld de,bg_attributes
    call paint_bg

    ld iyl,BLACKBOARD_COLOUR
    ld a,BLACKBOARD_X
    ld b,a
    ld a,BLACKBOARD_Y
    ld c,a
    call paintsprite_48_32


    ld a,L1_PLAYER_START_X
    ld (playerx),a
    ld a,L1_PLAYER_START_Y
    ld (playery),a

    ld a,L1_PLAYER_STATE
    ld (player_state),a

    ld a,L1_BOB_START_X
    ld (bobx),a
    ld a,L1_BOB_START_Y
    ld (boby),a

    ld a,L1_BOB_STATE
    ld (bob_state),a

    ld a,L1_BOB_DIRECTION
    ld (bob_direction),a

    ld a,L1_EXIT_SIGN_START_X
    ld (exitx),a
    ld a,L1_EXIT_SIGN_START_Y
    ld (exity),a

    ld a,EXIT_SIGN_TEXT_COLOUR
    ld (exit_text_current_colour),a 

    

    xor a
    ld a,L1_TOTAL_HEARTS ;cheat
    ld (hearts_collected),a
    ret


level_01_checkvictory:
    ld a,(hearts_collected)
    cp L1_TOTAL_HEARTS
    ret c


    ld a,EXIT_SIGN_TEXT_COLOUR_FLASH
    ld (exit_text_current_colour),a


    ld a,(collision_detected_player_door)
    cp FALSE
    ret z

    ;if we reach here, level is ready to complete:
    ld a,(keypressed_F)
    cp TRUE
    call z, begin_level02

    ret
;



level_01_update:    
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

    ld bc,blackboardsprite
    ld a,BLACKBOARD_X
    ld d,a
    ld a,BLACKBOARD_Y
    ld e,a
    call drawsprite48_32

    call check_keys
    call sync 

    call bob_update_l1

    call player_update_l1
    call level_01_checkvictory

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

    ld ix,l1_hearts
    call drawhearts

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

    call bob_draw

    call player_draw
    
    call sync_late 
    call drawgamewindow


    

    jp level_01_update


