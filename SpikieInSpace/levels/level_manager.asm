;PATTERN STARTS (1 Unit == 5 secs)
P1_START equ 1
P2_START equ 2
ENEMY_SPAWN_INTERVAL equ 16 ;frames between each enemy spawn (during wave)
LEVEL_TIMER_SPEED_FACTOR equ 4
level_timer dw 0
current_pattern dw 0
wave_y_offset db 0

flightpattern_1:
    db 26,0
    db 26,0
    db 26,0
    db 25,2
    db 25,2
    db 25,2
    db 25,2
    db 24,4
    db 24,4
    db 24,4
    db 24,4
    db 23,6
    db 23,6
    db 23,6
    db 23,6
    db 22,8
    db 22,8
    db 21,10
    db 20,12
    db 19,14
    db 18,16
    db 17,18
    db 16,20
    db 15,22
    db 14,24
    db 13,22
    db 12,20
    db 11,18
    db 10,16
    db 9,14
    db 8,12
    db 7,10
    db 6,8
    db 5,6
    db 4,4
    db 3,2
    db 2,0
    db 1,2
    db 0,4
;
flightpattern_2:
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
    call setpattern 
    

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
    cp ENEMY_SPAWN_INTERVAL*7
    jp z, wormhole_destroy
    ret

spawnfirst:
    push hl
    call wormhole_spawn
    pop hl
    jp enemy_spawn
    ret

