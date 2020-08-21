PLAYER_WIDTH equ 2 ;in bytes
PLAYER_HEIGHT equ 24 ;in lines
PLAYER_BOUNDING_BOX_OFFSET_X equ 1
PLAYER_BOUNDING_BOX_OFFSET_Y equ 15
PLAYER_BOUNDING_BOX_HEIGHT equ 5

player_direction db UP
player_state db WALK
player_anim_frame db 0
PLAYER_FRAME_SIZE equ 48
player_anim_timer db 0
PLAYER_ANIM_DELAY equ 5

playery db 168
playerx db 11

targetpos_x db 0
targetpos_y db 0

PLAYER_SPEED_X equ 1
PLAYER_SPEED_Y equ 4

collision_detected db 0

; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite_up:
    db %00000101, %01010000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00000011, %11000000
    db %00011111, %11111000
    db %00111111, %11111100
    db %11100111, %11100110
    db %11001111, %11110011
    db %11001111, %11110011
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
playersprite_down:
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
playersprite_left:
    db %00000000, %10100000
    db %00000100, %10100000
    db %00000011, %11101000
    db %00000011, %11110000
    db %00000110, %11111100
    db %00000111, %11110000
    db %00000111, %11111100
    db %01100011, %11110000
    db %01100011, %11100000
    db %00111111, %11110000
    db %00000011, %11110000
    db %00001111, %11111100
    db %00001111, %11110100
    db %00011111, %11110010
    db %00011111, %11110011
    db %00011111, %11110111
    db %00011111, %11100111
    db %00001111, %11110000
    db %00000010, %00010000
    db %00001110, %00011000
    db %00001100, %00001000
    db %00000000, %00001000
    db %00000000, %01111000
    db %00000000, %01111000
playersprite_right:
    db %00000101, %00000000
    db %00000101, %00100000
    db %00010111, %11000000
    db %00001111, %11000000
    db %00111111, %01100000
    db %00001111, %11100000
    db %00111111, %11100000
    db %00001111, %11000110
    db %00000111, %11000110
    db %00001111, %11111100
    db %00001111, %11000000
    db %00111111, %11110000
    db %00101111, %11110000
    db %01001111, %11111000
    db %11001111, %11111000
    db %11101111, %11111000
    db %11100111, %11111000
    db %00001111, %11110000
    db %00001000, %01000000
    db %00011000, %01110000
    db %00010000, %00110000
    db %00010000, %00000000
    db %00011110, %00000000
    db %00011110, %00000000
    ;
    db %00000101, %00000000
    db %00000101, %00100000
    db %00010111, %11000000
    db %00001111, %11000000
    db %00111111, %01100000
    db %00001111, %11100000
    db %00111111, %11100000
    db %00001111, %11000000
    db %00000111, %11000000
    db %00001111, %11100000
    db %00001111, %11000000
    db %00011111, %11110000
    db %00001111, %11110000
    db %00001111, %11111000
    db %00001111, %11111000
    db %00001111, %11111000
    db %00000111, %11111000
    db %00001111, %11110000
    db %00001000, %01000000
    db %00011000, %01110000
    db %00010000, %00110000
    db %00010000, %00000000
    db %00011110, %00000000
    db %00011110, %00000000

; playersprite_mask:
;     db %11111010, %10101111
;     db %11110000, %00001111
;     db %11110000, %00001111
;     db %11110010, %01001111
;     db %11110000, %00001111
;     db %11110011, %11001111
;     db %11110000, %00001111
;     db %11111100, %00111111
;     db %11100000, %00000111
;     db %11000000, %00000011
;     db %00011000, %00011000
;     db %00110011, %11001100
;     db %00110100, %00101100
;     db %00110000, %00001100
;     db %11110000, %00001111
;     db %11111000, %00011111
;     db %11111000, %00011111
;     db %11111001, %10011111
;     db %11111001, %10011111
;     db %11110001, %10001111
;     db %11110011, %11001111
;     db %11110011, %11001111
;     db %11000011, %11000011
;     db %10000011, %11000001


;reset target to playerpos, reset bool
;move the target
;check collisions, set bool true if found
;if bool false, move player to target

;sets targetpos back to player pos
reset_collisions_check:
    ;reset targetpos
    ld a,(playerx)
    ld (targetpos_x),a
    ld a,(playery)
    ld (targetpos_y),a

    ;reset collision bool
    xor a
    call 0x229B ;Border = A
    xor a
    ld (collision_detected),a ;collision bool = 0
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

    ld a,(targetpos_x)
    add a,PLAYER_WIDTH
    sub PLAYER_BOUNDING_BOX_OFFSET_X
    ld b,(ix+1)
    cp b 
    jp c, gonextobject ;if tx+tw<dx -skip 

    ld a,(targetpos_x)
    add a,PLAYER_BOUNDING_BOX_OFFSET_X
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, gonextobject ;if dx+dw<tx -skip 


    ld a,(targetpos_y)
    add a,PLAYER_BOUNDING_BOX_HEIGHT
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    ld b,(ix+2)
    cp b
    jp c, gonextobject ;if ty+th<dy -skip


    ld a,(targetpos_y)
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, gonextobject ;if dy+dh<ty -skip

    ;else, we have collided...
    ; ld a,3
    ; call 0x229B ;Border = A

    ld a,TRUE
    ld (collision_detected),a
    ; ret
gonextobject:
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp check_collisions



;sets player pos to targetpos (as long as collision not detected)
safemovetotargetpos:
    ld a,(collision_detected)
    cp TRUE
    ret z ;if collision was detected dont move to target
    ld a,(targetpos_x)
    ld (playerx),a
    ld a,(targetpos_y)
    ld (playery),a
    ret




;these move the targetpos. call them on keypress for example
try_move_left:
    ld a,LEFT
    ld (player_direction),a
    ld a,(playerx)
    cp MIN_X
    ret c
    ld a,(targetpos_x)
    sub PLAYER_SPEED_X
    ld (targetpos_x),a
    ld ix,desksdata
    call check_collisions
    call safemovetotargetpos
    ret

try_move_right:
    ld a,RIGHT
    ld (player_direction),a
    ld a,(playerx)
    cp MAX_X
    ret nc
    ld a,(targetpos_x)
    add a,PLAYER_SPEED_X
    ld (targetpos_x),a
    ld ix,desksdata
    call check_collisions
    call safemovetotargetpos
    ret

try_move_up:
    ld a,UP
    ld (player_direction),a
    ld a,(playery)
    cp MIN_Y
    ret c
    ld a,(targetpos_y)
    sub PLAYER_SPEED_Y
    ld (targetpos_y),a
    ld ix,desksdata
    call check_collisions
    call safemovetotargetpos
    ret

try_move_down:
    ld a,DOWN
    ld (player_direction),a
    ld a,(playery)
    cp MAX_Y
    ret nc
    ld a,(targetpos_y)
    add a,PLAYER_SPEED_Y
    ld (targetpos_y),a
    ld ix,desksdata
    call check_collisions
    call safemovetotargetpos
    ret


