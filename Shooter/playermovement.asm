;Keyboard ports:
;INPUT PORTS:
;32766 B, N, M, Symbol Shift, Space
;49150 H, J, K, L, Enter
;57342 Y, U, I, O, P
;61438 6, 7, 8, 9, 0 (*1) *Joystick
;63486 5, 4, 3, 2, 1 (*2) 
;64510 T, R, E, W, Q
;65022 G, F, D, S, A
;65278 V, C, X, Z, Caps Shift

;INPUTS:
;IX=playerdata pointer
checkkeys:
    ld bc,65022 ;ASDFG port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    push af
    call nc, moveleft ;A Pressed
    pop af
    rra 
    push af
    call nc, fire ;S Pressed
    pop af
    rra 
    push af
    call nc, moveright ;D Pressed
    pop af
    ;rra 
    ;push af
    ;call nc, F Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, G Pressed
    ;pop af
    ret


; Here are some general rules on using CP
; Unsigned

; If A == N, then Z flag is set.
; If A != N, then Z flag is reset.
; If A < N, then C flag is set.
; If A >= N, then C flag is reset.

moveleft:  
    ld a,(ix+1)
    cp PLAYER_SPEED_X
    ret c
    sub PLAYER_SPEED_X
    ld (ix+1),a
    ret

moveright:  
    ld a,(ix+1)
    cp SCREEN_WIDTH-PLAYER_SPEED_X-PLAYER_WIDTH_PX
    ret nc
    add a,PLAYER_SPEED_X
    ld (ix+1),a
    ret

fire:
    ld a,(bullet_timer)
    cp BULLET_INTERVAL
    ret c
    ld iy,bulletdata
    call spawnbullet
    xor a
    ld (bullet_timer),a ;reset timer to 0
    ret



