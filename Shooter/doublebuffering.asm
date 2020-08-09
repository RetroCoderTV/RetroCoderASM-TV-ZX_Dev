SEG1 equ 0x4082
SEG2 equ 0x4802
SEG3 equ 0x5002
P0 equ 0
P1 equ 256
P2 equ 512
P3 equ 768
P4 equ 1024
P5 equ 1280
P6 equ 1536
P7 equ 1792
C0 equ 0
C1 equ 32
C2 equ 64
C3 equ 96
C4 equ 128
C5 equ 160
C6 equ 192
C7 equ 224


xfer: 
    ld (stptr),sp ; store stack pointer.
    ; Character line 0.
    ld sp,WINDOW ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,SEG1+C0+P0+14 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;.
    ;.
    ld sp,WINDOW+4784 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,SEG3+C7+P7+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
okay: 
    ld sp,(stptr) ; restore stack pointer.
    ret


stptr db 0