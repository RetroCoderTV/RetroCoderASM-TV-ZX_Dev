PLAYER_WIDTH equ 2 ;in bytes
PLAYER_HEIGHT equ 24 ;in lines
PLAYER_BOUNDING_BOX_OFFSET_X equ 1
PLAYER_BOUNDING_BOX_OFFSET_Y equ 15
PLAYER_BOUNDING_BOX_HEIGHT equ 5

PLAYER_FRAME_SIZE equ 48
PLAYER_ANIM_DELAY equ 3
PLAYER_ATTACK_DURATION equ 25

player_direction db UP
player_state db ATTACK
player_current_frame db 0

player_anim_timer db 0
player_attack_timer db 0

playery db 0
playerx db 0

targetpos_x db 0
targetpos_y db 0

PLAYER_SPEED_X equ 1
PLAYER_SPEED_Y equ 4

collision_detected db 0
collision_detected_door db 0
collision_detected_stool db 0
collision_detected_heart db 0

hearts_collected db 0
current_heart_seat db 0
;




; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite_up:
    ;up0
    db %00000111, %11010000
    db %00001000, %00101000
    db %00010001, %00010000
    db %00010010, %01100000
    db %00010010, %10100000
    db %00010000, %10100000
    db %00001000, %10100000
    db %00000111, %11000000
    db %00011111, %11110000
    db %00111111, %11111000
    db %01111000, %00111000
    db %01001111, %11100100
    db %01111111, %11111100
    db %01001111, %11100100
    db %01000111, %11000100
    db %01000111, %11000100
    db %00111111, %11111000
    db %00001110, %11100000
    db %00001100, %01100000
    db %00001110, %11100000
    db %00001110, %11100000
    db %00010010, %10010000
    db %00100010, %10001000
    db %00111110, %11111000
    ;up1
    db %00001011, %11000000
    db %00010101, %00100000
    db %00010000, %00010000
    db %00001100, %10010000
    db %00001010, %01010000
    db %00001101, %01010000
    db %00010001, %00100000
    db %00001001, %11000000
    db %00000111, %11110000
    db %00001111, %11111000
    db %00011110, %00011100
    db %00010011, %11110100
    db %00011111, %11111100
    db %00010001, %11100100
    db %00001000, %11101000
    db %00001000, %11110000
    db %00001111, %11100000
    db %00011110, %11100000
    db %00011100, %01110000
    db %00001110, %11110000
    db %00001001, %11100000
    db %00010001, %00100000
    db %00001111, %00010000
    db %00000001, %11110000
    ;up2
    db %00000011, %11010000
    db %00000100, %10101000
    db %00001000, %00001000
    db %00001001, %00110000
    db %00001010, %01010000
    db %00001010, %10110000
    db %00000100, %10001000
    db %00000011, %10010000
    db %00001111, %11100000
    db %00011111, %11110000
    db %00111000, %01111000
    db %00101111, %11001000
    db %00111111, %11111000
    db %00100111, %10001000
    db %00010111, %00010000
    db %00001111, %00010000
    db %00000111, %11110000
    db %00000111, %01111000
    db %00001110, %00111000
    db %00001111, %01110000
    db %00000111, %10010000
    db %00000101, %10001000
    db %00001000, %11110000
    db %00001111, %10000000
