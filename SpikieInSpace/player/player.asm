

player_isalive db TRUE

PLAYER_COLOUR equ %01000011
PLAYER_SPAWN_X equ 5
PLAYER_SPAWN_Y equ 50
PLAYER_SPEED_X equ 1
PLAYER_SPEED_Y equ 8
PLAYER_HEIGHT equ 24
PLAYER_WIDTH equ 2




playery db PLAYER_SPAWN_Y
playerx db PLAYER_SPAWN_X




; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite:
    db %00001111, %11110000
    db %00010101, %10111000
    db %00101111, %11110100
    db %01001111, %11100010
    db %10111110, %00100001
    db %10011100, %10100001
    db %10001000, %00010001
    db %10000100, %11100001
    db %10000010, %01000001
    db %10000111, %10000001
    db %10001111, %01000001
    db %10001001, %01000001
    db %11111111, %00111111
    db %11111001, %00111111
    db %11111100, %10111111
    db %10111111, %11111101
    db %10000000, %00000001
    db %10000000, %00000001
    db %11000000, %00000011
    db %01100000, %00000110
    db %00111111, %11111100
    db %00100000, %00000100
    db %00111111, %11111100
    db %00011111, %11111000
;





player_game_start:
    ret





player_update:
    call check_keys

    ld a,(player_isalive)
    cp FALSE
    push af
    call z, playerdead_update
    pop af
    ret z


    call boss_1_check_collision_player

    ld a,(keypressed_Q)
    cp TRUE
    call z,player_move_up

    ld a,(keypressed_A)
    cp TRUE
    call z,player_move_down

    ld a,(keypressed_O)
    cp TRUE
    call z,player_move_left

    ld a,(keypressed_P)
    cp TRUE
    call z,player_move_right


    ld a,(keypressed_Space)
    cp TRUE
    call z,player_fire_bullet


    ret



playerdead_update:
    ld a,(keypressed_Space)
    cp TRUE
    call z, level_restart
    ret




player_draw:
    ld a,(player_isalive)
    cp TRUE
    ret nz
    ld de,(playery)
    push de
    ld bc,playersprite
    call drawsprite16_24
    pop de
    ld b,PLAYER_COLOUR
    call paint_sprite_2_4
    ret






player_move_up:
    ld a,(playery)
    cp MIN_Y
    ret c
    
    sub PLAYER_SPEED_Y
    ld (playery),a
    ret
player_move_down:
    ld a,(playery)
    cp MAX_Y-1
    ret nc
    
    add a,PLAYER_SPEED_Y
    ld (playery),a
    ret
player_move_left:
    ld a,(playerx)
    cp MIN_X+1
    ret c

    sub PLAYER_SPEED_X
    ld (playerx),a
    ret
player_move_right:
    ld a,(playerx)
    cp MAX_X
    ret nc

    add a,PLAYER_SPEED_X
    ld (playerx),a
    ret
;



;IX=bullets
player_fire_bullet:
    ld ix,bullets_player
pfb_startloop:
    ld a,(ix)
    cp 255
    ret z

    cp FALSE
    jp nz, pfb_next

    call bullets_spawn
    ret
pfb_next:
    ld de,BULLET_DATA_LENGTH
    add ix,de
    jp pfb_startloop











player_respawn:
    ld a,TRUE
    ld (player_isalive),a
    ld a,PLAYER_SPAWN_X
    ld (playerx),a
    ld a,PLAYER_SPAWN_Y
    ld (playery),a
    ret

player_kill:
    ld a,(player_isalive)
    cp TRUE
    ret nz
    call decrease_lives
    ld a,FALSE
    ld (player_isalive),a
    ret