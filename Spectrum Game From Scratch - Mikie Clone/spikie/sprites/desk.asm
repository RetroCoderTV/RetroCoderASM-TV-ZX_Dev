DESK_COLOUR equ %01110000 ;yellow paper /  black ink

DESK_DATA_LENGTH equ 5

DESK_STOOL_OFFSET_X equ 1
DESK_STOOL_OFFSET_Y equ 12

;format:
;isalive,x,y,w,h
desksdata:
    db 1,6,88,4,16
    db 2,14,88,4,16
    db 3,6,120,4,16
    db 4,14,120,4,16
    db 99,6,152,4,16
    db 5,14,152,4,16
    db 255

; ASM data file from a ZX-Paintbrush picture with 32 x 16 pixels (= 4 x 2 characters)
; line based output of pixel data:
desksprite:
    db %11111111, %11111111, %11111111, %11111111
    db %11000000, %00000000, %00000000, %00000011
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    ;
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %10000000, %00000000, %00000000, %00000001
    db %11000000, %00000000, %00000000, %00000011
    db %11111111, %11111111, %11111111, %11111111
    db %10000000, %00000000, %00000000, %00000001
    db %11111111, %11111111, %11111111, %11111111
    ;
    db %00000111, %00000000, %00000000, %11100000
    db %00000111, %00000000, %00000000, %11100000
    db %00000111, %00001111, %11110000, %11100000
    db %00000111, %00001111, %11110000, %11100000
    db %00000111, %00001111, %11110000, %11100000
    db %00000111, %00001111, %11110000, %11100000
    db %00000000, %00001111, %11110000, %00000000
    db %00000000, %00000110, %01100000, %00000000
    ;
    