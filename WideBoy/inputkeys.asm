; 32766 B, N, M, Symbol Shift, Space
; 49150 H, J, K, L, Enter
; 57342 Y, U, I, O, P
; 61438 6, 7, 8, 9, 0
; 63486 5, 4, 3, 2, 1
; 64510 T, R, E, W, Q
; 65022 G, F, D, S, A
; 65278 V, C, X, Z, Caps Shift


keypressed_W db 0
keypressed_A db 0
keypressed_S db 0
keypressed_D db 0

check_keys:
    ld bc,65022 ;ASDFG
    in a,(c)
    rra 
    push af
    call nc, set_A
    pop af
    rra
    push af
    call nc, set_S
    pop af
    rra
    push af
    call nc, set_D
    pop af  
    ld bc,64510 ;QWERT
    in a,(c)
    rra ;Q
    rra ;W
    push af
    call nc, set_W
    pop af
    ret

set_W:
    ld a,1
    ld (keypressed_W),a
    ret

set_A:
    ld a,1
    ld (keypressed_A),a
    ret

set_S:
    ld a,1
    ld (keypressed_S),a
    ret

set_D:
    ld a,1
    ld (keypressed_D),a
    ret

reset_keys:
    xor a
    ld (keypressed_W),a
    ld (keypressed_A),a
    ld (keypressed_S),a
    ld (keypressed_D),a
    ret
    