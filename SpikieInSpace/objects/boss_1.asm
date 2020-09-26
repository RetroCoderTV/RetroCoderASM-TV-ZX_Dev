
BOSS_1_COLOUR equ %01000100
BOSS_1_SPAWN_X equ 26 ;start off the screen
BOSS_1_SPAWN_Y equ 20

BOSS_1_MIN_Y equ 20
BOSS_1_MAX_Y equ 140
BOSS_1_MIN_X equ 4
BOSS_1_MAX_X equ 21


BOSS_1_SPEED_Y equ 12
BOSS_1_SPEED_X equ 2

BOSS_1_WIDTH equ 2
BOSS_1_HEIGHT equ 32

boss1_y db 0
boss1_x db 0
boss_1_isalive db FALSE
boss_1_isattacking db TRUE


boss_1_direction db LEFT


BOSS_1_MAX_HP equ 50
boss_1_health db 50






boss1_sprite:
    ; db %00000111, %11000000
    ; db %00011000, %00110000
    ; db %00110000, %00011000
    ; db %00111111, %11111000
    ; db %00101010, %10101000
    ; db %00101110, %11101000
    ; db %00010011, %00010000
    ; db %00010000, %00010000
    ; ;
    ; db %00001011, %10100000
    ; db %00011100, %01110000
    ; db %00111011, %10111000
    ; db %01111010, %10111100
    ; db %01111010, %10111100
    ; db %01111010, %11111111
    ; db %01011011, %10010101
    ; db %01011011, %10010101
    ; ;
    ; db %01011011, %10010101
    ; db %01011011, %10010101
    ; db %01001011, %11100111
    ; db %01001011, %10100100
    ; db %00110111, %11011000
    ; db %00010000, %00010000
    ; db %00010000, %00010000
    ; db %00010001, %10010000
    ; ;
    ; db %00010001, %00010000
    ; db %00010001, %00010000
    ; db %00010001, %00010000
    ; db %00010001, %00010000
    ; db %00010001, %00010000
    ; db %00010001, %00010000
    ; db %00111110, %11111000
    ; db %01111100, %01111100
    db %00001000, %00000000
    db %00001100, %00000000
    db %00001110, %00000000
    db %00001111, %00000000
    db %00111111, %10000000
    db %11111111, %11000000
    db %00111111, %11100000
    db %00001111, %11110000
    db %00001111, %11111000
    db %00001111, %11111100
    db %00010001, %11111110
    db %00111110, %01111111
    db %01111111, %10001111
    db %11110111, %11110001
    db %11100111, %11111111
    db %11000111, %11111111
    db %11000111, %11111111
    db %11100111, %11111111
    db %11110111, %11110001
    db %01111111, %10001111
    db %00111110, %01111111
    db %00010001, %11111110
    db %00001111, %11111100
    db %00001111, %11111000
    db %00001111, %11110000
    db %00111111, %11100000
    db %11111111, %11000000
    db %00111111, %10000000
    db %00001111, %00000000
    db %00001110, %00000000
    db %00001100, %00000000
    db %00001000, %00000000
;



boss_1_spawn:
    ld a,(boss_1_isalive)
    cp TRUE
    ret z

    call sound_A_0_25
    call sound_GSharp_0_05
    call sound_B_0_25
    call sound_GSharp_0_05
    call sound_A_0_25
    call sound_GSharp_0_25

    ld a,TRUE
    ld (boss_1_isalive),a
    ld (boss_alive),a

    ld a,BOSS_1_SPAWN_X
    ld (boss1_x),a

    ld a,BOSS_1_SPAWN_Y
    ld (boss1_y),a

    ld a,LEFT
    ld (boss_1_direction),a
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


    ret

boss_1_update_attacking:
    ld a,(boss_1_direction)
    cp LEFT
    push af
    call z,boss_1_move_left
    pop af
    cp RIGHT
    call z,boss_1_move_right

    
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
    cp BOSS_1_MAX_X
    jp nc, boss_1_startphase_updown

    add a,BOSS_1_SPEED_X
    ld (boss1_x),a
    ret


boss_1_set_direction_up:
    call sound_GSharp_0_05
    ld a,UP
    ld (boss_1_direction),a
    ret
boss_1_set_direction_down:
    call sound_GSharp_0_05
    ld a,DOWN
    ld (boss_1_direction),a
    ret

boss_1_set_direction_left:
    call sound_GSharp_0_05
    ld a,LEFT
    ld (boss_1_direction),a
    ret
boss_1_set_direction_right:
    call sound_GSharp_0_05
    ld a,RIGHT
    ld (boss_1_direction),a
    ret

boss_1_set_attacking_true:
    call sound_A_0_25
    call sound_GSharp_0_25
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
    call paint_sprite_2_5
    ret


boss_1_startattack:
    ld a,LEFT
    ld (boss_1_direction),a
    call boss_1_set_attacking_true
    ret

boss_1_startphase_updown:
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
    call destroy_boss_1

    call player_kill


    ret
;






boss_1_take_hit:
    ; call sound_GSharp_0_05

    
    ld a,(boss_1_health)
    dec a
    ld (boss_1_health),a

    ld a,(boss_1_health)
    cp 0
    call z,kill_boss_1
    
    ret





destroy_boss_1:
    ld a,FALSE
    ld (boss_1_isalive),a 
    ld (boss_alive),a
    
    ret

kill_boss_1:
    ld a,FALSE
    ld (boss_1_isalive),a 
    ld (boss_alive),a
    call increment_score10000
    call increment_cash1000

    call kill_all_bullets
    jp begin_shop
    ret
