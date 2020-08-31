MUTTSKI_WIDTH equ 2 ;in bytes
MUTTSKI_HEIGHT equ 32 ;in lines
MUTTSKI_BOUNDING_BOX_OFFSET_X equ 1
MUTTSKI_BOUNDING_BOX_OFFSET_Y equ 15+8
MUTTSKI_BOUNDING_BOX_HEIGHT equ 5

MUTTSKI_FRAME_SIZE equ 48
MUTTSKI_ANIM_DELAY equ 3

MUTTSKI_WAITING_CHANCE equ 200
MUTTSKI_RESUME_PATROL_CHANCE equ 254
MUTTSKI_TEETH_CHANCE_1 equ 225


muttski_direction db DOWN
muttski_state db PATROL
muttski_desired_direction db BOB_GO_DOWN ;need to change this name. Not used for Bob only
muttski_current_frame db 0

muttski_anim_timer db 0
muttski_attack_timer db 0

muttskiy db 0
muttskix db 0

muttski_targetpos_x db 0
muttski_targetpos_y db 0

MUTTSKI_SPEED_X equ 1
MUTTSKI_SPEED_Y equ 4

collision_detected_muttski_locker db 0


; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
muttskisprite_up:
    ;frame0
    db %01100111, %11100110
    db %11110111, %11101111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %01101111, %11110110
    db %00011111, %11111000
    db %00011111, %11111000
    db %00001111, %11110000
    db %00000111, %11100000
    db %00001011, %11010000
    db %00001100, %00110000
    db %00011111, %11111000
    db %00011011, %11011000
    db %00001011, %11010000
    db %00000111, %11100000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000000, %00000000
    ;frame1
    db %01100111, %11100110
    db %11110111, %11101111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %01101111, %11110110
    db %00011111, %11111000
    db %00011111, %11111000
    db %00001111, %11110000
    db %00000111, %11100000
    db %00001011, %11010000
    db %00001100, %00110000
    db %00011111, %11110000
    db %00011011, %11000000
    db %00001011, %11000000
    db %00000111, %11100000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %00000000
    db %00000110, %00000000
    db %00000000, %00000000
    ;frame2
    db %01100111, %11100110
    db %11110111, %11101111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111111, %11111111
    db %01101111, %11110110
    db %00011111, %11111000
    db %00011111, %11111000
    db %00001111, %11110000
    db %00000111, %11100000
    db %00001011, %11010000
    db %00001100, %00110000
    db %00001111, %11111000
    db %00000011, %11011000
    db %00000011, %11010000
    db %00000111, %11100000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000000, %01100000
    db %00000000, %01100000
    db %00000000, %00000000
muttskisprite_down:
    ;frame0
    db %01100111, %11100110
    db %11110111, %11101111
    db %11111111, %11111111
    db %11111111, %11111111
    db %11111101, %10111111
    db %01101111, %11110110
    db %00001111, %11110000
    db %00001111, %11110000
    db %00011110, %01111000
    db %00011011, %11011000
    db %00001100, %00110000
    db %00000111, %11100000
    db %00001011, %11010000
    db %00011100, %00111000
    db %00011111, %11111000
    db %00011011, %11011000
    db %00011011, %11011000
    db %00000011, %11000000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00001110, %01110000
    db %00001110, %01110000
    ;frame1
    db %01100111, %11100100
    db %11110111, %11101110
    db %11111111, %11111110
    db %11111111, %11111110
    db %11111101, %10111100
    db %11111111, %11100100
    db %01101111, %11100000
    db %00011111, %11100000
    db %00010110, %01110000
    db %00011011, %11010000
    db %00001100, %00110000
    db %00000111, %11100000
    db %00000011, %11010000
    db %00000100, %00110000
    db %00000111, %11111000
    db %00000011, %11011000
    db %00000011, %11010000
    db %00000011, %11100000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %00000000
    db %00000110, %00000000
    ;frame3
    db %00100111, %11100110
    db %01110111, %11101111
    db %01111111, %11111111
    db %01111111, %11111111
    db %00111101, %10111111
    db %00100111, %11111111
    db %00000111, %11110110
    db %00000111, %11111000
    db %00001110, %01101000
    db %00001011, %11011000
    db %00001100, %00110000
    db %00000111, %11100000
    db %00001011, %11000000
    db %00001100, %00100000
    db %00011111, %11100000
    db %00011011, %11000000
    db %00001011, %11000000
    db %00000111, %11000000
    db %00000111, %11100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000110, %01100000
    db %00000000, %01100000
    db %00000000, %01100000
