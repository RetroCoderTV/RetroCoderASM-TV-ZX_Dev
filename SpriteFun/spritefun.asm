ENTRY_POINT equ 32768

    org ENTRY_POINT

    call 0xDAF ;cls + open ch2

    ;paint the bg a random colour each cell. Note the colour memory can be treated
    ;as a 1D array since we dont care about how the colours are laid out
    ld bc,ATTR_MEM_START
crazybg:    
    call getrand ;A=rand
    and %00011000 ;mask out all but paper bits (also mask upper paper bit to avoid yellow paper)
    ld (bc),a
    inc bc
    ld a,ATTR_MEM_END_UPPER_BYTE
    cp b 
    halt
    halt
    halt
    halt ;add lots halts so we can see each square drawn in order
    jp nz, crazybg ;jump back if H not equal to ATTRIBUTE MEM END
    

main:
    halt 
    ld hl,bitmap1
    call deleteplayer
    call moveplayer
    ld hl,bitmap1
    call drawplayer
    call paintplayer
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

    call calculate_cells_xy
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

;NO INPUTS - paints player yellow, doesnt handle 'paper' correctly
;again specific to the 16x16 player
;0x5800 = start of attributes memory
;formula is straight forward as you would expect a 2d array to be...
;attr address = 0x5800 + ((y*32)+x) --note: x and y are in CHARACTERS not pixels!
paintplayer:
    ld h,0 
    ld a,(playercelly)
    ld l,a ;HL=player y
    add hl,hl ;x2
    add hl,hl ;x4
    add hl,hl ;x8
    add hl,hl ;x16
    add hl,hl ;x32
    ld a,(playercellx)
    ld d,0   
    ld e,a
    add hl,de ;HL = ((y*32)+x)
    ld de,0x5800
    add hl, de ;HL = 0x5800 + ((y*32)+x)
    ld a,YELLOW_INK
    ld e,(hl) ;E=current cell attribute value
    or e ;combine A with E (so that paper bits are kept)
    ld (hl),a
    inc hl
    ld a,YELLOW_INK
    ld e,(hl) ;E=current cell attribute value
    or e ;combine A with E (so that paper bits are kept)
    ld (hl),a
    dec hl
    ld de,32
    add hl,de
    ld a,YELLOW_INK
    ld e,(hl) ;E=current cell attribute value
    or e ;combine A with E (so that paper bits are kept)
    ld (hl),a
    inc hl
    ld a,YELLOW_INK
    ld e,(hl) ;E=current cell attribute value
    or e ;combine A with E (so that paper bits are kept)
    ld (hl),a
    ret

calculate_cells_xy:
	ld a,(playerx)
	ld c,a
	ld d,8
	ld b,8
     xor a
       sla c
       rla
       cp d
       jr c,$+4
         inc c
         sub d
       djnz $-8
	ld a,c
	ld (playercellx),a
	ld a,(playery)
	ld c,a
	ld a,8
	ld d,a
	ld b,8
     xor a
       sla c
       rla
       cp d
       jr c,$+4
         inc c
         sub d
       djnz $-8
	ld a,c
	ld (playercelly), a
    ret

; Simple pseudo-random number generator.
; Steps a pointer through the ROM (held in seed), returning
; the contents of the byte at that location.
getrand: 
    ld hl,(seed) ; Pointer
    ld a,h
    and 31 ; keep it within first 8k of ROM.
    ld h,a
    ld a,(hl) ; Get "random" number from location.
    inc hl ; Increment pointer.
    ld (seed),hl
    ret

;
;
;;;; DATA STARTS ;;;;;;;;;;;;;;;;
    include "util\screentools.asm"
    include "bitmaps.asm"

seed dw 0

painter_currentcell dw 0

playerx db 8 ;lock his start pos in characters, else the colours won't fill fully the sprite
playery db 8
playercellx db 0
playercelly db 0

MAXIMUM_X equ (32*8)-17
MAXIMUM_Y equ (24*8)-17

;Useful constants:
ATTR_MEM_START equ 0x5800
ATTR_MEM_END_UPPER_BYTE equ 0x5B
ATTR_MEM_SIZE equ 32 * 24
SCREEN_WIDTH_CHARS equ 32
SCREEN_HEIGHT_CHARS equ 24
SCREEN_WIDTH equ SCREEN_WIDTH_CHARS * 8
SCREEN_HEIGHT equ SCREEN_HEIGHT_CHARS * 8

;ink masks, would need to be masked with BG attribute paper bits 
;otherwise will always result in black paper
YELLOW_INK equ %00000110 

    end ENTRY_POINT