;returns with random number betweem 0-255 in A
getrandom:
    ld hl,(seed)
    ld a,h 
    and %00011111 ;and 31
    ld h,a
    ld a,(hl)
    inc hl
    ld (seed),hl
    ret



seed dw 0