muttskisprite_left:
    ;frame0
    db %00111101, %11100110
    db %01111101, %11101111
    db %01111111, %11111111
    db %00111111, %11111111
    db %00000010, %10111111
    db %00011111, %11111011
    db %00111111, %11111000
    db %01101111, %11111000
    db %11111111, %11101000
    db %01111100, %00011000
    db %01111111, %11111000
    db %00000111, %11100000
    db %00001011, %11011000
    db %00001100, %00111000
    db %00001111, %11011000
    db %00001111, %11011000
    db %00001111, %11011000
    db %00001011, %11011000
    db %00000011, %11111000
    db %00000011, %01100000
    db %00000011, %01100000
    db %00000011, %01100000
    db %00011111, %11100000
    db %00011111, %11100000
    ;frame1
    db %00111101, %11100110
    db %01111101, %11101111
    db %01111111, %11111111
    db %00111111, %11111111
    db %00000010, %10111111
    db %00011111, %11111011
    db %00111111, %11111000
    db %01101111, %11111000
    db %11111111, %11101000
    db %01111100, %00011000
    db %01111111, %11111000
    db %00000111, %11100000
    db %00000011, %11010000
    db %00000100, %00111000
    db %00000111, %11011100
    db %00000111, %10111000
    db %00000111, %01110000
    db %00000111, %10100000
    db %00000111, %11000000
    db %00000011, %01100000
    db %00000011, %11111100
    db %00000000, %01101100
    db %00000011, %11101100
    db %00000011, %11100000
    ;frame2
    db %00111101, %11100110
    db %01111101, %11101111
    db %01111111, %11111111
    db %00111111, %11111111
    db %00000010, %10111111
    db %00011111, %11111011
    db %00111111, %11111000
    db %01101111, %11111000
    db %11111111, %11101000
    db %01111100, %00011000
    db %01111111, %11111000
    db %00000111, %11110000
    db %00001001, %11101000
    db %00011110, %00011100
    db %01111011, %11101110
    db %01100011, %11110111
    db %00000011, %11111011
    db %00000011, %11111010
    db %00000111, %11111000
    db %00001111, %00111100
    db %00001110, %00011110
    db %00001100, %00001111
    db %00111100, %00000111
    db %00111100, %00001110
muttskisprite_right:
    ;frame0
    db %01100111, %10111100
    db %11110111, %10111110
    db %11111111, %11111110
    db %11111111, %11111100
    db %11111101, %01000000
    db %11011111, %11111000
    db %00011111, %11111100
    db %00011111, %11110110
    db %00010111, %11111111
    db %00011000, %00111110
    db %00011111, %11111110
    db %00000111, %11100000
    db %00011011, %11010000
    db %00011100, %00110000
    db %00011011, %11110000
    db %00011011, %11110000
    db %00011011, %11110000
    db %00011011, %11010000
    db %00011111, %11000000
    db %00000110, %11000000
    db %00000110, %11000000
    db %00000110, %11000000
    db %00000111, %11111000
    db %00000111, %11111000
    ;frame1
    db %01100111, %10111100
    db %11110111, %10111110
    db %11111111, %11111110
    db %11111111, %11111100
    db %11111101, %01000000
    db %11011111, %11111000
    db %00011111, %11111100
    db %00011111, %11110110
    db %00010111, %11111111
    db %00011000, %00111110
    db %00011111, %11111110
    db %00000111, %11100000
    db %00001011, %11000000
    db %00011100, %00100000
    db %00111011, %11100000
    db %00011101, %11100000
    db %00001110, %11100000
    db %00000101, %11100000
    db %00000011, %11100000
    db %00000110, %11000000
    db %00111111, %11000000
    db %00110110, %00000000
    db %00110111, %11000000
    db %00000111, %11000000
    ;frame2
    db %01100111, %10111100
    db %11110111, %10111110
    db %11111111, %11111110
    db %11111111, %11111100
    db %11111101, %01000000
    db %11011111, %11111000
    db %00011111, %11111100
    db %00011111, %11110110
    db %00010111, %11111111
    db %00011000, %00111110
    db %00011111, %11111110
    db %00001111, %11100000
    db %00010111, %10010000
    db %00111000, %01111000
    db %01110111, %11011110
    db %11101111, %11000110
    db %11011111, %11000000
    db %01011111, %11000000
    db %00011111, %11100000
    db %00111100, %11110000
    db %01111000, %01110000
    db %11110000, %00110000
    db %11100000, %00111100
    db %01110000, %00111100


;

muttski_draw:
    call drawmuttski
    ret





drawmuttski:
    ld a,(muttski_direction)
    cp UP
    jp z, drawmuttski_up
    cp DOWN
    jp z, drawmuttski_down
    cp LEFT
    jp z, drawmuttski_left
    cp RIGHT
    jp z, drawmuttski_right
drawmuttski_up:
    ld a,(muttski_current_frame)
    cp 0
    jp z,dmu0
    cp 1
    jp z,dmu1
    cp 2
    jp z,dmu2
    cp 3
    jp z,dmu3
dmu0:
    ld bc,muttskisprite_up
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmu1:
    ld bc,muttskisprite_up+(MUTTSKI_FRAME_SIZE*1)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmu2:
    ld bc,muttskisprite_up
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmu3:
    ld bc,muttskisprite_up+(MUTTSKI_FRAME_SIZE*2)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
