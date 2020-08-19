playery db 160
playerx db 11
PLAYER_SPEED_X equ 1
PLAYER_SPEED_Y equ 8

; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite:
    db 0,0
    db %00000101, %01010000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001101, %10110000
    db %00001111, %11110000
    db %00001100, %00110000
    db %00001111, %11110000
    db %00000011, %11000000
    db %00011111, %11111000
    db %00111111, %11111100
    db %11100111, %11100110
    db %11001100, %00110011
    db %11001011, %11010011
    db %11001111, %11110011
    db %00001111, %11110000
    db %00000111, %11100000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00001110, %01110000
    db %00001100, %00110000
    db %00001100, %00110000
    db %00111100, %00111100
    db %01111100, %00111110

move_left:
    ld a,(playerx)
    cp MIN_X
    ret c
    ld a,(playerx)
    sub PLAYER_SPEED_X
    ld (playerx),a
    ret

move_right:
    ld a,(playerx)
    cp MAX_X
    ret nc
    ld a,(playerx)
    add a,PLAYER_SPEED_X
    ld (playerx),a
    ret

move_up:
    ld a,(playery)
    cp MIN_Y
    ret z
    ld a,(playery)
    sub PLAYER_SPEED_Y
    ld (playery),a
    ret

move_down:
    ld a,(playery)
    cp MAX_Y
    ret z
    ld a,(playery)
    add a,PLAYER_SPEED_Y
    ld (playery),a
    ret

