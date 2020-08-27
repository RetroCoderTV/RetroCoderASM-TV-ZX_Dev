BOB_WIDTH equ 2 ;in bytes
BOB_HEIGHT equ 32 ;in lines
BOB_BOUNDING_BOX_OFFSET_X equ 1
BOB_BOUNDING_BOX_OFFSET_Y equ 15+8
BOB_BOUNDING_BOX_HEIGHT equ 5

BOB_FRAME_SIZE equ 64
BOB_ANIM_DELAY equ 3

BOB_MIDDLE_CHANCE_TOP equ 150
BOB_MIDDLE_CHANCE_BOTTOM equ 50


bob_direction db DOWN
bob_state db STANDARD
bob_desired_direction db BOB_GO_DOWN
bob_current_frame db 0

bob_anim_timer db 0
bob_attack_timer db 0

boby db 0
bobx db 0

bob_targetpos_x db 0
bob_targetpos_y db 0

BOB_SPEED_X equ 1
BOB_SPEED_Y equ 4

collision_detected_bob_desk db 0




bobsprite_up:
    ;up0
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111000, %00111000
    db %00111100, %01111000
    db %00101111, %11101000
    db %00011111, %11110000
    db %00001111, %11100000
    db %00001011, %10100000
    db %00011100, %01110000
    db %00111011, %10111000
    db %01111011, %10111100
    db %01111011, %10111100
    db %01111011, %10111100
    db %01011011, %10110100
    db %01010011, %10110100
    db %01010011, %10110100
    db %01010011, %10110100
    db %01010011, %10110100
    db %01011011, %10110100
    db %00110111, %11011000
    db %00010000, %00010000
    db %00010000, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00111110, %11111000
    db %01111100, %01111100
    ;up1
    db %00000000, %00000000
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111000, %00111000
    db %00111100, %01111000
    db %00101111, %11101000
    db %00011111, %11110000
    db %00001111, %11100000
    db %00001011, %10100000
    db %00011100, %01110000
    db %00111011, %11110000
    db %01111011, %10111000
    db %01111011, %10111000
    db %01111111, %10101000
    db %10010011, %10101000
    db %10010011, %01101000
    db %10010011, %01110000
    db %01010011, %01100000
    db %01011111, %01100000
    db %00110111, %01100000
    db %00101111, %11100000
    db %01000000, %00100000
    db %10000110, %00100000
    db %10011001, %00010000
    db %10001101, %00010000
    db %01011100, %10010000
    db %00111100, %10010000
    db %00011101, %00010000
    db %00001101, %00100000
    db %00000001, %11110000
    db %00000001, %11111000
    ;up2
    


    db %00000000, %00000000
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111000, %00111000
    db %00111100, %01111000
    db %00101111, %11101000
    db %00011111, %11110000
    db %00001111, %11100000
    db %00001011, %10100000
    db %00011100, %01110000
    db %00011111, %10111000
    db %00111011, %10111100
    db %00111011, %10111100
    db %00101011, %10111100
    db %00101011, %10110010
    db %00101101, %10110010
    db %00011101, %11010010
    db %00001101, %11010100
    db %00001101, %11010100
    db %00001101, %11111000
    db %00001111, %11001000
    db %00001000, %00000100
    db %00001000, %11000010
    db %00010001, %00110010
    db %00010001, %01100010
    db %00010010, %01110100
    db %00010010, %01111000
    db %00010001, %01110000
    db %00001001, %01100000
    db %00011111, %00000000
    db %00111111, %00000000
