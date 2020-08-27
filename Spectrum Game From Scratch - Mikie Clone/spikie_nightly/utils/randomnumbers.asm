;returns with random number betweem 0-255 in A
getrandom:
    ld hl,(seed)
    ld a,h 
    and 31 ;keep within first 8k of memory 
    ld h,a
    ld a,(hl)
    inc hl
    ld (seed),hl
    ret



seed dw 888





