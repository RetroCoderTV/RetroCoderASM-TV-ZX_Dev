;enemy types
DEAD equ 0
BOBHEAD equ 1
FALCON equ 2




;type,x,y,w,h,speedx,speedy,
enemies:
    db DEAD,0,0,0,0,0,0
    db DEAD,0,0,0,0,0,0
    db DEAD,0,0,0,0,0,0
    db DEAD,0,0,0,0,0,0
    db DEAD,0,0,0,0,0,0
    db 255

enemysprite_1:
    db %00000111, %11000000
    db %00011000, %00110000
    db %00110000, %00011000
    db %00111000, %00111000
    db %00111100, %01111000
    db %00101111, %11101000
    db %00011111, %11110000
    db %00001111, %11100000


