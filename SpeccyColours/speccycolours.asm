ENTRY_POINT equ 32768

    org ENTRY_POINT

    call 0xDAF ;cls + open ch2


;NOTE: Attribute byte format: FBPPPIII

;paint random colours to each cell in paper only
    ld bc,ATTR_MEM_START ;0x5800
randombackground:
    call getrand ;A=rand
    and %00011000 ;mask out all but some paper colours
    ld (bc),a ;load Attribute memory address with attribute byte
    inc bc ;increment pointer
    ld a,ATTR_MEM_END_UPPER_BYTE
    cp b
    jp nz, randombackground

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



;specific 16x16 sprite only
;INPUTS:
;HL=bitmap pointer
drawplayer:
    ld a,(playery)
    ld b,a
    ld a,(playerx)
    ld c,a
    call yx2pix ;DE=screen address pointer
    ;bitmap line 1
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 2
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 3
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 4
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 5
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 6
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 7
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 8
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 9
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 10
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 11
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 12
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 13
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 14
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 15
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    dec e 
    call nextlinedown
    ;bitmap line 16
    ld a,(hl) ;take byte from bitmap pointer
    ld (de),a ;set byte 1
    inc hl ;increment bitmap to next byte
    inc e ;move screen address right one pixel
    ld a,(hl) 
    ld (de),a ;set byte 2
    ret
 




; Simple pseudo-random number generator.
; Steps a pointer through the ROM (held in seed), returning
; the contents of the byte at that location.
; OUTPUT:
;A=rand
getrand: 
    ld hl,(seed) ; Pointer
    ld a,h
    and 31 ; keep it within first 8k of ROM.
    ld h,a
    ld a,(hl) ; Get "random" number from location.
    inc hl ; Increment pointer.
    ld (seed),hl
    ret

;caches player cell values
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
    ld (playercelly),a
    ret


;0x5800=Start of colour attri memory
;attribute_address=0x5800 + ((y*32)+x)
paintplayer:
    ld h,0
    ld a,(playercelly)
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    add hl,hl ;x8
    add hl,hl ;x16
    add hl,hl ;x32
    ld a,(playercellx)
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTR_MEM_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,YELLOW_INK
    ld e,(hl) ;E=current cell attribute value
    or e ;combine A with E (so that paper bits are kept)
    ld (hl),a
    inc hl
    ld a,YELLOW_INK
    ld e,(hl)
    or e
    ld (hl),a
    dec hl
    ld de,32
    add hl,de
    ld a,YELLOW_INK
    ld e,(hl)
    or e
    ld (hl),a
    inc hl
    ld a,YELLOW_INK
    ld e,(hl)
    or e
    ld (hl),a
    ret


;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

playerx db 8
playery db 8
playercellx db 0
playercelly db 0

YELLOW_INK equ %00000110 

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

seed dw 0


    include 'util\screentools.asm'
    include 'bitmaps.asm'

    end ENTRY_POINT