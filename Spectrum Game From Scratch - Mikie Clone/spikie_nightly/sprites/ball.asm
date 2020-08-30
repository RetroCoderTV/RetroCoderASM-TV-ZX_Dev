BALL_WIDTH equ 1
BALL_HEIGHT equ 8

BALL_HELD_OFFSET_X equ 2
BALL_HELD_OFFSET_Y equ 0

bally db 0
ballx db 0

ball_current_state db BALL_DEAD




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





ball_update_held:
    ld a,(playerx)
    add a,BALL_HELD_OFFSET_X
    ld (ballx),a
    ld a,(playery)
    add a,BALL_HELD_OFFSET_Y
    ld (bally),a
    ret

ball_update_flying:
    ret




ball_draw:
    ld a,(ball_current_state)
    cp BALL_DEAD
    ret z
    ld bc,ballsprite
    ld de,(bally)
    call drawsprite8_8
    ret
