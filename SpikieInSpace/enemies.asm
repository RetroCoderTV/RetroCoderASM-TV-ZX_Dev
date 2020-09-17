;enemy types
DEAD equ 0
BOBHEAD equ 1
FALCON equ 2




;type,x,y,w,h,speedx,speedy,
enemies:
    db DEAD,0,0,0,0,1,0
    db DEAD,0,0,0,0,1,0
    db DEAD,0,0,0,0,1,0
    db DEAD,0,0,0,0,1,0
    db DEAD,0,0,0,0,1,0
    db 255
ENEMY_DATA_LENGTH equ 7

enemysprite_1:
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111000, %00111000
    db %00111100, %01111000
    db %00101111, %11101000
    db %00011111, %11110000
    db %00001111, %11100000


enemies_update:
    ret



enemies_draw:

    ret



draw_enemies:
    ld ix,enemies
de_start:
    ld a,(ix)
    cp 255
    ret z

    cp DEAD
    jp z, de_next

    ld bc,enemysprite_1
    ld d,(ix+1)
    ld e,(ix+2)
    call drawsprite16_8


de_next:
    ld de,ENEMY_DATA_LENGTH
    add ix,de
    jp de_start