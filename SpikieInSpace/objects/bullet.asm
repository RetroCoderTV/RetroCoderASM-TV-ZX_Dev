
; ASM data file from a ZX-Paintbrush picture with 8 x 2 pixels 
; line based output of pixel data:
bulletsprite:
    db %10101010
    db %01010101


BULLET_Y_OFFSET equ PLAYER_HEIGHT/2
BULLET_SPEED equ 2
;isAlive,x,y,speed,power
bullets_player:
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db FALSE,0,0,0,0
    db 255
BULLET_DATA_LENGTH equ 5


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
    
    cp 0
    jp z, bmove_next

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

    cp 0
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
    ld bc,bulletsprite
    call drawsprite8_2
    ret


;HL=bullet
bullet_kill:
    ld (hl),FALSE
    ret
