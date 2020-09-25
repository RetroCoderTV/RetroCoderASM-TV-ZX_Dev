ENEMY_HP_SQUID equ 10

SQUID_SPAWN_TOP_Y equ 0
SQUID_SPAWN_BOTTOM_Y equ 170

squid_is_alive db FALSE
squid_y db 0
squid_x db 0
squid_direction_updown db DOWN

squid_spawn_mode db TOP
squid_hp db ENEMY_HP_SQUID

enemysprite_squid:
    db %00000011, %10000000
    db %00000111, %11000000
    db %00001111, %11100000
    db %00011011, %10110000
    db %00011111, %11110000
    db %00000100, %01000000
    db %00001011, %10100000
    db %00010100, %01010000
;



spawn_squid:
    ld a,(squid_is_alive)
    cp TRUE
    ret z
    call rand
    cp FIFTY50
    push af
    call c, ss_set_top
    pop af
    call nc, ss_set_bottom
ss_getrandx:
    call rand
    cp 25 ;right edge of screen minus squid width
    jp nc,ss_getrandx
    ld (squid_x),a
    ld a,TRUE
    ld (squid_is_alive),a
    ld a,ENEMY_HP_SQUID
    ld (squid_hp),a

    ret

ss_set_top:
    ld a,SQUID_SPAWN_TOP_Y
    ld (squid_y),a

    ld a,DOWN
    ld (squid_direction_updown),a
    ret

ss_set_bottom:
    ld a,SQUID_SPAWN_BOTTOM_Y
    ld (squid_y),a

    ld a,UP
    ld (squid_direction_updown),a
    ret





squid_update:
    ld a,(squid_is_alive)
    cp TRUE
    ret nz

    ld a,(squid_direction_updown)
    cp UP
    push af
    call z,squid_move_up
    pop af
    cp DOWN
    push af
    call z,squid_move_down
    pop af




    ld a,(squid_x)
    ld b,a
    ld a,(playerx_prev)
    cp b
    call c,squid_move_left

    ld a,(playerx_prev)
    ld b,a
    ld a,(squid_x)
    cp b
    call c,squid_move_right

    call check_collision_squid_player


    ret





squid_move_up:
    ld a,(squid_y)
    dec a
    ld (squid_y),a
    cp SQUID_SPAWN_TOP_Y
    call z,destroy_squid
    ret


squid_move_down:
    ld a,(squid_y)
    inc a
    ld (squid_y),a
    cp SQUID_SPAWN_BOTTOM_Y
    call z,destroy_squid
    ret

squid_move_right:
    ld a,(squid_x)
    inc a
    ld (squid_x),a
    cp MAX_X
    call nc,destroy_squid
    ret

squid_move_left:
    ld a,(squid_x)
    dec a
    ld (squid_x),a
    cp MIN_X
    call c,destroy_squid
    ret


destroy_squid:
    ld a,FALSE
    ld (squid_is_alive),a
    ret

kill_squid:
    ld a,FALSE
    ld (squid_is_alive),a
    call increment_score10000
    ret







squid_draw:
    ld a,(squid_is_alive)
    cp TRUE
    ret nz


    ld de,(squid_y)
    ld bc,enemysprite_squid
    call drawsprite16_8
    ret












check_collision_squid_player:
    ld a,(squid_x) 
    ld b,a ;B=enemy x
    ld a,(playerx)
    add a,PLAYER_WIDTH
    cp b
    ret c

    ld a,(playerx)
    ld b,a
    ld a,(squid_x) 
    add a,2 ;add enemy width A=enemy right side
    cp b
    ret c

    ld a,(playery)
    ld b,a
    ld a,(squid_y)
    add a,8 ;add enemy height    
    cp b
    ret c

    ld a,(squid_y)
    ld b,a ;B=enemy top
    ld a,(playery)
    add a,PLAYER_HEIGHT
    cp b
    ret c 

    ;if here, collision....
    call destroy_squid
    
    ld a,(player_shield_active)
    cp TRUE
    ret z

    call player_kill

    ret