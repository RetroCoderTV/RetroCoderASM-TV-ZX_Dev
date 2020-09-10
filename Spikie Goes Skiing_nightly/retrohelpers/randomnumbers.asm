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



seed dw 1256






rand:        ld        hl, $A280       ; yw -> zt
            ld        de, $C0DE       ; xz -> yw
            ld        (rand+4), hl      ; x = y,  z = w
            
            ld        a, l             ; w = w ^ ( w << 3 )
            add        a, a
            add        a, a
            add        a, a
            xor        l
            ld        l, a
            
            ld        a, d             ; t = x ^ (x << 1)
            add        a, a
            xor        d
            ld        h, a
            rra                     ; t = t ^ (t >> 1) ^ w
            xor        h
            xor        l
            
            ld        h, e             ; y = z
            ld        l, a             ; w = t
            ld        (rand+1), hl

            ret