bobsprite_down:
    ;down0
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111111, %11111000
    db %00101010, %10101000
    db %00101110, %11101000
    db %00010011, %00010000
    db %00010000, %00010000
    db %00001011, %10100000
    db %00011100, %01110000
    db %00111011, %10111000
    db %01111010, %10111100
    db %01111010, %10111100
    db %01111010, %11111111
    db %01011011, %10010101
    db %01011011, %10010101
    db %01011011, %10010101
    db %01011011, %10010101
    db %01001011, %11100111
    db %01001011, %10100100
    db %00110111, %11011000
    db %00010000, %00010000
    db %00010000, %00010000
    db %00010001, %10010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00111110, %11111000
    db %01111100, %01111100
    ;down1
    db %00000000, %00000000
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111111, %11111000
    db %00101010, %10101000
    db %00101110, %11101000
    db %00010011, %00010000
    db %00010000, %00011000
    db %00011011, %10111000
    db %00110100, %01111100
    db %00110111, %10111110
    db %00110101, %10111110
    db %01010101, %11111110
    db %10010111, %00001110
    db %10010111, %00001010
    db %01110111, %00110010
    db %00010111, %01000100
    db %00010110, %11001000
    db %00011110, %11110000
    db %00011110, %11110000
    db %00100011, %11100000
    db %01000000, %00100000
    db %10000110, %00010000
    db %10001001, %00001000
    db %10010110, %10000100
    db %01000110, %01000100
    db %00111110, %01000100
    db %00001110, %01001000
    db %00001110, %10010000
    db %00000110, %11111000
    db %00000000, %11111100
    ;down2
    db %00000000, %00000000
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111111, %11111000
    db %00101010, %10101000
    db %00101110, %11101000
    db %00010011, %00010000
    db %00110000, %00010000
    db %00111011, %10110000
    db %01111100, %01011000
    db %11111011, %11011000
    db %11111011, %01011000
    db %11111011, %01011100
    db %11111101, %11010110
    db %10111101, %11010110
    db %10011101, %11010110
    db %01000101, %11010100
    db %00100110, %11011100
    db %00011110, %11110000
    db %00011110, %11110000
    db %00001111, %10001000
    db %00001000, %00000100
    db %00010000, %11000010
    db %00100001, %00100010
    db %01000010, %11010010
    db %01000100, %11000100
    db %01000100, %11111000
    db %00100100, %11100000
    db %00010010, %11100000
    db %00111110, %11000000
    db %01111110, %00000000
bobsprite_left:
    ;left0
    db %00000000, %11111000
    db %00000001, %00001100
    db %00000001, %00001110
    db %00000001, %11111110
    db %00000001, %01001010
    db %00000011, %11001010
    db %00000010, %00000010
    db %00000001, %00000100
    db %00000001, %11000100
    db %00000000, %10001000
    db %00000000, %11111000
    db %00000001, %11001100
    db %00000001, %10111100
    db %00000001, %10111100
    db %00000001, %10100100
    db %00000011, %11100111
    db %00000011, %10100101
    db %00000011, %10100101
    db %00000011, %10100101
    db %00000011, %11001101
    db %00000011, %11001111
    db %00000001, %00111000
    db %00000001, %00001000
    db %00000001, %00010000
    db %00000001, %00010000
    db %00000001, %00100000
    db %00000001, %00010000
    db %00000000, %10010000
    db %00000000, %10010000
    db %00000000, %10010000
    db %00000001, %11110000
    db %00000011, %11100000
    ;left1
    db %00000000, %11111000
    db %00000001, %00001100
    db %00000001, %00001110
    db %00000001, %11111110
    db %00000001, %01001010
    db %00000011, %11001010
    db %00000010, %00000010
    db %00000001, %00000100
    db %00000001, %11000100
    db %00000000, %10001000
    db %00000000, %11111000
    db %00000001, %11001100
    db %00000001, %10110100
    db %00000001, %10111100
    db %00000011, %11001110
    db %00000010, %01001010
    db %00000010, %01001010
    db %00000011, %10001010
    db %00000010, %00011010
    db %00000010, %01111110
    db %00000001, %11111100
    db %00001111, %01110000
    db %00010001, %00010000
    db %00100101, %00100000
    db %11100111, %00100000
    db %11100101, %00100000
    db %01111100, %10010000
    db %00111000, %10001000
    db %00000000, %01001100
    db %00000000, %00101100
    db %00000000, %01111100
    db %00000000, %11111000
    ;left2
    db %00000000, %11111000
    db %00000001, %00001100
    db %00000001, %00001110
    db %00000001, %11111110
    db %00000001, %01001010
    db %00000011, %11001010
    db %00000010, %00000010
    db %00000001, %00000100
    db %00000001, %11000100
    db %00000000, %10001000
    db %00000000, %11111000
    db %00000001, %11100100
    db %00000001, %11011100
    db %00000001, %11011110
    db %00000001, %11010010
    db %00000011, %11110010
    db %00000011, %11001001
    db %00000011, %11001001
    db %00000011, %11001001
    db %00000011, %11001001
    db %00000001, %11110001
    db %00001111, %00111001
    db %00010000, %00010111
    db %00100100, %00100000
    db %11100111, %11100000
    db %11100101, %00100000
    db %01111100, %10010000
    db %00111000, %10001000
    db %00000000, %01001100
    db %00000000, %00101100
    db %00000000, %01111100
    db %00000000, %11111000
