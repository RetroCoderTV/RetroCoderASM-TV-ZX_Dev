ENTRY_POINT equ 32768

    org ENTRY_POINT

    call 0xDAF ;cls + open ch2

main:
    halt 
    ld hl,bitmap1
    call deleteplayer
    call moveplayer
    ld hl,bitmap1
    call drawplayer
    jp main

deleteplayer:
    ld a,(playery)
    ld b,a
    ld a,(playerx)
    ld c,a
    call yx2pix ;DE=screen address
    ;bitmap line 1
    xor a
    ld (de),a ;set byte 1
    inc hl
    inc e
    xor a ;todo: check if needed this?
    ld (de),a ;set byte 2
    dec e
    call nextlinedown
    ;line 2
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a ;?
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 3
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 4
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 5
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 6
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 7
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 8
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 9
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 10
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 11
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 12
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 13
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 14
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 15
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 16
    inc hl
    xor a
    ld (de),a ;byte 1
    inc hl 
    inc e
    xor a
    ld (de),a ;byte 2
    ;dec e
    ;call nextlinedown
    ret

;
;Checks keys and moves player if pressed.
moveplayer:
    ld bc,0xFDFE ;ASDFG port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    push af
    call nc, moveleft ;TODO: create function for this
    pop af
    rra 
    push af
    call nc, movedown
    pop af
    rra 
    push af
    call nc, moveright
    pop af
    ;rra 
    ;push af
    ;call nc, F Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, G Pressed
    ;pop af

    ld bc,0xFBFE ;QWERT port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    ;push af
    ;call nc, Q Pressed
    ;pop af
    rra 
    push af
    call nc, moveup
    pop af
    ;rra 
    ;push af
    ;call nc, E Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, R Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, T Pressed
    ;pop af
    ret 

moveleft:
    ld a,(playerx)
    cp 0
    ret z
    ld a,(playerx) ;TODO: is this needed?
    dec a
    ld (playerx),a
    ret
moveright:
    ld a,(playerx)
    cp MAXIMUM_X
    ret nc
    ld a,(playerx) ;TODO: is needed?
    inc a
    ld (playerx),a
    ret
moveup:
    ld a,(playery)
    cp 0
    ret z
    ld a,(playery)
    dec a
    ld (playery),a
    ret
movedown:
    ld a,(playery)
    cp MAXIMUM_Y
    ret z
    ld a,(playery)
    inc a
    ld (playery),a
    ret

;specific to 16x16 sprite
;INPUTS:
;HL=bitmap pointer
drawplayer:
    ld a,(playery)
    ld b,a
    ld a,(playerx)
    ld c,a
    call yx2pix ;DE=screen address
    ;bitmap line 1
    ld a,(hl) 
    ld (de),a ;set byte 1
    inc hl
    inc e
    ld a,(hl)
    ld (de),a ;set byte 2
    dec e
    call nextlinedown
    ;line 2
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 3
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 4
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 5
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 6
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 7
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 8
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 9
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 10
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 11
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 12
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 13
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 14
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 15
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    dec e
    call nextlinedown
    ;line 16
    inc hl
    ld a,(hl)
    ld (de),a ;byte 1
    inc hl 
    inc e
    ld a,(hl)
    ld (de),a ;byte 2
    ;dec e
    ;call nextlinedown
    ret




;
;again specific to the 16x16 player
;0x5800 = start of attributes memory
;formula is straight forward as you would expect a 2d array to be...
;attr address = 0x5800 + ((y*32)+x)
paintplayer:
    ld hl,0x5800

;
;
;;;; DATA STARTS ;;;;;;;;;;;;;;;;
    include "util\screentools.asm"
    include "bitmaps.asm"

playerx db 5
playery db 5

MAXIMUM_X equ (32*8)-17
MAXIMUM_Y equ (24*8)-17

;Useful addresses:
ATTR_MEMORY_START equ 0x5800

;ink masks, would need to be masked with BG attribute paper bits 
;otherwise will always result in black paper
YELLOW_INK equ %00000110 

    end ENTRY_POINT