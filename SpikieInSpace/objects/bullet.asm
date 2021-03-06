
; ASM data file from a ZX-Paintbrush picture with 8 x 2 pixels 
; line based output of pixel data:
bulletsprite:
    db %10101010
    db %01010101

BULLET_COLOUR equ %01000100
BULLET_Y_OFFSET equ PLAYER_HEIGHT/2
BULLET_SPEED equ 2
;isAlive,x,y,speed,power
bullets_player:
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db 255
BULLET_DATA_LENGTH equ 5

BULLET_WIDTH equ 1


;ix=current bullet
bullets_spawn:
    ld a,(playerx)
    ld (ix+1),a
    ld a,(playery)
    add a,BULLET_Y_OFFSET
    ld (ix+2),a

    ld (ix),TRUE
    ret



bullets_update:
    call bullets_move
    ret

;

bullets_draw:
    ld ix,bullets_player
    call drawbullets
    ret

bullets_move:
    ld ix,bullets_player
bmove_start:
    ld a,(ix)
    cp 255
    ret z
    cp FALSE
    jp z, bmove_next

 
    call check_collision_bullet_boss1
    call check_collision_bullet_squid

    ld a,(ix+1)
    add a,BULLET_SPEED
    ld (ix+1),a

    cp MAX_X
    jp c, bmove_next

    ld (ix),FALSE ;kill bullet
bmove_next:
    ld de,BULLET_DATA_LENGTH
    add ix,de
    jp bmove_start


drawbullets:
    ld a,(ix)
    cp 255
    ret z

    cp FALSE
    jp z, db_next

    call drawbullet
db_next:
    ld de,BULLET_DATA_LENGTH
    add ix,de
    jp drawbullets

;IX=current bullet
drawbullet:
    ld d,(ix+1)
    ld e,(ix+2)
    push de
    ld bc,bulletsprite
    call drawsprite8_2
 
    pop de
    ld a,d
    cp GAME_WINDOW_WIDTH+BUFFER_SIDE_EXTRA+1
    ret nc
    ld b,BULLET_COLOUR
    call paint_sprite_1_1
    ret





kill_all_bullets:
    ld ix,bullets_player
kab_start:
    ld a,(ix)
    cp 255
    ret z
    ld (ix),FALSE
    ld de,BULLET_DATA_LENGTH
    add ix,de
    jp kab_start









;IX=bullet
check_collision_bullet_boss1:
    ld a,(boss_1_isalive)
    cp FALSE
    ret z

    ld a,(ix+1) 
    ld b,a ;B=bullet x
    ld a,(boss1_x)
    add a,BOSS_1_WIDTH
    cp b
    ret c

    ld a,(boss1_x)
    ld b,a
    ld a,(ix+1) 
    add a,2 ;add bullet width A=bullet right side
    cp b
    ret c

    ld a,(boss1_y)
    ld b,a
    ld a,(ix+2)
    add a,8 ;add bullet height    
    cp b
    ret c

    ld a,(ix+2)
    ld b,a ;B=bullet top
    ld a,(boss1_y)
    add a,BOSS_1_HEIGHT
    cp b
    ret c

    ;if here, collision....
    
    call boss_1_take_hit
    ;call bullet_kill

    ret











;IX=bullet
check_collision_bullet_squid:
    ld a,(squid_is_alive)
    cp FALSE
    ret z

    ld a,(ix+1) 
    ld b,a ;B=bullet x
    ld a,(squid_x)
    add a,2
    cp b
    ret c

    ld a,(squid_x)
    ld b,a
    ld a,(ix+1) 
    add a,2 ;add bullet width A=bullet right side
    cp b
    ret c

    ld a,(squid_y)
    ld b,a
    ld a,(ix+2)
    add a,8 ;add bullet height    
    cp b
    ret c

    ld a,(ix+2)
    ld b,a ;B=bullet top
    ld a,(squid_y)
    add a,8
    cp b
    ret c

    ;if here, collision....
    ld (ix),FALSE
    call kill_squid ;todo: squid take hit


    ret
