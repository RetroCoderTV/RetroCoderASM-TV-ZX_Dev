playery db 0
playerx db 0

MIN_X equ 0
MAX_X equ 22
MIN_Y equ 0
MAX_Y equ 110
PLAYER_SPEED equ 1


playersprite:
    db %00011111, %11000000
    db %00000111, %11100000
    db %00001111, %11100000
    db %00001101, %01100000
    db %00001111, %11100000
    db %00001111, %11100000
    db %00000001, %00000000
    db %00000111, %11000000
    db %00001101, %01100000
    db %00001001, %00100000
    db %00001001, %00100000
    db %00000001, %00000000
    db %00000011, %10000000
    db %00001110, %11100000
    db %00001000, %00100000
    db %00011000, %00110000

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
    sub PLAYER_SPEED
    ld (playery),a
    ret 

move_down:
    ld a,(playery)
    cp MAX_Y
    ret z
    add a,PLAYER_SPEED
    ld (playery),a
    ret 