playersprite_down:
    ;down0
    db %00010111, %11000000
    db %00101000, %00100000
    db %00100000, %10010000
    db %00011011, %11010000
    db %00001100, %00110000
    db %00001010, %10010000
    db %00001000, %00100000
    db %00000101, %10100000
    db %00011100, %01110000
    db %00111111, %11111000
    db %01111100, %01111000
    db %01001100, %01100100
    db %01111100, %01111100
    db %01001110, %11100100
    db %01000110, %11000100
    db %01000111, %11000100
    db %00111111, %11111000
    db %00001110, %11100000
    db %00001100, %01100000
    db %00001110, %11100000
    db %00001110, %11100000
    db %00010010, %10010000
    db %00100010, %10001000
    db %00111110, %11111000
    ;down1
    db %00000101, %11100000
    db %00001010, %00010000
    db %00001000, %10001000
    db %00000111, %11101000
    db %00000100, %00101000
    db %00000110, %10011000
    db %00000100, %00001000
    db %00000101, %10010000
    db %00000010, %00100000
    db %00001111, %11110000
    db %00011100, %01111000
    db %00010110, %01100100
    db %00011110, %01111100
    db %00010010, %11000100
    db %00001010, %10001000
    db %00000111, %10001000
    db %00001111, %11110000
    db %00011110, %11100000
    db %00011100, %01110000
    db %00100100, %11110000
    db %00100101, %11100000
    db %00100101, %00100000
    db %00011000, %10010000
    db %00000000, %01110000
    ;down2
    db %00000111, %10100000
    db %00001000, %01010000
    db %00010001, %00010000
    db %00010111, %11100000
    db %00010100, %00100000
    db %00011001, %01100000
    db %00010000, %00100000
    db %00001001, %10100000
    db %00000100, %01000000
    db %00001111, %11110000
    db %00011110, %00111000
    db %00100110, %01101000
    db %00111110, %01111000
    db %00100011, %01001000
    db %00010001, %01010000
    db %00010001, %11100000
    db %00001111, %11110000
    db %00000111, %01111000
    db %00001110, %00111000
    db %00001111, %00100100
    db %00000111, %10100100
    db %00000100, %10100100
    db %00001001, %00011000
    db %00001110, %00000000
playersprite_left:
    ;left0
    db %00000000, %00000000
    db %00001011, %11000000
    db %00010100, %00100000
    db %00010000, %01010000
    db %00001111, %10010000
    db %00000100, %01010000
    db %00000101, %00110000
    db %00001000, %00010000
    db %00000111, %00100000
    db %00000010, %01000000
    db %00001101, %11100000
    db %00010011, %10110000
    db %00010000, %01010000
    db %00001100, %00100000
    db %00000111, %11100000
    db %00000101, %11100000
    db %00000100, %11100000
    db %00000111, %11100000
    db %00001111, %11110000
    db %00001110, %11101000
    db %00000111, %11001000
    db %00000100, %10101000
    db %00001001, %00010000
    db %00001110, %00000000
    ;left1
    db %00000000, %00000000
    db %00000101, %11100000
    db %00001010, %00010000
    db %00001000, %00101000
    db %00000111, %11001000
    db %00000010, %00101000
    db %00000010, %10011000
    db %00000100, %00001000
    db %00000011, %10010000
    db %00000001, %00100000
    db %00000000, %11110000
    db %00000011, %01111000
    db %00000110, %11100100
    db %00011010, %10011100
    db %00100010, %10000100
    db %00100110, %11000100
    db %00011010, %01111000
    db %00000011, %11110000
    db %00000111, %11111000
    db %00000111, %01110100
    db %00000011, %11100100
    db %00000010, %01010100
    db %00000100, %10001000
    db %00000111, %00000000
    ;left2
    db %00001011, %11000000
    db %00010100, %00100000
    db %00010000, %01010000
    db %00001111, %10010000
    db %00000100, %01010000
    db %00000101, %00110000
    db %00001000, %00010000
    db %00000111, %00100000
    db %00000010, %01000000
    db %00000001, %11100000
    db %00000010, %11110000
    db %00000010, %10010000
    db %00000100, %11110000
    db %00000100, %10010000
    db %00000101, %00100000
    db %00000111, %00100000
    db %00000011, %11100000
    db %00000011, %11000000
    db %00000011, %10000000
    db %00000001, %11000000
    db %00000001, %11000000
    db %00000010, %01000000
    db %00000100, %01000000
    db %00000111, %11000000
