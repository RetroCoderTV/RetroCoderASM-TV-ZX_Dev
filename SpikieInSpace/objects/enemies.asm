
ENEMY_W equ 2 ;cells
ENEMY_H equ 8 ;pixels/lines




ENEMY_HP_SAUCER equ 2
ENEMY_HP_ARROW equ 3
ENEMY_HP_TFIGHTER equ 4
ENEMY_HP_WING equ 5
ENEMY_HP_INVADER equ 1
ENEMY_HP_SPERM equ 2


;isAlive,x,y,current step,colour
enemies:
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db 255
ENEMY_DATA_LENGTH equ 5








; ASM data file from a ZX-Paintbrush picture with 16 x 8 pixels (= 2 x 1 characters)
; line based output of pixel data:
enemysprite_saucer:
    db %00000011, %11000000
    db %00000100, %00100000
    db %00001011, %00010000
    db %00001010, %00010000
    db %00011000, %00111000
    db %01111111, %11111110
    db %11111111, %11111111
    db %00001111, %11110000
;
enemysprite_arrow:
    db %00011111, %00111110
    db %00111101, %11110010
    db %01111001, %11110100
    db %11110001, %11111111
    db %11110001, %11111111
    db %01111001, %11110100
    db %00111101, %11110010
    db %00011111, %00111110
;
enemysprite_tfighter:
    db %01000000, %00000010
    db %11000011, %10000011
    db %11000111, %11000011
    db %11111100, %11111111
    db %11111111, %11111111
    db %11000111, %11000011
    db %11000011, %10000011
    db %01000000, %00000010
;

enemysprite_wing:
    db %10000011, %11000001
    db %01000010, %01000010
    db %01110001, %10001110
    db %00111101, %10111100
    db %00011111, %11111000
    db %00001100, %00110000
    db %00001000, %00010000
    db %00001000, %00010000
;
enemysprite_invader:
    db %00001000, %00100000
    db %00000100, %01000000
    db %01001111, %11100100
    db %01011101, %01110100
    db %01111111, %11111100
    db %00011000, %00110000
    db %00001011, %10100000
    db %00000100, %01000000
;
enemysprite_sperm:
    db %00000000, %00000000
    db %00111000, %00000000
    db %01111100, %11100000
    db %11001111, %11110010
    db %11001111, %00001100
    db %01111100, %00000000
    db %00111000, %00000000
    db %00000000, %00000000
;

;B=Enemy Type
enemy_spawn:
    ld a,(boss_1_isalive)
    cp TRUE
    ret z

    ld ix,enemies
espawn_start:
    ld a,(ix)
    cp 255
    ret z
    
    cp FALSE
    jp nz, espawn_next

    ld (ix),TRUE ;alive=TRUE
    ld (ix+3),0 ;steps=0

    ;set correct hp (based on spritetype)
    ld hl,(current_enemy_spritetype)
    ld a,(hl) ;get first byte from sprite
    cp %00000011  ;saucer? compares are done with 1st byte from each sprite
    jp z,espawn_set_hp_saucer
    cp %00011111 ;arrow?
    jp z,espawn_set_hp_arrow
    cp %01000000 ;tfighter?
    jp z,espawn_set_hp_tfighter
    cp %00001000
    jp z,espawn_set_hp_invader
    cp %10000011
    jp z,espawn_set_hp_wing
    cp %00000000
    jp z,espawn_set_hp_sperm
    
    ; call sound_GSharp_0_05 ; should never get this far
    ; ret ; not needed, unless there was a chance the sprite could be none of the above

espawn_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp espawn_start


espawn_set_hp_saucer:
    ld (ix+4),ENEMY_HP_SAUCER
    ret
espawn_set_hp_arrow:
    ld (ix+4),ENEMY_HP_ARROW
    ret
espawn_set_hp_tfighter:
    ld (ix+4),ENEMY_HP_TFIGHTER
    ret
espawn_set_hp_invader:
    ld (ix+4),ENEMY_HP_INVADER
    ret
espawn_set_hp_wing:
    ld (ix+4),ENEMY_HP_WING
    ret
espawn_set_hp_sperm:
    ld (ix+4),ENEMY_HP_SPERM
    ret
;








enemies_update:
    push ix
    ld ix,enemies
    call upd_start
    pop ix
    ret

upd_start:
    ld a,(ix)
    cp 255
    ret z

    cp FALSE
    jp z, de_next

    ;point HL at correct flight pattern
    ld hl,(current_pattern)

    ;draw sprite at correct position
    ld de,0 ;ensure de=0
    ld e,(ix+3) ;d=current step
    add hl,de ;move HL forward number of steps
    
    push hl
    push ix
    call check_collision_enemy_bullet
    call check_collision_enemy_player
    pop ix
    pop hl

    ld d,(hl) ;d=x pos from flightpattern
    push hl
    inc hl
    ld e,(hl) ;e=y pos 
    ld a,(wave_y_offset)
    add a,e
    ld e,a
    ld (ix+1),d ;store x pos
    ld (ix+2),e ;store y pos
    
    

    pop hl
    ld a,(hl)
    cp 0
    push af
    call z,destroy_enemy
    pop af
    jp z,de_next

    
    ld a,(ix+3)
    add a,2
    ld (ix+3),a ;step+=2
de_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp upd_start


enemies_draw:
    push ix
    ld ix,enemies
    call drw_enemies_start
    pop ix
    ret

drw_enemies_start:
    ld a,(ix)
    cp 255
    ret z
    cp FALSE
    jp z,drw_enemies_next
    
    ld d,(ix+1)
    ld e,(ix+2)
    push de
    ld bc,(current_enemy_spritetype)
    call drawsprite16_8
ue_getrandcolour:
    call rand
    and 7
    cp 0 ;if black, do again
    jp z, ue_getrandcolour
    cp 7 ;if white, do again
    jp z, ue_getrandcolour
    ld b,a
    pop de
    call paint_sprite_2_2
drw_enemies_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp drw_enemies_start



;IX=enemy
check_collision_enemy_player:
    ld a,(ix+1)
    cp 0
    ret z 

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
    call kill_enemy
    
    ld a,(player_shield_active)
    cp TRUE
    ret z

    call player_kill

    ret



;IX=enemy
check_collision_enemy_bullet:
    ld hl,bullets_player
chkcoll_eb_start:
    ld a,(hl)
    cp 255
    ret z
    cp FALSE
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
    ld a,FALSE
    ld (hl),a
    call enemy_take_hit
    
    
    ret
chkcoll_eb_next:
    ld de,BULLET_DATA_LENGTH 
    add hl,de
    jp chkcoll_eb_start






enemy_take_hit:
    ld a,1
    call 0x229b
    dec (ix+4)
    ld a,(ix+4)
    cp 0
    call z,kill_enemy
    
    ret





;IX=the enemy
kill_enemy:
    ld (ix),FALSE
    call increment_score10
    call increment_cash10
    ret
destroy_enemy:
    ld (ix),FALSE
    ld a,FALSE
    ld (player_cashwave),a
    ret



kill_all_enemies:
    ld ix,enemies
killallenemies_start:
    ld a,(ix)
    cp 255
    ret z
    ld (ix),FALSE
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp killallenemies_start
    