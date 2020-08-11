ENTRY_POINT equ 0x9000

    org ENTRY_POINT

    
    call 0xDAF ;cls
    

    ;draw background into buffer
    ld h,SCREEN_BUFFER_START_UB
drawnextpixel:
    ld a,h
    cp SCREEN_BUFFER_END_UB
    jp z, init
    ld (hl), %11111111
    inc hl
    jp drawnextpixel
    
init:
    call changeborder
    jp main

    
main: 

    halt
    
    
    call movebuffertoscreen

    jp main

changeborder:    
    ld a,3
    call 0x229B
    ret



;; DATA ;;;;;;;;;;;;;;;;;;;;;

stack_ptr dw 0
spritex db 10
spritey db 10

sprite:
    db %11111111, %11111111
    db %10000001, %10000001
    db %10000001, %10000001
    db %11111111, %11111111
    db %11111111, %11111111
    db %10000001, %10000001
    db %10000001, %10000001
    db %11111111, %11111111

SCREEN_BUFFER_START equ 0x8000
SCREEN_BUFFER_END equ 0x8E00
SCREEN_BUFFER_START_UB equ 0x80 ;all 'drawing' logic will be applied to this 'virtual screen'
SCREEN_BUFFER_END_UB equ 0x8E ;it actually ends one before this, we will get out of loops if reach this figure
; PIXEL_MEM_START_UB equ 0x40
; PLAY_AREA_PIXEL_MEMORY_START_UB equ 0x48 ;if we start from here we are using approx 2/3 of height of screen. It uses 0xfff (4095) bytes

PLAYAREA_SEG1 equ 0x4802
PLAYAREA_SEG2 equ 0x5002
SEGSIZE equ 0x800
P1 equ 256
P2 equ 512
P3 equ 768
P4 equ 1024
P5 equ 1280
P6 equ 1536
P7 equ 1792
C1 equ 32
C2 equ 64
C3 equ 96
C4 equ 128
C5 equ 160
C6 equ 192
C7 equ 224

BUFFER_MOVE_CHAR_DOWN equ 256
SPECTRUM_MOVE_CHAR_DOWN equ 32

    include "dbuff.asm"

    end ENTRY_POINT