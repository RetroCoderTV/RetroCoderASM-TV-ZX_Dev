BALL_WIDTH equ 1
BALL_HEIGHT equ 8

BALL_HELD_OFFSET_X equ 2
BALL_HELD_OFFSET_Y equ 0

BALL_SPEED_X equ 1
BALL_SPEED_Y equ 4

bally db 0
ballx db 0

ball_current_state db BALL_DEAD

ball_diff_bob_x db 0
ball_diff_bob_y db 0
ball_diff_bob db 0

ball_diff_muttski_x db 0
ball_diff_muttski_y db 0
ball_diff_muttski db 0

current_nearest_target db NEAREST_BOB




ballsprite:
    db %00011000
    db %00111100
    db %01111110
    db %11111111
    db %11111111
    db %01111110
    db %00111100
    db %00011000




ball_spawn:
    ld a,BALL_HELD
    ld (ball_current_state),a

    ld a,(playerx)
    add a,BALL_HELD_OFFSET_X
    ld (ballx),a
    ld a,(playery)
    add a,BALL_HELD_OFFSET_Y
    ld (bally),a

    ret


ball_update:
    
    ld a,(ball_current_state)
    cp BALL_DEAD
    ret z
    cp BALL_HELD
    call z,ball_update_held
    cp BALL_FLYING
    call z,ball_update_flying
    ret


ball_fire:
    ld a,(keypressed_F_Held)
    cp TRUE
    ret z
    
    ld a,BALL_FLYING
    ld (ball_current_state),a
    ret



ball_find_nearest_enemy:
    ld a,(bobx)
    ld b,a
    ld a,(ballx)
    sub b
    ld (ball_diff_bob_x),a
    ld a,(boby)
    ld b,a
    ld a,(bally)
    sub b
    ld (ball_diff_bob_y),a
    ld b,a
    ld a,(ball_diff_bob_x)
    add a,b
    ld (ball_diff_bob),a

    ld a,(muttskix)
    ld b,a
    ld a,(ballx)
    sub b
    ld (ball_diff_muttski_x),a
    ld a,(muttskiy)
    ld b,a
    ld a,(bally)
    sub b
    ld (ball_diff_muttski_y),a
    ld b,a
    ld a,(ball_diff_muttski_x)
    add a,b
    ld (ball_diff_muttski),a

    ld a,(ball_diff_bob)
    ld b,a
    ld a,(ball_diff_muttski)
    cp b
    jp c, ball_setnearest_muttski
    jp nc, ball_setnearest_bob
ball_setnearest_bob:
    ld a,NEAREST_BOB
    ld (current_nearest_target),a
    ret
ball_setnearest_muttski:
    ld a,NEAREST_MUTTSKI
    ld (current_nearest_target),a
    ret

    


ball_update_held:

    ;if f pressed change state.
    ld a,(keypressed_F)
    cp TRUE
    call z, ball_fire

    ld a,(playerx)
    add a,BALL_HELD_OFFSET_X
    ld (ballx),a
    ld a,(playery)
    add a,BALL_HELD_OFFSET_Y
    ld (bally),a
    ret

ball_update_flying:
    ld a,(current_nearest_target)
    cp NEAREST_BOB
    jp z,ball_flying_bob
    cp NEAREST_MUTTSKI
    jp z,ball_flying_muttski
    ret

ball_flying_bob:
    ld a,(bobx)
    ld b,a
    ld a,(ballx)
    cp b
    jp c,ball_move_right
    
    ld a,(ballx)
    ld b,a
    ld a,(bobx)
    cp b
    jp c,ball_move_left

    ld a,(boby)
    ld b,a
    ld a,(bally)
    cp b
    jp c,ball_move_up
    
    ld a,(bally)
    ld b,a
    ld a,(boby)
    cp b
    jp c,ball_move_down
    ret
ball_flying_muttski:   
    ld a,(muttskix)
    ld b,a
    ld a,(ballx)
    cp b
    jp c,ball_move_right
    
    ld a,(ballx)
    ld b,a
    ld a,(muttskix)
    cp b
    jp c,ball_move_left

    ld a,(muttskiy)
    ld b,a
    ld a,(bally)
    cp b
    jp c,ball_move_up
    
    ld a,(bally)
    ld b,a
    ld a,(muttskiy)
    cp b
    jp c,ball_move_down
    ret


ball_move_up:
    ld a,(bally)
    add a,-BALL_SPEED_Y
    ld (bally),a
    ret
ball_move_down:
    ld a,(bally)
    add a,BALL_SPEED_Y
    ld (bally),a
    ret
ball_move_left:
    ld a,(ballx)
    add a,-BALL_SPEED_X
    ld (ballx),a
    ret
ball_move_right:
    ld a,(ballx)
    add a,BALL_SPEED_X
    ld (ballx),a
    ret





ball_draw:
    ld a,(ball_current_state)
    cp BALL_DEAD
    ret z
    ld bc,ballsprite
    ld de,(bally)
    call drawsprite8_8
    ret
