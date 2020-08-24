; HEART_COLLISION_OFFSET_X db 0
; HEART_COLLISION_OFFSET_Y db 0

HEART_DATA_LENGTH equ 5
HEART_ICON_DATA_LENGTH equ 3
; ASM data file from a ZX-Paintbrush picture with 16 x 8 pixels (= 2 x 1 characters)
; line based output of pixel data:
heartsprite:
    db %00000000, %00000000
    db %00000110, %01100000
    db %00001111, %11110000
    db %00001111, %11110000
    db %00000111, %11100000
    db %00000011, %11000000
    db %00000001, %10000000
    db %00000000, %00000000


; ASM data file from a ZX-Paintbrush picture with 8 x 8 pixels (= 1 x 1 characters)
; line based output of pixel data:
heart_icon:
    db %00000000
    db %00100100
    db %01111110
    db %11111111
    db %11111111
    db %01111110
    db %00111100
    db %00011000