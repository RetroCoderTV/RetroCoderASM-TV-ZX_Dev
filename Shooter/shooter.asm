ENTRY_POINT equ 32768

    org ENTRY_POINT

    call 0xDAF
    ld a,0
    call 0x229B

maingame:
    halt
    halt
    halt
    

    ld a,(bullet_timer)
    inc a
    ld (bullet_timer),a

    ld ix,bulletdata
    call updatebullets

    ld ix,playerdata
    call deletesprite

    ld ix,enemydata
    call updateenemies

    ld ix,playerdata
    call checkkeys

    ld ix,enemydata
    ld hl,enemy1
    call drawenemies
   
    ld ix,playerdata
    ld hl,ship1
    call drawsprite

    ld ix,bulletdata
    ld hl,bullet1
    call drawbullets

    ld ix,enemydata
    ld a,(b_enemyspawncomplete)
    cp 0
    call z,spawnenemywave

    jp maingame

spawnbullet:
    ld a,(iy)
    cp 255
    ret z
    cp 1
    jp z, spawnbullet_gonext
    ;spawn it...
    ld a,1
    ld (iy),a
    ld a,(ix+1)
    ld (iy+1),a
    ld a,(ix+2)
    sub 8 ;move bullet up 8 pixels
    ld (iy+2),a
    ret
spawnbullet_gonext:
    ld bc,BULLET_DATA_LENGTH
    add iy,bc
    jp spawnbullet

updatebullets:
    ld a,(ix)
    cp 255
    ret z
    cp 0
    jp z, updatebullets_gonext
    call deletesprite
    ;move bullets...
    ld a,(ix+2)
    cp BULLET_MIN_Y
    call c, killbullet
    jp c, updatebullets_gonext
    sub BULLET_SPEED
    ld (ix+2),a
updatebullets_gonext:
    ld bc,BULLET_DATA_LENGTH
    add ix,bc
    jp updatebullets

killbullet:
    ld (ix),0
    ret

drawbullets:
    ld a,(ix)
    cp 255
    ret z
    cp 0
    jp z, drawbullets_gonext
    ;if here, bullet alive..
    push hl
    call drawsprite
    pop hl
drawbullets_gonext:
    ld bc,BULLET_DATA_LENGTH
    add ix,bc
    jp drawbullets
;

; all enemies 'isAlive' should be set to 0 before calling
spawnenemywave:
    ld a,(ix)
    cp 255
    jp z,endspawn
    ld (ix),1
    ld bc,ENEMY_DATA_LENGTH
    add ix,bc
    jp spawnenemywave
endspawn:
    ld a,1
    ld (b_enemyspawncomplete),a
    ret

updateenemies:
    ld a,(ix)
    cp 255
    ret z
    cp 0
    jp z, updateenemies_gonext
    call deletesprite
    ;move enemies here...
    ;...
updateenemies_gonext:
    ld bc,ENEMY_DATA_LENGTH
    add ix,bc
    jp updateenemies

drawenemies:
    ld a,(ix)
    cp 255
    ret z
    cp 0
    jp z, drawenemies_gonext
    push hl
    call drawsprite
    pop hl
drawenemies_gonext:
    ld bc,ENEMY_DATA_LENGTH
    add ix,bc
    jp drawenemies


;; DATA/VARIABLES ;;;;

;sprite data format:
;isAlive,x,y,sizex (cells),sizey (lines)

playerdata:
    db 1,(255/2)-7,180-8,2,16

bulletdata:
    db 0,0,0,1,8
    db 0,0,0,1,8
    db 255
BULLET_DATA_LENGTH equ 5

enemydata:
    db 0,((255/5)*0)+8,48,2,8
    db 0,((255/5)*1)+8,48,2,8
    db 0,((255/5)*2)+8,48,2,8
    db 0,((255/5)*3)+8,48,2,8
    db 0,((255/5)*4)+8,48,2,8
    db 255
ENEMY_DATA_LENGTH equ 5

SCREEN_WIDTH equ 255

PLAYER_WIDTH_PX equ 16
PLAYER_SPEED_X equ 12

BULLET_SPEED equ 16
BULLET_MIN_Y equ 13
BULLET_INTERVAL equ 8

ENEMY_DEFAULT_Y equ 24
ENEMY_DEFAULT_SPEED equ 4

bullet_timer db 0
b_enemyspawncomplete db 0



    include 'bitmaps.asm'
    include 'playermovement.asm'
    include 'util/randomgenerators.asm'
    include 'util\screentools.asm'
    include 'util\soundtools.asm'
    include 'util\spritetools.asm'


    end ENTRY_POINT