drawmuttski_down:
    ld a,(muttski_current_frame)
    cp 0
    jp z,dmd0
    cp 1
    jp z,dmd1
    cp 2
    jp z,dmd2
    cp 3
    jp z,dmd3
dmd0:
    ld bc,muttskisprite_down
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmd1:
    ld bc,muttskisprite_down+(MUTTSKI_FRAME_SIZE*1)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmd2:
    ld bc,muttskisprite_down
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmd3:
    ld bc,muttskisprite_down+(MUTTSKI_FRAME_SIZE*2)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
drawmuttski_left:
    ld a,(muttski_current_frame)
    cp 0
    jp z,dml0
    cp 1
    jp z,dml1
    cp 2
    jp z,dml2
    cp 3
    jp z,dml3
dml0:
    ld bc,muttskisprite_left
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dml1:
    ld bc,muttskisprite_left+(MUTTSKI_FRAME_SIZE*1)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dml2:
    ld bc,muttskisprite_left
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dml3:
    ld bc,muttskisprite_left+(MUTTSKI_FRAME_SIZE*2)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
drawmuttski_right:
    ld a,(muttski_current_frame)
    cp 0
    jp z,dmr0
    cp 1
    jp z,dmr1
    cp 2
    jp z,dmr2
    cp 3
    jp z,dmr3
dmr0:
    ld bc,muttskisprite_right
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmr1:
    ld bc,muttskisprite_right+(MUTTSKI_FRAME_SIZE*1)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmr2:
    ld bc,muttskisprite_right
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
dmr3:
    ld bc,muttskisprite_right+(MUTTSKI_FRAME_SIZE*2)
    ld de,(muttskiy)
    call drawsprite16_24
    jp drawmuttski_end
drawmuttski_end:
    ret









;
;
;
;
;;;;; Collision...



; ;sets targetpos back to muttski pos
muttski_reset_collisions_check:
    ;reset targetpos
    ld a,(muttskix)
    ld (muttski_targetpos_x),a
    ld a,(muttskiy)
    ld (muttski_targetpos_y),a

    ;reset collision bool
    xor a
    ld (collision_detected_muttski_locker),a ;collision bool = 0
    ret
;



;IX=objectdata
;DE=object data length
check_collisions_muttski_locker:
    ;if tx+tw<dx -skip 
    ;if dx+dw<tx -skip
    ;if ty+th<dy -skip
    ;if dy+dh<ty -skip
    ;else -set bool true and ret
    ld a,(ix)
    cp 255 
    ret z ;if ix=255

    ld a,(muttski_targetpos_x)
    add a,MUTTSKI_WIDTH
    sub MUTTSKI_BOUNDING_BOX_OFFSET_X
    ld b,(ix+1)
    cp b 
    jp c, checkcoll_muttskilocker_gonextobject ;if tx+tw<dx -skip 

    ld a,(muttski_targetpos_x)
    add a,MUTTSKI_BOUNDING_BOX_OFFSET_X
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, checkcoll_muttskilocker_gonextobject ;if dx+dw<tx -skip 


    ld a,(muttski_targetpos_y)
    add a,MUTTSKI_BOUNDING_BOX_HEIGHT
    add a,MUTTSKI_BOUNDING_BOX_OFFSET_Y
    ld b,(ix+2)
    cp b
    jp c, checkcoll_muttskilocker_gonextobject ;if ty+th<dy -skip


    ld a,(muttski_targetpos_y)
    add a,MUTTSKI_BOUNDING_BOX_OFFSET_Y
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, checkcoll_muttskilocker_gonextobject ;if dy+dh<ty -skip

    ;else, we have collided...
    ld a,TRUE
    ld (collision_detected_muttski_locker),a
    ret
checkcoll_muttskilocker_gonextobject:
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp check_collisions_muttski_locker
;





;sets muttski pos to targetpos (as long as collision not detected)
muttski_safemovetotargetpos:
    ld a,(collision_detected_muttski_locker)
    cp TRUE
    ret z ;if collision was detected dont move to target
    ld a,(muttski_targetpos_x)
    ld (muttskix),a
    ld a,(muttski_targetpos_y)
    ld (muttskiy),a
    ret
;








muttski_do_anim_timer:
    ld a,(muttski_anim_timer)
    inc a
    ld (muttski_anim_timer),a
    cp MUTTSKI_ANIM_DELAY
    jp nc, muttski_skip_to_next_frame
    ret
muttski_skip_to_next_frame:
    ld a,(muttski_current_frame)
    cp 0
    jp z, muttski_setframe1
    cp 1
    jp z,muttski_setframe2
    cp 2
    jp z,muttski_setframe3
    cp 3
    jp z,muttski_setframe0
    xor a
    ld (muttski_anim_timer),a
    ret

muttski_setframe0:
    xor a
    ld (muttski_current_frame),a
    ret

muttski_setframe1:
    ld a,1
    ld (muttski_current_frame),a
    ret

muttski_setframe2:
    ld a,2
    ld (muttski_current_frame),a
    ret

muttski_setframe3:
    ld a,3
    ld (muttski_current_frame),a
    ret