playersprite_right:
    ;right0
    db %00000111, %10100000
    db %00001000, %01010000
    db %00010100, %00010000
    db %00010011, %11100000
    db %00010100, %01000000
    db %00011001, %01000000
    db %00010000, %00100000
    db %00001001, %11000000
    db %00000100, %10000000
    db %00001111, %00000000
    db %00011110, %10000000
    db %00010010, %10000000
    db %00011110, %01000000
    db %00010010, %01000000
    db %00001001, %01000000
    db %00001001, %11000000
    db %00001111, %10000000
    db %00000111, %10000000
    db %00000011, %10000000
    db %00000111, %00000000
    db %00000111, %00000000
    db %00000100, %10000000
    db %00000100, %01000000
    db %00000111, %11000000
    ;right1
    db %00000000, %00000000
    db %00000111, %10100000
    db %00001000, %01010000
    db %00010100, %00010000
    db %00010011, %11100000
    db %00010100, %01000000
    db %00011001, %01000000
    db %00010000, %00100000
    db %00001001, %11000000
    db %00000100, %10000000
    db %00001111, %00000000
    db %00011110, %11000000
    db %00100111, %01100000
    db %00111001, %01011000
    db %00100001, %01000100
    db %00100011, %01100100
    db %00011110, %01011000
    db %00001111, %11000000
    db %00011111, %11100000
    db %00101110, %11100000
    db %00100111, %11000000
    db %00101010, %01000000
    db %00010001, %00100000
    db %00000000, %11100000
    ;right2
    db %00000000, %00000000
    db %00000011, %11010000
    db %00000100, %00101000
    db %00001010, %00001000
    db %00001001, %11110000
    db %00001010, %00100000
    db %00001100, %10100000
    db %00001000, %00010000
    db %00000100, %11100000
    db %00000010, %01000000
    db %00000111, %10110000
    db %00001101, %11001000
    db %00001010, %00001000
    db %00000100, %00110000
    db %00000111, %11100000
    db %00000111, %10100000
    db %00000111, %00100000
    db %00000111, %11100000
    db %00001111, %11110000
    db %00010111, %01110000
    db %00010011, %11100000
    db %00010101, %00100000
    db %00001000, %10010000
    db %00000000, %01110000


playersprite_attack_left:
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000011, %11010000
    db %00000100, %00101000
    db %00001010, %00001000
    db %00001001, %11110000
    db %00001010, %00100000
    db %00001100, %10100000
    db %00001000, %00010000
    db %00001100, %11100000
    db %00011110, %01000000
    db %00101111, %10000000
    db %00100110, %10000000
    db %00010010, %10000000
    db %00011010, %10000000
    db %00011100, %10000000
    db %00011111, %00000000
    db %00001111, %10110000
    db %00000011, %11001000
    db %00000001, %10010000
    db %00000000, %10100000
    db %00000000, %01000000
    db %00000000, %00000000

playersprite_attack_right:
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000000, %00000000
    db %00001011, %11000000
    db %00010100, %00100000
    db %00010000, %01010000
    db %00001111, %10010000
    db %00000100, %01010000
    db %00000101, %00110000
    db %00001000, %00010000
    db %00000111, %00110000
    db %00000010, %01111000
    db %00000001, %11110100
    db %00000001, %01100100
    db %00000001, %01001000
    db %00000001, %01011000
    db %00000001, %00111000
    db %00000000, %11111000
    db %00001101, %11110000
    db %00010011, %11000000
    db %00001001, %10000000
    db %00000101, %00000000
    db %00000010, %00000000
    db %00000000, %00000000
playersprite_sit:
    ;sit0
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000111, %11010000
    db %00001000, %00101000
    db %00010001, %00010000
    db %00010010, %01100000
    db %00010010, %10100000
    db %00010000, %10100000
    db %00001000, %10100000
    db %00000111, %11000000
    db %00011111, %11110000
    db %00111111, %11111000
    db %01111000, %00111000
    db %01001111, %11100100
    db %01111111, %11111100
    db %01001111, %11100100
    db %01000111, %11000100
    db %01000111, %11000100
    db %00111111, %11111000
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000000, %00000000
    db %00000000, %00000000
;


check_sit_keypress:
    ld a,(keypressed_F)
    cp TRUE
    call z, set_state_sit

    ld a,(keypressed_W)
    cp TRUE
    call z, set_state_standard
    ret

