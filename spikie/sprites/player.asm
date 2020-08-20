PLAYER_WIDTH equ 2 ;in bytes
PLAYER_HEIGHT equ 24 ;in lines

playery db 172
playerx db 11

targetpos_x db 0
targetpos_y db 0 

PLAYER_SPEED_X equ 1
PLAYER_SPEED_Y equ 8

collision_detected db 0

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



;reset target to playerpos, reset bool
;move the target
;check collisions, set bool true if found
;if bool false, move player to target

;sets targetpos back to player pos
init_collisions_check:
    ;reset targetpos
    ld hl,targetpos_x
    ld a,(playerx)
    ld (hl),a
    ld hl,targetpos_y
    ld a,(playery)
    ld (hl),a
    ;reset collision bool
    xor a
    ld (collision_detected),a
    ret

; If A == N, then Z flag is set.
; If A != N, then Z flag is reset.
; If A < N, then C flag is set.
; If A >= N, then C flag is reset.


;IX=objectdata
;DE=object data length
check_collisions:
    ;if tx+tw<dx -skip to next desk
    ;if tx>dx+dw -skip
    ;if ty+th<dy -skip
    ;if ty>dy+dh -skip
    ;else -set bool true and ret
    ld a,(ix)
    cp 255 
    ret z ;if ix=255

    ld a,targetpos_x
    add a,PLAYER_WIDTH
    ld b,(ix+1)
    cp b 
    jp c, gonextobject ;if tx+tw<dx -skip 

    ld a,(ix+1)
    add a,(ix+3)
    ld b,targetpos_x
    cp b
    jp c, gonextobject ;if dx+dw<tx -skip 


    ld a,targetpos_y
    add a,PLAYER_HEIGHT
    ld b,(ix+2)
    cp b
    jp c, gonextobject ;if ty+th<dy -skip

    ld a,(ix+2)
    add a,(ix+4)
    ld b,targetpos_y
    cp b
    jp c, gonextobject ;if dy+dh<ty -skip

    ;else, we have collided...
    ld a,3
    call 0x229B ;Border = A

    ld a,TRUE
    ld (collision_detected),a
    ; ret
gonextobject:
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp check_collisions


;sets player pos to targetpos (as long as collision not detected)
movetotargetpos:
    ld a,(collision_detected)
    cp TRUE
    ret z ;if collision was detected dont move to target
    ld hl,playerx
    ld a,(targetpos_x)
    ld (hl),a 
    ld hl,playery
    ld a,(targetpos_y)
    ld (hl),a 
    ret




;these move the targetpos. call them on keypress for example
try_move_left:
    ld a,(targetpos_x)
    cp MIN_X
    ret c
    ld a,(targetpos_x)
    sub PLAYER_SPEED_X
    ld (targetpos_x),a
    ret

try_move_right:
    ld a,(targetpos_x)
    cp MAX_X
    ret nc
    ld a,(targetpos_x)
    add a,PLAYER_SPEED_X
    ld (targetpos_x),a
    ret

try_move_up:
    ld a,(targetpos_y)
    cp MIN_Y
    ret c
    ld a,(targetpos_y)
    sub PLAYER_SPEED_Y
    ld (targetpos_y),a
    ret

try_move_down:
    ld a,(targetpos_y)
    cp MAX_Y
    ret z
    ld a,(targetpos_y)
    add a,PLAYER_SPEED_Y
    ld (targetpos_y),a
    ret


