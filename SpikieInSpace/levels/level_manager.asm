;PATTERN STARTS (1 Unit == 5 secs)
P1_START equ 1
P2_START equ 2
ENEMY_SPAWN_INTERVAL equ 16 ;frames between each enemy spawn (during wave)
LEVEL_TIMER_SPEED_FACTOR equ 4


SQUID_SPAWN_INTERVAL equ 2



level_timer dw 0x3600
; level_timer dw 0x0000
current_pattern dw 0x0000
wave_y_offset db 0
current_enemy_spritetype dw 0x0000
current_level db 1


boss_alive db 0 ;rem: global boss_alive AND specific boss_X_alive bools. (Sorry bad coding lol)


flightpattern_wave:
    db 26,12
    db 26,14
    db 26,16
    db 25,18
    db 25,20
    db 25,22
    db 25,24
    db 24,26
    db 24,28
    db 24,30
    db 24,32
    db 23,30
    db 23,28
    db 23,26
    db 23,24
    db 22,22
    db 22,20
    db 21,18
    db 20,16
    db 19,14
    db 18,12
    db 17,10
    db 16,08
    db 15,06
    db 14,04
    db 13,02
    db 12,00
    db 11,02
    db 10,04
    db 09,06
    db 08,08
    db 07,10
    db 06,12
    db 05,14
    db 04,16
    db 03,16
    db 02,16
    db 01,16
    db 00,16
;
flightpattern_zig:
    db 26,0
    db 25,0
    db 24,0
    db 23,0
    db 22,0
    db 21,0
    db 20,0
    db 19,0
    db 18,0
    db 17,0
    db 16,0
    db 15,10
    db 15,10
    db 14,20
    db 14,20
    db 13,30
    db 13,30
    db 12,40
    db 12,40
    db 11,50
    db 11,50
    db 10,40
    db 10,40
    db 9,30
    db 9,30
    db 8,20
    db 7,10
    db 6,0
    db 5,10
    db 4,20
    db 3,30
    db 2,40
    db 1,50
    db 0,60
;
flightpattern_zag:
    db 26,40
    db 25,40
    db 24,40
    db 23,40
    db 22,40
    db 21,40
    db 20,40
    db 19,40
    db 18,40
    db 17,40
    db 16,40
    db 15,30
    db 15,30
    db 14,20
    db 14,20
    db 13,10
    db 13,10
    db 12,0
    db 12,0
    db 11,-10
    db 11,-10
    db 10,-20
    db 10,-20
    db 9,-30
    db 9,-30
    db 8,-20
    db 8,-20
    db 7,-10
    db 7,-10
    db 6,0
    db 5,0
    db 4,0
    db 3,0
    db 2,0
    db 1,0
    db 0,0
;
flightpattern_straight:
    db 26,00
    db 26,00
    db 25,00
    db 25,00
    db 24,00
    db 24,00
    db 23,00
    db 23,00
    db 22,00
    db 22,00
    db 21,00
    db 21,00
    db 20,00
    db 20,00
    db 19,00
    db 19,00
    db 18,00
    db 17,00
    db 16,00
    db 15,00
    db 15,00
    db 14,00
    db 14,00
    db 13,00
    db 13,00
    db 12,00
    db 12,00
    db 11,00
    db 11,00
    db 10,00
    db 10,00
    db 09,00
    db 09,00
    db 08,00
    db 08,00
    db 07,00
    db 07,00
    db 06,00
    db 05,00
    db 04,00
    db 03,00
    db 02,00
    db 01,00
    db 00,00
;

 
level_restart:
    push de
    ld de,0
    ld (level_timer),de
    ld (current_pattern),de
    xor a
    ld (wave_y_offset),a

    call kill_all_enemies
    call player_respawn

    ld a,FALSE
    ld (squid_is_alive),a

    ld a,TRUE
    ld (squid_enabled),a

    pop de

    ret

level_nextlevel:
    push de
    ld de,0
    ld (level_timer),de
    ld (current_pattern),de
    xor a
    ld (wave_y_offset),a

    call kill_all_enemies
    call player_spawn_inlevel

    pop de

    ret


level_update:
    ld a,(boss_alive)
    cp TRUE
    ret z
    ld a,(current_level)
    cp 1
    push af
    call z, update_wave_level_1
    pop af
    cp 2
    call z, update_wave_level_2
increment_timer:
    ld hl,(level_timer)
    ld de,LEVEL_TIMER_SPEED_FACTOR
    add hl,de 
    ld (level_timer),hl
    ret

update_wave_level_1:
    ld hl,(level_timer)
    ld a,h
    cp 0
    ret z
    call l1_setoffset
    ld hl,(level_timer)
    push hl
    call l1_setpattern 
    pop hl
    call l1_setenemysprite
    call update_wave_dosquids_l1
    call update_wave_dospawns
    
    ret

update_wave_level_2:
    ld hl,(level_timer)
    ld a,h
    cp 0
    ret z
    call l2_setoffset
    ld hl,(level_timer)
    push hl
    call l2_setpattern 
    pop hl
    call l2_setenemysprite
    call update_wave_dosquids_l2
    call update_wave_dospawns
    
    ret

update_wave_dospawns:
    ld hl,(level_timer)
    ld a,l ;compare low byte to see when exactly to spawn each of the 5 enemies
    cp ENEMY_SPAWN_INTERVAL*0
    jp z, spawnfirst
    cp ENEMY_SPAWN_INTERVAL*1
    jp z, enemy_spawn
    cp ENEMY_SPAWN_INTERVAL*2
    jp z, enemy_spawn
    cp ENEMY_SPAWN_INTERVAL*3
    jp z, enemy_spawn
    cp ENEMY_SPAWN_INTERVAL*4
    jp z, enemy_spawn
    ; cp ENEMY_SPAWN_INTERVAL*7
    ; jp z, wormhole_destroy
    ret


update_wave_dosquids_l1:
    ld hl,(level_timer)
    ld a,h
    cp SQUID_SPAWN_INTERVAL*1
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*2
    push af
    call z,enable_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*3
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*4
    push af
    call z,enable_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*8
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*9
    push af
    call z,enable_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*13
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*14
    push af
    call z,enable_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*15
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*16
    push af
    call z,enable_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*17
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*18
    push af
    call z,spawn_squid
    pop af
    ret

update_wave_dosquids_l2:
    ld hl,(level_timer)
    ld a,h
    cp SQUID_SPAWN_INTERVAL*1
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*2
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*3
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*4
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*8
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*10
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*13
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*14
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*15
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*16
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*17
    push af
    call z,spawn_squid
    pop af
    cp SQUID_SPAWN_INTERVAL*18
    push af
    call z,spawn_squid
    pop af
    ret

spawnfirst:
    ; push hl
    ; call wormhole_spawn
    ; pop hl
    ld a,(player_cashwave)
    cp TRUE
    call z,increment_cash100

    ld a,TRUE
    ld (player_cashwave),a

    jp enemy_spawn
    
    ret