bobsprite_right:
    ;right0
    db %00011111, %00000000
    db %00110000, %10000000
    db %01110000, %10000000
    db %01111111, %10000000
    db %01010010, %10000000
    db %01010011, %11000000
    db %01000000, %01000000
    db %00100000, %10000000
    db %00100011, %10000000
    db %00010001, %00000000
    db %00011111, %00000000
    db %00110011, %10000000
    db %00111101, %10000000
    db %00111101, %10000000
    db %00100101, %10000000
    db %11100111, %11000000
    db %10100101, %11000000
    db %10100101, %11000000
    db %10100101, %11000000
    db %10110011, %11000000
    db %11110011, %11000000
    db %00011100, %10000000
    db %00010000, %10000000
    db %00001000, %10000000
    db %00001000, %10000000
    db %00000100, %10000000
    db %00001000, %10000000
    db %00001001, %00000000
    db %00001001, %00000000
    db %00001001, %00000000
    db %00001111, %10000000
    db %00000111, %11000000
    ;right1
    db %00011111, %00000000
    db %00110000, %10000000
    db %01110000, %10000000
    db %01111111, %10000000
    db %01010010, %10000000
    db %01010011, %11000000
    db %01000000, %01000000
    db %00100000, %10000000
    db %00100011, %10000000
    db %00010001, %00000000
    db %00011111, %00000000
    db %00110011, %10000000
    db %00101101, %10000000
    db %00111101, %10000000
    db %01110011, %11000000
    db %01010010, %01000000
    db %01010010, %01000000
    db %01010001, %11000000
    db %01011000, %01000000
    db %01111110, %01000000
    db %00111111, %10000000
    db %00001110, %11110000
    db %00001000, %10001000
    db %00000100, %10100100
    db %00000100, %11100111
    db %00000100, %10100111
    db %00001001, %00111110
    db %00010001, %00011100
    db %00110010, %00000000
    db %00110100, %00000000
    db %00111110, %00000000
    db %00011111, %00000000
    ;right2
    db %00011111, %00000000
    db %00110000, %10000000
    db %01110000, %10000000
    db %01111111, %10000000
    db %01010010, %10000000
    db %01010011, %11000000
    db %01000000, %01000000
    db %00100000, %10000000
    db %00100011, %10000000
    db %00010001, %00000000
    db %00011111, %00000000
    db %00100111, %10000000
    db %00111011, %10000000
    db %01111011, %10000000
    db %01001011, %10000000
    db %01001111, %11000000
    db %10010011, %11000000
    db %10010011, %11000000
    db %10010011, %11000000
    db %10010011, %11000000
    db %10001111, %10000000
    db %10011100, %11110000
    db %11101000, %00001000
    db %00000100, %00100100
    db %00000111, %11100111
    db %00000100, %10100111
    db %00001001, %00111110
    db %00010001, %00011100
    db %00110010, %00000000
    db %00110100, %00000000
    db %00111110, %00000000
    db %00011111, %00000000
;

bob_draw:
    ; call paintsprite_16_32
    call drawbob
    ret





drawbob:
    ld a,(bob_direction)
    cp UP
    jp z, drawbob_up
    cp DOWN
    jp z, drawbob_down
    cp LEFT
    jp z, drawbob_left
    cp RIGHT
    jp z, drawbob_right
drawbob_up:
    ld a,(bob_current_frame)
    cp 0
    jp z,dbu0
    cp 1
    jp z,dbu1
    cp 2
    jp z,dbu2
    cp 3
    jp z,dbu3
dbu0:
    ld bc,bobsprite_up
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbu1:
    ld bc,bobsprite_up+(BOB_FRAME_SIZE*1)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbu2:
    ld bc,bobsprite_up
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbu3:
    ld bc,bobsprite_up+(BOB_FRAME_SIZE*2)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
drawbob_down:
    ld a,(bob_current_frame)
    cp 0
    jp z,dbd0
    cp 1
    jp z,dbd1
    cp 2
    jp z,dbd2
    cp 3
    jp z,dbd3
dbd0:
    ld bc,bobsprite_down
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbd1:
    ld bc,bobsprite_down+(BOB_FRAME_SIZE*1)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbd2:
    ld bc,bobsprite_down
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbd3:
    ld bc,bobsprite_down+(BOB_FRAME_SIZE*2)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
