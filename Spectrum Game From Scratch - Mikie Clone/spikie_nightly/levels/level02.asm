
L2_PLAYER_DIRECTION equ DOWN
L2_PLAYER_STATE equ STANDARD
L2_PLAYER_START_Y equ MIN_Y
L2_PLAYER_START_X equ 15

L2_EXIT_SIGN_START_Y equ 0
L2_EXIT_SIGN_START_X equ 5

L2_BOB_START_STATE equ PATROL
L2_BOB_START_DIRECTION equ DOWN
L2_BOB_START_Y equ MIN_Y
L2_BOB_START_X equ MID_X

L2_MUTTSKI_START_STATE equ PATROL
L2_MUTTSKI_START_DIRECTION equ DOWN
L2_MUTTSKI_START_Y equ MIN_Y
L2_MUTTSKI_START_X equ MID_X


L2_TOTAL_HEARTS equ 4*6


l2_lockers:
    db 4,4,88,2,24
    db 4,6,88,2,24
    db 4,16,88,2,24
    db 4,18,88,2,24
    db 4,8,136,2,24
    db 4,14,136,2,24
    db 255


l2_nodes: 
    db 1,MIN_X,L1_ROW1 ;0,0
    db 2,MID_X,L1_ROW1 ;0,1
    db 3,MAX_X,L1_ROW1 ;0,2
    db 4,MIN_X,L1_ROW2 ;1,0
    db 5,MID_X,L1_ROW2 ;0,1
    db 6,MAX_X,L1_ROW2;0,2
    db 7,MIN_X,L1_ROW3 ;2,0
    db 8,MID_X,L1_ROW3 ;0,1
    db 9,MAX_X,L1_ROW3 ;0,2
    db 10,MIN_X,L1_ROW4 ;3,0
    db 11,MID_X,L1_ROW4 ;0,1
    db 12,MAX_X,L1_ROW4 ;0,2



;format:
;x,y,w,h
l2_baskets:
    db 8,96,2,16
    db 14,96,2,16
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

    ld a,L2_MUTTSKI_START_STATE
    ld (muttski_state),a

    ld a,L2_MUTTSKI_START_DIRECTION
    ld (muttski_direction),a

    ld a,L2_MUTTSKI_START_X
    ld (muttskix),a

    ld a,L2_MUTTSKI_START_Y
    ld (muttskiy),a

    ret



level_02_checkvictory:
    ;if hearts collected != TOTAL HEARTS
    ;if collision door == false
    ;if key_F != pressed
    

    ld a,(hearts_collected)
    cp L2_TOTAL_HEARTS
    ret c


    ld a,EXIT_SIGN_TEXT_COLOUR_FLASH
    ld (exit_text_current_colour),a


    ld a,(collision_detected_player_door)
    cp FALSE
    ret z

    ;if we reach here, level is ready to complete:
    ld a,(keypressed_F)
    cp TRUE
    call z, begin_level03

    ret
;






level_02_update:    
    ld hl,GAME_WINDOW_START
    call cleargamewindow 

    ; call ui_update

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

    call muttski_update_l2

    call player_update_l2
    call level_02_checkvictory

    call ball_update

    ld bc,(doory)
    ld iyl,DOOR_COLOUR_EXIT
    call paintsprite_16_32

    ld bc,(door2y)
    ld iyl,DOOR_COLOUR_NOTEXIT
    call paintsprite_16_32

    ld ix,l2_lockers
    call paintlockers

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

    ld ix,l2_baskets
    call drawbaskets

    call muttski_draw

    call player_draw

    call ball_draw
    
    call sync_late 
    call drawgamewindow


    

    jp level_02_update


