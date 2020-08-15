xfer ld (stptr),sp ; store stack pointer.
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
    .
    .
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