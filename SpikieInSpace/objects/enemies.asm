;enemy types
DEAD equ 0
SAUCER equ 1
FALCON equ 2
BOBHEAD equ 3
ALIVE equ 69


ENEMY_W equ 2 ;cells
ENEMY_H equ 8 ;pixels/lines


;type,x,y,current step
enemies:
    db DEAD,0,0,0
    db DEAD,0,0,0
    db DEAD,0,0,0
    db DEAD,0,0,0
    db DEAD,0,0,0
    db 255
ENEMY_DATA_LENGTH equ 4


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
    ld (ix+3),0 ;steps=0
    
    ret ;get out from loop, so that only 1 is spawned

espawn_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp espawn_start




enemies_draw:
    ld a,1
    call 0x229b
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
    ld e,(ix+3) ;d=current step
    add hl,de ;move HL forward number of steps
    
    ld d,(hl) ;d=x pos from flightpattern
    push hl
    inc hl
    ld e,(hl) ;e=y pos 
    ld a,(wave_y_offset)
    add a,e
    ld e,a
    ld (ix+1),d ;store x pos
    ld (ix+2),e ; store y pos
    ld bc,enemysprite_1 ;bc=sprite
    call drawsprite16_8
    call check_collision_enemy_bullet
    call check_collision_enemy_player

    pop hl
    ld a,(hl)
    cp 0
    push af
    call z,kill_enemy
    pop af
    jp z,de_next

    
    ld a,(ix+3)
    add a,2
    ld (ix+3),a ;step += 2
de_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp de_start


;IX=the enemy
kill_enemy:
    ld (ix),DEAD
    ret


;IX=enemy
check_collision_enemy_player:
    ld a,(ix+1) 
    ld b,a ;B=enemy x
    ld a,(playerx)
    add a,PLAYER_WIDTH
    cp b
    ret c

    ld a,(playerx)
    ld b,a
    ld a,(ix+1) 
    add a,2 ;add enemy width A=enemy right side
    cp b
    ret c

    ld a,(playery)
    ld b,a
    ld a,(ix+2)
    add a,8 ;add enemy height    
    cp b
    ret c

    ld a,(ix+2)
    ld b,a ;B=enemy top
    ld a,(playery)
    add a,PLAYER_HEIGHT
    cp b
    ret c

    ;if here, collision....
    call player_kill

    ret



;IX=enemy
check_collision_enemy_bullet:
    ld hl,bullets_player
chkcoll_eb_start:
    ld a,(hl)
    cp 255
    ret z
    cp DEAD
    jp z,chkcoll_eb_next

    ld a,(ix+1) 
    ld b,a ;B=enemy x
    inc hl
    ld a,(hl)
    dec hl
    add a,1 ; add bullet width
    cp b
    jp c, chkcoll_eb_next

    inc hl
    ld a,(hl) 
    dec hl
    ld b,a ;B= bullet x
    ld a,(ix+1) 
    add a,2 ;add enemy width A=enemy right side
    cp b
    jp c, chkcoll_eb_next

    inc hl
    inc hl
    ld a,(hl) 
    dec hl
    dec hl
    ld b,a ;B=bullet top
    ld a,(ix+2)
    add a,8 ;add enemy height    
    cp b
    jp c, chkcoll_eb_next

    ld a,(ix+2)
    ld b,a ;B=enemy top
    inc hl
    inc hl
    ld a,(hl)
    dec hl
    dec hl
    add a,1 ;A=bullet bottom
    cp b
    jp c, chkcoll_eb_next

    ;here is a collision....
    ld a,5
    call 0x229b

    call kill_enemy
    call bullet_kill
    
    ret


chkcoll_eb_next:
    ld de,BULLET_DATA_LENGTH ;minus 2 because we inc hl twice
    add hl,de
    jp chkcoll_eb_start