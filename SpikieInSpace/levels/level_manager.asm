;PATTERN STARTS (1 Unit == 5 secs)
P1_START equ 1
P2_START equ 2
ENEMY_SPAWN_INTERVAL equ 16 ;frames between each enemy spawn (during wave)
LEVEL_TIMER_SPEED_FACTOR equ 4
; level_timer dw 0x1B00
level_timer dw 0x0000
current_pattern dw 0x0000
wave_y_offset db 0
current_enemy_spritetype dw 0x0000


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
    db 14,20
    db 13,30
    db 12,40
    db 11,50
    db 10,40
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
    db 14,20
    db 13,10
    db 12,0
    db 11,-10
    db 10,-20
    db 9,-30
    db 8,-20
    db 7,-10
    db 6,0
    db 5,0
    db 4,0
    db 3,0
    db 2,0
    db 1,0
    db 0,0
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

    pop de

    ret


level_update:
    call update_wave
increment_timer:
    ld hl,(level_timer)
    ld de,LEVEL_TIMER_SPEED_FACTOR
    add hl,de 
    ld (level_timer),hl
    ret

update_wave:
    ld hl,(level_timer)
    ld a,h
    cp 0
    ret z
    call setoffset
    ld hl,(level_timer)
    push hl
    call setpattern 
    pop hl
    call setenemysprite
    


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

spawnfirst:
    ; push hl
    ; call wormhole_spawn
    ; pop hl
    jp enemy_spawn
    ret

