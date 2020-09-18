;PATTERN STARTS (1 Unit == 5 secs)
P1_START equ 1
P2_START equ 2
LEVEL_END equ 100
ENEMY_SPAWN_INTERVAL equ 16 ;frames between each enemy spawn (during wave)
LEVEL_TIMER_SPEED_FACTOR equ 4
level_timer dw 252
current_pattern dw 0
wave_y_offset db 0

flightpattern_1:
    db 26,0
    db 25,2
    db 24,4
    db 23,6
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
    db 26,100
    db 25,95
    db 24,90
    db 23,85
    db 22,80
    db 21,80
    db 20,50
    db 19,50
    db 18,50
    db 17,50
    db 16,50
    db 15,50
    db 14,50
    db 13,50
    db 12,50
    db 11,50
    db 10,50
    db 9,50
    db 8,50
    db 7,50
    db 6,50
    db 5,50
    db 4,50
    db 3,50
    db 2,50
    db 1,50
    db 0,50
;




level_update:
    

    ;check players distance
    ld hl,(level_timer)
    ld a,h ;compare high byte to P starts (pattern starts)
    cp P1_START
    push af
    call z, spawnwave1
    pop af
    cp P2_START
    push af
    call z, spawnwave2
    pop af

    ;increment timer
    ld hl,(level_timer)
    ld de,LEVEL_TIMER_SPEED_FACTOR
    add hl,de 
    ld (level_timer),hl
    
    ret

    



spawnwave1:
    ld a,145
    ld (wave_y_offset),a

    ; ld hl,(level_timer)
    ld a,l ;compare low byte to see when exactly to spawn each of the 5 enemies
    cp ENEMY_SPAWN_INTERVAL*0
    jp z, spawnenemy_0
    cp ENEMY_SPAWN_INTERVAL*1
    jp z, spawnenemy_1
    cp ENEMY_SPAWN_INTERVAL*2
    jp z, spawnenemy_2
    cp ENEMY_SPAWN_INTERVAL*3
    jp z, spawnenemy_3
    cp ENEMY_SPAWN_INTERVAL*4
    jp z, spawnenemy_4
    
    ret

spawnwave2:
    ld a,30
    ld (wave_y_offset),a 

    ld hl,(level_timer)
    ld a,l ;compare low byte to see when exactly to spawn each of the 5 enemies
    cp ENEMY_SPAWN_INTERVAL*0
    jp z, spawnenemy_0
    cp ENEMY_SPAWN_INTERVAL*1
    jp z, spawnenemy_1
    cp ENEMY_SPAWN_INTERVAL*2
    jp z, spawnenemy_2
    cp ENEMY_SPAWN_INTERVAL*3
    jp z, spawnenemy_3
    cp ENEMY_SPAWN_INTERVAL*4
    jp z, spawnenemy_4

    ret



spawnenemy_0:
    ld hl,flightpattern_1
    ld (current_pattern),hl
    call enemy_spawn
    ret

spawnenemy_1:
    ld hl,flightpattern_1
    ld (current_pattern),hl
    call enemy_spawn
    ret
spawnenemy_2:
    ld hl,flightpattern_1
    ld (current_pattern),hl
    call enemy_spawn
    ret
spawnenemy_3:
    ld hl,flightpattern_1
    ld (current_pattern),hl
    call enemy_spawn
    ret
spawnenemy_4:
    ld hl,flightpattern_1
    ld (current_pattern),hl
    call enemy_spawn
    ret