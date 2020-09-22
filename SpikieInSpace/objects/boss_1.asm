
BOSS_1_COLOUR equ %01000101
BOSS_1_SPAWN_X equ 21
BOSS_1_SPAWN_Y equ 20

BOSS_1_MIN_Y equ 20
BOSS_1_MAX_Y equ 150

BOSS_1_MIN_X equ 3


BOSS_1_SPEED_Y equ 8
BOSS_1_SPEED_X equ 1

BOSS_1_WIDTH equ 2
BOSS_1_HEIGHT equ 32

boss1_y db 0
boss1_x db 0
boss_1_isalive db FALSE
boss_1_isattacking db TRUE

boss_1_direction db LEFT






boss1_sprite:
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111111, %11111000
    db %00101010, %10101000
    db %00101110, %11101000
    db %00010011, %00010000
    db %00010000, %00010000
    ;
    db %00001011, %10100000
    db %00011100, %01110000
    db %00111011, %10111000
    db %01111010, %10111100
    db %01111010, %10111100
    db %01111010, %11111111
    db %01011011, %10010101
    db %01011011, %10010101
    ;
    db %01011011, %10010101
    db %01011011, %10010101
    db %01001011, %11100111
    db %01001011, %10100100
    db %00110111, %11011000
    db %00010000, %00010000
    db %00010000, %00010000
    db %00010001, %10010000
    ;
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00010001, %00010000
    db %00111110, %11111000
    db %01111100, %01111100





boss_1_spawn:
    ld a,(boss_1_isalive)
    cp TRUE
    ret z

    call sound_A_0_25

    ld a,TRUE
    ld (boss_1_isalive),a

    ld a,BOSS_1_SPAWN_X
    ld (boss1_x),a

    ld a,BOSS_1_SPAWN_Y
    ld (boss1_y),a
    ret


boss_1_update:
    ld a,(boss_1_isalive)
    cp TRUE
    ret nz

    



    ld a,(boss_1_isattacking)
    cp TRUE
    jp z,boss_1_update_attacking

    call rand
    cp 1
    jp c, boss_1_startattack

    ld a,(boss_1_direction)
    cp UP
    push af
    call z, boss_1_move_up
    pop af
    cp DOWN
    call z, boss_1_move_down

   
    call boss_1_check_collision_player
    ret

boss_1_update_attacking:
    ld a,(boss_1_direction)
    cp LEFT
    push af
    call z,boss_1_move_left
    pop af
    cp RIGHT
    call z,boss_1_move_right

    call boss_1_check_collision_player
    
    ret



boss_1_move_up:
    ld a,(boss1_y)
    cp BOSS_1_MIN_Y+1
    jp c, boss_1_set_direction_down

    sub BOSS_1_SPEED_Y
    ld (boss1_y),a
    ret


boss_1_move_down:
    ld a,(boss1_y)
    cp BOSS_1_MAX_Y
    jp nc, boss_1_set_direction_up

    add a,BOSS_1_SPEED_Y
    ld (boss1_y),a
    ret

boss_1_move_left:
    ld a,(boss1_x)
    cp BOSS_1_MIN_X+1
    jp c, boss_1_set_direction_right

    sub BOSS_1_SPEED_X
    ld (boss1_x),a
    ret

boss_1_move_right:
    ld a,(boss1_x)
    cp BOSS_1_SPAWN_X
    jp nc, boss_1_startmovement

    add a,BOSS_1_SPEED_X
    ld (boss1_x),a
    ret


boss_1_set_direction_up:
    ld a,UP
    ld (boss_1_direction),a
    ret
boss_1_set_direction_down:
    ld a,DOWN
    ld (boss_1_direction),a
    ret

boss_1_set_direction_left:
    ld a,LEFT
    ld (boss_1_direction),a
    ret
boss_1_set_direction_right:
    ld a,RIGHT
    ld (boss_1_direction),a
    ret

boss_1_set_attacking_true:
    ld a,TRUE
    ld (boss_1_isattacking),a
    ret

boss_1_set_attacking_false:
    ld a,FALSE
    ld (boss_1_isattacking),a
    ret

boss_1_draw:
    ld a,(boss_1_isalive)
    cp TRUE
    ret nz

    ld de,(boss1_y)
    push de
    ld bc,boss1_sprite
    call drawsprite16_32
    pop de
    ld b,BOSS_1_COLOUR
    call paint_sprite_2_4
    ret


boss_1_startattack:
    ld a,LEFT
    ld (boss_1_direction),a
    call boss_1_set_attacking_true
    ret

boss_1_startmovement:
    ld a,DOWN
    ld (boss_1_direction),a
    call boss_1_set_attacking_false
    ret





boss_1_check_collision_player:
    ld a,(boss_1_isalive)
    cp TRUE
    ret nz

    ; check is boss past the player on right side...
    ld a,(boss1_x) 
    ld b,a ;B=boss left-side 
    ld a,(playerx)
    add a,PLAYER_WIDTH ;A=player right side
    cp b ;compare A with B
    ret c ;ret if A < B
    
    ; check is player past the boss on right side...
    ld a,(playerx) 
    ld b,a  ;B=player left
    ld a,(boss1_x)
    add a,BOSS_1_WIDTH ;A=boss right side
    cp b ;compare A with B
    ret c ; ret if A < B

    ;check is player above boss... 
    ld a,(boss1_y)
    ld b,a ; B= boss top
    ld a,(playery)
    add a,PLAYER_HEIGHT ;A = player bottom
    cp b
    ret c ; is player bottom < boss top

    ;check is boss above player...
    ld a,(playery)
    ld b,a
    ld a,(boss1_y)
    add a,BOSS_1_HEIGHT
    cp b
    ret c

    ;collision...
    ; call player_kill
    xor a
    call 0x229b


    ret