check_attack_keypress:
    ld a,(keypressed_F)
    cp TRUE
    call z, set_state_attack
    call nz, set_state_standard
    ret



player_draw:

    call paintplayer_16_24
    call drawplayer
    ret

;sets targetpos back to player pos
reset_collisions_check:
    ;reset targetpos
    ld a,(playerx)
    ld (targetpos_x),a
    ld a,(playery)
    ld (targetpos_y),a

    ;reset collision bool
    xor a
    ld (collision_detected),a ;collision bool = 0
    ret
;


;IX=objectdata
;DE=object data length
check_collisions_desk:
    ;if tx+tw<dx -skip 
    ;if dx+dw<tx -skip
    ;if ty+th<dy -skip
    ;if dy+dh<ty -skip
    ;else -set bool true and ret
    ld a,(ix)
    cp 255 
    ret z ;if ix=255

    ld a,(targetpos_x)
    add a,PLAYER_WIDTH
    sub PLAYER_BOUNDING_BOX_OFFSET_X
    ld b,(ix+1)
    cp b 
    jp c, checkcolldesk_gonextobject ;if tx+tw<dx -skip 

    ld a,(targetpos_x)
    add a,PLAYER_BOUNDING_BOX_OFFSET_X
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, checkcolldesk_gonextobject ;if dx+dw<tx -skip 


    ld a,(targetpos_y)
    add a,PLAYER_BOUNDING_BOX_HEIGHT
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    ld b,(ix+2)
    cp b
    jp c, checkcolldesk_gonextobject ;if ty+th<dy -skip


    ld a,(targetpos_y)
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, checkcolldesk_gonextobject ;if dy+dh<ty -skip

    ;else, we have collided...
    ld a,TRUE
    ld (collision_detected),a
    ret
checkcolldesk_gonextobject:
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp check_collisions_desk
;

; If A == N, then Z flag is set.
; If A != N, then Z flag is reset.
; If A < N, then C flag is set.
; If A >= N, then C flag is reset.


check_collision_player_door:
    ld a,FALSE
    ld (collision_detected_door),a
    ;px+pw<dx
    ;dx+dw<px
    ;if py+ph<dy -skip
    ;if dy+dh<py -skip
    ld a,(doorx)
    ld b,a
    ld a,(playerx)
    cp b
    ret c

    ld a,(playerx)
    add a,PLAYER_WIDTH
    ld b,a
    ld a,(doorx)
    add a,DOOR_WIDTH
    cp b
    ret c
    
    ld a,(doory)
    ld b,a
    ld a,(playery)
    add a,PLAYER_HEIGHT
    cp b
    ret c

    ld a,(doory)
    add a,DOOR_HEIGHT
    ld b,a
    ld a,(playery)
    add a,PLAYER_HEIGHT/2
    cp b
    ret nc

    ;else, we collided....
    ld a,TRUE
    ld (collision_detected_door),a

    ret




;IX=desks pointer
check_collisions_player_stool:
    ;no collision if...
    ;px+pw<dx
    ;dx+dw<px
    ;py+ph<dy 
    ;dy+dh<py

    ld a,(ix)
    cp 255 
    ret z ;if ix=255
    
    ld a,FALSE
    ld (collision_detected_stool),a


    ld a,(playerx)
    ; add a,PLAYER_BOUNDING_BOX_OFFSET_X
    push af
    ld a,(ix+1)
    add a,DESK_STOOL_OFFSET_X
    ld b,a
    pop af    
    cp b ;is A < B ?
    jp c, checkcollstool_gonextstool ;if tx+tw<dx -skip 

    ld a,(playerx)
    add a,PLAYER_WIDTH
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    sub DESK_STOOL_OFFSET_X
    cp b
    jp c, checkcollstool_gonextstool ;if dx+dw<tx -skip 


    ld a,(playery)
    add a,PLAYER_BOUNDING_BOX_HEIGHT
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    push af
    ld a,(ix+2)
    add a,DESK_STOOL_OFFSET_Y
    ld b,a
    pop af
    cp b
    jp c, checkcollstool_gonextstool ;if ty+th<dy -skip


    ld a,(playery)
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y+8
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    add a,DESK_STOOL_OFFSET_Y
    cp b
    jp c, checkcollstool_gonextstool ;if dy+dh<ty -skip

    ;else, we have collided...
    ld a,TRUE
    ld (collision_detected_stool),a

    ; if we are sitting, collect heart
    ld a,(player_state)
    cp SIT
    ret nz
    ld a,(ix)
    ld (current_heart_seat),a
    ld iy,l1_hearts
    call collect_heart

    ret
