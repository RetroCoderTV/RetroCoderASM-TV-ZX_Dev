;PATTERN STARTS (1 Unit == 5 secs)
P1_START equ 1
P2_START equ 4



ENEMY_SPAWN_INTERVAL equ 5 ;frames between each enemy spawn (during wave)




flightpattern_1:
    db 26,10
    db 25,15
    db 24,20
    db 23,25
    db 22,30
    db 21,35
    db 20,40
    db 19,45
    db 18,50
    db 17,45
    db 16,40
    db 15,35
    db 14,30
    db 13,25
    db 12,20
    db 11,15
    db 10,10
    db 9,15
    db 8,20
    db 7,25
    db 6,30
    db 5,35
    db 4,40
    db 3,45
    db 2,50
    db 1,45
    db 0,40
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

current_pattern dw 0
level_timer dw 255

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
    jp z, spawnwave2
    pop af


    ;increment timer
    ld hl,(level_timer)
    inc hl
    ld (level_timer),hl
    
    

    ret



spawnwave1:
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

spawnwave2:
    

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