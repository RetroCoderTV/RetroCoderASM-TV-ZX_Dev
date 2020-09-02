PLAYER_WIDTH equ 2 ;in bytes
PLAYER_HEIGHT equ 24 ;in lines
PLAYER_BOUNDING_BOX_OFFSET_X equ 1
PLAYER_BOUNDING_BOX_OFFSET_Y equ 15
PLAYER_BOUNDING_BOX_HEIGHT equ 5

PLAYER_FRAME_SIZE equ 48

player_direction db DOWN
player_state db NO_SKI
player_current_frame db 0

player_anim_timer db 0
player_attack_timer db 0

playery db 0
playerx db 0

player_targetpos_x db 0
player_targetpos_y db 0

PLAYER_SPEED_X equ 1
PLAYER_SPEED_Y equ 4

collision_detected_player_solid db FALSE


; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite_up:
    ;frame0
    db %00001010, %10100000
    db %00011111, %11100000
    db %00011111, %11100000
    db %00011111, %11100000
    db %00011111, %11100000
    db %00011111, %11100000
    db %00001111, %11100000
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
    ;frame1
    db %00001001, %00100000
    db %00001101, %10110000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001011, %11110000
    db %00011101, %11110000
    db %00010001, %11100000
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
    db %00001011, %11100000
    db %00010001, %00100000
    db %00001111, %00010000
    db %00000001, %11110000
    ;frame2
    db %00000100, %10010000
    db %00001101, %10110000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00001111, %11010000
    db %00001111, %10111000
    db %00000111, %10001000
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
    db %00000111, %11010000
    db %00000100, %10001000
    db %00001000, %11110000
    db %00001111, %10000000
playersprite_down:
    ;frame0
    db %00001001, %00100000
    db %00001101, %10110000
    db %00001111, %11110000
    db %00001011, %10110000
    db %00001000, %00110000
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
    ;frame1
    db %00000100, %10000000
    db %00000110, %11010000
    db %00000110, %11011000
    db %00000111, %11111000
    db %00000100, %00111000
    db %00000110, %10101000
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
    ;frame2
    db %00000010, %01000000
    db %00010011, %01100000
    db %00010111, %11100000
    db %00011111, %11100000
    db %00011100, %00100000
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
    ;frame0
    db %00001001, %00100000
    db %00001101, %10100000
    db %00001111, %11110000
    db %00000111, %11110000
    db %00000100, %01111100
    db %00000101, %00111000
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
    ;frame1
    db %00000000, %00000000
    db %00000001, %00100000
    db %00000001, %10110000
    db %00001111, %11110000
    db %00000111, %11111110
    db %00000010, %00111100
    db %00000010, %10011000
    db %00000100, %00001100
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
    ;frame2
    db %00000000, %00000000
    db %00001001, %00100000
    db %00001101, %10101000
    db %00000111, %11111000
    db %00000111, %11110000
    db %00000100, %01111100
    db %00000101, %00110000
    db %00001000, %00011000
    db %00000111, %00101000
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
playersprite_right:
    ;frame0
    db %00000100, %10010000
    db %00000101, %10110000
    db %00001111, %11110000
    db %00001111, %11100000
    db %00111110, %00100000
    db %00011100, %10100000
    db %00001000, %00010000
    db %00000100, %11100000
    db %00000010, %01000000
    db %00000111, %10000000
    db %00001111, %01000000
    db %00001001, %01000000
    db %00001111, %00100000
    db %00001001, %00100000
    db %00000100, %10100000
    db %00000100, %11100000
    db %00000111, %11000000
    db %00000011, %11000000
    db %00000001, %11000000
    db %00000011, %10000000
    db %00000011, %10000000
    db %00000010, %01000000
    db %00000010, %00100000
    db %00000011, %11100000
    ;frame1
    db %00000000, %00000000
    db %00000100, %10000000
    db %00001101, %10000000
    db %00001111, %11110000
    db %01111111, %11100000
    db %00111100, %01000000
    db %00011001, %01000000
    db %00110000, %00100000
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
    ;frame2
    db %00000000, %00000000
    db %00000100, %10010000
    db %00010101, %10110000
    db %00011111, %11100000
    db %00001111, %11100000
    db %00111110, %00100000
    db %00001100, %10100000
    db %00011000, %00010000
    db %00010100, %11100000
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


;
player_update:
    ld a,(game_state)
    cp LEVEL_01
    call z,player_update_l1
    ld a,(game_state)
    ; cp LEVEL_02
    ; call z,player_update_l2
    ret
;

player_draw:
    ; call paintplayer_16_24
    call drawplayer
    ret
;


;INPUT:
;IX=cars
player_check_collision_cars:
    ld a,(ix)
    cp 255
    ret z

    ld a,(playerx)
    add a,PLAYER_WIDTH
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, plyr_chk_coll_cars_next
    
    ld a,(ix+2)
    ld b,a
    ld a,(playery)
    add a,PLAYER_HEIGHT
    cp b
    jp c, plyr_chk_coll_cars_next

    ld a,(ix+2)
    add a,(ix+4)
    ld b,a
    ld a,(playery)
    add a,PLAYER_HEIGHT/2
    cp b
    jp nc, plyr_chk_coll_cars_next

    ; ;else, we collided....
    
    ret
plyr_chk_coll_cars_next:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp player_check_collision_cars


drawplayer:    
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
    ld a,(player_current_frame)
    cp 0
    jp z,dpl0
    cp 1
    jp z,dpl1
    cp 2
    jp z,dpl2
    cp 3
    jp z,dpl3
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
    ld a,(player_current_frame)
    cp 0
    jp z,dpr0
    cp 1
    jp z,dpr1
    cp 2
    jp z,dpr2
    cp 3
    jp z,dpr3
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
    call skip_to_next_frame
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

set_state_noski:
    ld a,NO_SKI
    ld (player_state),a
    ret

set_state_withski:
    ld a,WITH_SKI
    ld (player_state),a
    ret






