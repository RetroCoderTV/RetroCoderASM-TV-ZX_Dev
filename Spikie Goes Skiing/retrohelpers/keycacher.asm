;Usage:
;first call check_keys
;compare states of cached values (eg. keypressed_W) before doing movement/actions etc.
;after all actions, call reset_keys


; 32766 B, N, M, Symbol Shift, Space
; 49150 H, J, K, L, Enter
; 57342 Y, U, I, O, P
; 61438 6, 7, 8, 9, 0
; 63486 5, 4, 3, 2, 1
; 64510 T, R, E, W, Q
; 65022 G, F, D, S, A
; 65278 V, C, X, Z, Caps Shift


keypressed_W db FALSE
keypressed_A db FALSE
keypressed_S db FALSE
keypressed_D db FALSE

keypressed_F db FALSE
keypressed_F_Held db FALSE
keypressed_I db FALSE
keypressed_Q db FALSE

check_keys:
    ld a,(keypressed_F)
    cp TRUE
    call z, set_F_Held
    call nz, reset_F_Held

    xor a
    ld (keypressed_W),a
    ld (keypressed_A),a
    ld (keypressed_S),a
    ld (keypressed_D),a
    ld (keypressed_F),a
    ld (keypressed_I),a
    ld (keypressed_Q),a
    

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
    rra
    push af
    call nc, set_F
    pop af
    ld bc,64510 ;QWERT
    in a,(c)
    rra ;Q
    push af
    call nc, set_Q
    pop af
    rra ;W
    push af
    call nc, set_W
    pop af
    ld bc,57342 ;POIUY
    in a,(c)
    rra ;P
    rra ;O
    rra ;I
    push af
    call nc, set_I
    pop af



    ret

set_W:
    ld a,TRUE
    ld (keypressed_W),a
    ret

set_A:
    ld a,TRUE
    ld (keypressed_A),a
    ret

set_S:
    ld a,TRUE
    ld (keypressed_S),a
    ret

set_D:
    ld a,TRUE
    ld (keypressed_D),a
    ret

set_F:
    ld a,TRUE
    ld (keypressed_F),a
    ret


set_F_Held:
    ld a,TRUE
    ld (keypressed_F_Held),a
    ret 

reset_F_Held:
    xor a
    ld (keypressed_F_Held),a
    ret



set_I:
    ld a,TRUE
    ld (keypressed_I),a
    ret


set_Q:
    ld a,TRUE
    ld (keypressed_Q),a
    ret

    