checkcollstool_gonextstool:
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp check_collisions_player_stool
;










;IX=lockers data
check_collisions_lockers:
    ;if tx+tw<dx -skip 
    ;if dx+dw<tx -skip
    ;if ty+th<dy -skip
    ;if dy+dh<ty -skip
    ;else -set bool true and ret
    ld a,(ix)
    cp 255 
    ret z ;if ix=255

    ld a,(targetpos_x)
    add a,PLAYER_WIDTH
    sub PLAYER_BOUNDING_BOX_OFFSET_X
    ld b,(ix+1)
    cp b 
    jp c, checkcolllockers_gonextobject ;if tx+tw<dx -skip 

    ld a,(targetpos_x)
    add a,PLAYER_BOUNDING_BOX_OFFSET_X
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, checkcolllockers_gonextobject ;if dx+dw<tx -skip 


    ld a,(targetpos_y)
    add a,PLAYER_BOUNDING_BOX_HEIGHT
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    ld b,(ix+2)
    cp b
    jp c, checkcolllockers_gonextobject ;if ty+th<dy -skip


    ld a,(targetpos_y)
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, checkcolllockers_gonextobject ;if dy+dh<ty -skip

    ;else, we have collided...
    ld a,TRUE
    ld (collision_detected),a
    ret
checkcolllockers_gonextobject:
    ld de,LOCKER_DATA_LENGTH
    add ix,de
    jp check_collisions_lockers
;




;ix=lockers
checkcollisions_lockertrigger:
        ;no collision if...
    ;px+pw<dx
    ;dx+dw<px
    ;py+ph<dy 
    ;dy+dh<py

    ld a,(ix)
    cp 255 
    ret z ;if ix=255
    
    ld a,(playerx)
    push af
    ld a,(ix+1)
    add a,LOCKER_TRIGGER_OFFSET_X
    ld b,a
    pop af    
    cp b ;is A < B ?
    jp c, checkcoll_lockertrigger_gonext ;if tx+tw<dx -skip 

    ld a,(playerx)
    add a,PLAYER_WIDTH
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    sub LOCKER_TRIGGER_OFFSET_X
    cp b
    jp c, checkcoll_lockertrigger_gonext ;if dx+dw<tx -skip 


    ld a,(playery)
    add a,PLAYER_BOUNDING_BOX_HEIGHT
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y
    push af
    ld a,(ix+2)
    add a,LOCKER_TRIGGER_OFFSET_Y
    ld b,a
    pop af
    cp b
    jp c, checkcoll_lockertrigger_gonext ;if ty+th<dy -skip


    ld a,(playery)
    add a,PLAYER_BOUNDING_BOX_OFFSET_Y+8
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    add a,LOCKER_TRIGGER_OFFSET_Y
    cp b
    jp c, checkcoll_lockertrigger_gonext ;if dy+dh<ty -skip

    ;else, we have collided...
    ; ld a,TRUE
    ; ld (collision_detected_stool),a

    ; if we are facing up and press F, call collectheartfromlocker routine
    ld a,(player_direction)
    cp UP
    ret nz
    call collectheartfromlocker
    call setborderpink

    ret
checkcoll_lockertrigger_gonext:
    ld de,LOCKER_DATA_LENGTH
    add ix,de
    jp checkcollisions_lockertrigger
;


collectheartfromlocker:
    ld a,(ix)
    dec a
    ld (ix),a
    ret


















