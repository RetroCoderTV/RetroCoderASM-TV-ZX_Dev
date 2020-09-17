


level_update:
    ;check players distance
    ld hl,player_distance_travelled
    ld a,h
    cp 1
    jp z, spawnwave1
    cp 4
    jp z, spawnwave2

    ret



spawnwave1:
    
    ret