drawbob_left:
    ld a,(bob_current_frame)
    cp 0
    jp z,dbl0
    cp 1
    jp z,dbl1
    cp 2
    jp z,dbl2
    cp 3
    jp z,dbl3
dbl0:
    ld bc,bobsprite_left
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbl1:
    ld bc,bobsprite_left+(BOB_FRAME_SIZE*1)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbl2:
    ld bc,bobsprite_left
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbl3:
    ld bc,bobsprite_left+(BOB_FRAME_SIZE*2)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
drawbob_right:
    ld a,(bob_current_frame)
    cp 0
    jp z,dbr0
    cp 1
    jp z,dbr1
    cp 2
    jp z,dbr2
    cp 3
    jp z,dbr3
dbr0:
    ld bc,bobsprite_right
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbr1:
    ld bc,bobsprite_right+(BOB_FRAME_SIZE*1)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbr2:
    ld bc,bobsprite_right
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
dbr3:
    ld bc,bobsprite_right+(BOB_FRAME_SIZE*2)
    ld de,(boby)
    call drawsprite16_32
    jp drawbob_end
drawbob_end:
    ret









;
;
;
;
;;;;; Collision...



; ;sets targetpos back to bob pos
bob_reset_collisions_check:
    ;reset targetpos
    ld a,(bobx)
    ld (bob_targetpos_x),a
    ld a,(boby)
    ld (bob_targetpos_y),a

    ;reset collision bool
    xor a
    ld (collision_detected_bob_desk),a ;collision bool = 0
    ret
;



;IX=objectdata
;DE=object data length
check_collisions_bob_desk:
    ;if tx+tw<dx -skip 
    ;if dx+dw<tx -skip
    ;if ty+th<dy -skip
    ;if dy+dh<ty -skip
    ;else -set bool true and ret
    ld a,(ix)
    cp 255 
    ret z ;if ix=255

    ld a,(bob_targetpos_x)
    add a,BOB_WIDTH
    sub BOB_BOUNDING_BOX_OFFSET_X
    ld b,(ix+1)
    cp b 
    jp c, checkcoll_bobdesk_gonextobject ;if tx+tw<dx -skip 

    ld a,(bob_targetpos_x)
    add a,BOB_BOUNDING_BOX_OFFSET_X
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, checkcoll_bobdesk_gonextobject ;if dx+dw<tx -skip 


    ld a,(bob_targetpos_y)
    add a,BOB_BOUNDING_BOX_HEIGHT
    add a,BOB_BOUNDING_BOX_OFFSET_Y
    ld b,(ix+2)
    cp b
    jp c, checkcoll_bobdesk_gonextobject ;if ty+th<dy -skip


    ld a,(bob_targetpos_y)
    add a,BOB_BOUNDING_BOX_OFFSET_Y
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, checkcoll_bobdesk_gonextobject ;if dy+dh<ty -skip

    ;else, we have collided...
    ld a,TRUE
    ld (collision_detected_bob_desk),a
    ret
checkcoll_bobdesk_gonextobject:
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp check_collisions_bob_desk
;





;sets bob pos to targetpos (as long as collision not detected)
bob_safemovetotargetpos:
    ld a,(collision_detected_bob_desk)
    cp TRUE
    ret z ;if collision was detected dont move to target
    ld a,(bob_targetpos_x)
    ld (bobx),a
    ld a,(bob_targetpos_y)
    ld (boby),a
    ret
;








bob_do_anim_timer:
    ld a,(bob_anim_timer)
    inc a
    ld (bob_anim_timer),a
    cp BOB_ANIM_DELAY
    jp nc, bob_skip_to_next_frame
    ret
bob_skip_to_next_frame:
    ld a,(bob_current_frame)
    cp 0
    jp z, bob_setframe1
    cp 1
    jp z,bob_setframe2
    cp 2
    jp z,bob_setframe3
    cp 3
    jp z,bob_setframe0
    xor a
    ld (bob_anim_timer),a
    ret

bob_setframe0:
    xor a
    ld (bob_current_frame),a
    ret

bob_setframe1:
    ld a,1
    ld (bob_current_frame),a
    ret

bob_setframe2:
    ld a,2
    ld (bob_current_frame),a
    ret

bob_setframe3:
    ld a,3
    ld (bob_current_frame),a
    ret

bob_set_state_standard:
    ld a,STANDARD
    ld (bob_state),a
    ret

bob_set_state_attack:
    ld a,ATTACK
    ld (bob_state),a
    ret




