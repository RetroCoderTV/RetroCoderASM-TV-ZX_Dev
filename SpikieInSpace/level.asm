;PATTERN1
P1_START equ 1
; P1_TYPE equ SAUCER
P1_SPEED_X equ 1
P1_SPEED_Y equ 0
P1_Y equ 25



;PATTERN2
P2_START equ 4





;move types:
STRAIGHT equ 0
SIN equ 1
HOMING equ 2

flightpattern_1:
    db 24,50
    db 23,50
    db 22,50
    db 21,50
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


level_update:
    ;check players distance
    ld hl,(player_distance_travelled)
    ld a,h
    cp P1_START
    push af
    call z, spawnwave1
    pop af
    cp P2_START
    push af
    jp z, spawnwave2
    pop af

    ld hl,player_distance_travelled
    inc (hl)
    
    

    ret



spawnwave1:
    ld hl,flightpattern_1
    ld (current_pattern),hl
    call enemy_spawn

    ret

spawnwave2:
    ld hl,flightpattern_2
    ld (current_pattern),hl
    call enemy_spawn

    ret