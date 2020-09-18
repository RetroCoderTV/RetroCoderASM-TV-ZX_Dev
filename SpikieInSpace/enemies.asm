;enemy types
DEAD equ 0
SAUCER equ 1
FALCON equ 2
BOBHEAD equ 3


ENEMY_W equ 2 ;cells
ENEMY_H equ 8 ;pixels/lines


;type,current step
enemies:
    db DEAD,0
    db DEAD,0
    db DEAD,0
    db DEAD,0
    db DEAD,0
    db 255
ENEMY_DATA_LENGTH equ 2


; ASM data file from a ZX-Paintbrush picture with 16 x 8 pixels (= 2 x 1 characters)
; line based output of pixel data:
enemysprite_1:
    db %00000011, %11000000
    db %00000100, %00100000
    db %00001011, %00010000
    db %00001010, %00010000
    db %00011000, %00111000
    db %01111111, %11111110
    db %11111111, %11111111
    db %00001111, %11110000
;


enemy_spawn:
    ld ix,enemies
espawn_start:
    ld a,(ix)
    cp 255
    ret z
    
    cp DEAD
    jp nz, espawn_next

    ld (ix),SAUCER
    ld (ix+1),0 ;steps=0

    ld a,6
    call 0x229b
    ret

espawn_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp espawn_start





; enemies_update:
;     call update_enemies
;     ret



enemies_draw:
    call draw_enemies
    ret

draw_enemies:
    ld ix,enemies
de_start:
    ld a,(ix)
    cp 255
    ret z

    cp DEAD
    jp z, de_next

    ;point HL at correct flight pattern
    ld hl,(current_pattern)

    ;draw sprite at correct position
    
    ld de,0 ;ensure de=0
    ld e,(ix+1) ;d=current step
    add hl,de ;move HL forward number of steps
    ld d,(hl) ;e=y pos from flightpattern
    push hl
    inc hl
    ld e,(hl) ;d=x pos 
    ld bc,enemysprite_1 ;bc=sprite
    call drawsprite16_8

    pop hl
    ld a,(hl)
    cp 0
    push af
    call z,kill_enemy
    pop af
    jp z,de_next

    ld a,(ix+1)
    add a,2
    ld (ix+1),a


    
de_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp de_start


;IX=the enemy
kill_enemy:
    ld (ix),DEAD
    ld a,7
    call 0x229B
    ret