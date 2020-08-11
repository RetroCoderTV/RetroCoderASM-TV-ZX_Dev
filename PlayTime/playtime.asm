ENTRY_POINT equ 0x9000

    org ENTRY_POINT

    call 0xDAF ;cls

    ld hl, PLAYAREA_BUFFER_START
drawbackground:
    ld a, h
    cp PLAYAREA_BUFFER_END_UB
    jp z, init
    ld (hl),%11111111
    inc hl
    jp drawbackground



init:
    ld a,3
    call 0x229B ;change border to '3'
    jp main

main:
    halt
    halt
    call movebuffertoscreen

    jp main





spritex db 0
spritey db 0
sprite:
    db %11111111
    db %10011001
    db %10011001
    db %11111111
    db %11111111
    db %10011001
    db %10011001
    db %11111111


PLAYAREA_BUFFER_START equ 0x8000
PLAYAREA_BUFFER_START_UB equ 0x80
PLAYAREA_BUFFER_END_UB equ 0x90

SCREEN_MEM_START equ 0x4000

PLAYAREA_SEG1 equ 0x4800
PLAYAREA_SEG2 equ 0x5000

HALFLINE equ 14
ENDLINE equ 28


SEGSIZE equ 0x800 

P1 equ 256
P2 equ 512
P3 equ 768
P4 equ 1024
P5 equ 1280
P6 equ 1536
P7 equ 1792

    include 'doublebuffering.asm'

    end ENTRY_POINT
