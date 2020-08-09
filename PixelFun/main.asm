ENTRY_POINT equ 32678

    org ENTRY_POINT

    call 0xDAF ;cls

    ld hl,PLAY_AREA_PIXEL_MEMORY_START
drawnextpixel:
    ld a,h
    cp ATTRIBUTE_MEM_START_UPPER_BYTE
    jp z, main
    ld (hl), %11111111
    inc hl
    halt
    jp drawnextpixel
    




main: 
    jp main


testsprite:
    db %10101010, %10101010
    db %10101010, %10101010
    db %10101010, %10101010
    db %10101010, %10101010
    db %10101010, %10101010
    db %10101010, %10101010
    db %10101010, %10101010
    db %10101010, %10101010


PLAY_AREA_PIXEL_MEMORY_START equ 0x4800
ATTRIBUTE_MEM_START_UPPER_BYTE equ 0x58

    end ENTRY_POINT