collect_heart:
    ld a,(iy)
    cp 255
    ret z
    ld a,(iy)
    cp 0
    jp z,collect_gonextheart
    ld a,(current_heart_seat)
    cp (iy)
    jp nz, collect_gonextheart
    ;we sat down next to a heart...
    xor a
    ld (iy),a

    ld ix,hearticons
    call ui_add_heart

    ld a,(hearts_collected)
    inc a
    ld (hearts_collected),a  
    ret
collect_gonextheart:
    ld de,HEART_DATA_LENGTH
    inc iy
    jp collect_heart







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
;






drawplayer:
    ;if sitting, set sprite to seated, and return
    ld a,(player_state)
    cp SIT
    jp nz,not_sitting
    ld bc,playersprite_sit
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
not_sitting:
    ld a,(player_direction)
    cp UP
    jp z, drawplayer_up
    cp DOWN
    jp z, drawplayer_down
    cp LEFT
    jp z, drawplayer_left
    cp RIGHT
    jp z, drawplayer_right
drawplayer_up:
    ld a,(player_current_frame)
    cp 0
    jp z,dpu0
    cp 1
    jp z,dpu1
    cp 2
    jp z,dpu2
    cp 3
    jp z,dpu3
dpu0:
    ld bc,playersprite_up
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpu1:
    ld bc,playersprite_up+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpu2:
    ld bc,playersprite_up
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpu3:
    ld bc,playersprite_up+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
drawplayer_down:
    ld a,(player_current_frame)
    cp 0
    jp z,dpd0
    cp 1
    jp z,dpd1
    cp 2
    jp z,dpd2
    cp 3
    jp z,dpd3
dpd0:
    ld bc,playersprite_down
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpd1:
    ld bc,playersprite_down+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpd2:
    ld bc,playersprite_down
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpd3:
    ld bc,playersprite_down+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
drawplayer_left:
    ld a,(player_state)
    cp ATTACK
    jp z,dpla
    ld a,(player_current_frame)
    cp 0
    jp z,dpl0
    cp 1
    jp z,dpl1
    cp 2
    jp z,dpl2
    cp 3
    jp z,dpl3
dpla:
    ld bc,playersprite_attack_left
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpl0:
    ld bc,playersprite_left+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpl1:
    ld bc,playersprite_left+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpl2:
    ld bc,playersprite_left+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpl3:
    ld bc,playersprite_left
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
drawplayer_right:
    ld a,(player_state)
    cp ATTACK
    jp z,dpra
    ld a,(player_current_frame)
    cp 0
    jp z,dpr0
    cp 1
    jp z,dpr1
    cp 2
    jp z,dpr2
    cp 3
    jp z,dpr3
dpra:
    ld bc,playersprite_attack_right
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpr0:
    ld bc,playersprite_right
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpr1:
    ld bc,playersprite_right+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpr2:
    ld bc,playersprite_right
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
dpr3:
    ld bc,playersprite_right+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_end
drawplayer_end:
    ret









anim_timer:
    ld a,(player_anim_timer)
    inc a
    ld (player_anim_timer),a
    cp PLAYER_ANIM_DELAY
    jp nc, skip_to_next_frame
    ret
skip_to_next_frame:
    ld a,(player_current_frame)
    cp 0
    jp z, setframe1
    cp 1
    jp z,setframe2
    cp 2
    jp z,setframe3
    cp 3
    jp z,setframe0
    xor a
    ld (player_anim_timer),a
    ret

setframe0:
    xor a
    ld (player_current_frame),a
    ret

setframe1:
    ld a,1
    ld (player_current_frame),a
    ret

setframe2:
    ld a,2
    ld (player_current_frame),a
    ret

setframe3:
    ld a,3
    ld (player_current_frame),a
    ret

set_state_standard:
    ld a,STANDARD
    ld (player_state),a
    ret

set_state_attack:
    ld a,ATTACK
    ld (player_state),a
    ret

set_state_sit:
    ld a,SIT
    ld (player_state),a
    ret





