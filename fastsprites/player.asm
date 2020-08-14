playerx db 6
playery db 100
PLAYER_SPEED equ 1
MIN_X equ 0
MAX_X equ 22
MIN_Y equ 0
MAX_Y equ 119
playersprite:
    db %11111111
    db %10000001
    db %10000001
    db %11111111
    db %10000001
    db %10000001
    db %10000001
    db %11111111


move_left:
    ld a,(playerx)
    cp MIN_X
    ret z
    sub PLAYER_SPEED
    ld (playerx),a
    ret

move_right:
    ld a,(playerx)
    cp MAX_X
    ret z
    ld a,(playerx)
    add a,PLAYER_SPEED
    ld (playerx),a
    ret

move_up:
    ld a,(playery)
    cp MIN_Y
    ret z
    ld a,(playery)
    sub PLAYER_SPEED
    ld (playery),a
    ret

move_down:
    ld a,(playery)
    cp MAX_Y
    ret z
    ld a,(playery)
    add a,PLAYER_SPEED
    ld (playery),a
    ret