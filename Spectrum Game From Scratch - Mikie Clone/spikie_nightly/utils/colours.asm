
;Colours
COLOUR_BLACK equ 0  ;%000
COLOUR_BLUE equ 1   ;%001
COLOUR_RED equ 2    ;%010
COLOUR_PINK equ 3   ;%011
COLOUR_GREEN equ 4  ;%100
COLOUR_CYAN equ 5   ;%101
COLOUR_YELLOW equ 6 ;%110
COLOUR_WHITE equ 7  ;%111

;ink only, use masking for paper bits
BLACK_INK   equ %00000000
BLUE_INK    equ %00000001
YELLOW_INK  equ %00000110 

;paper only, use masking for ink bits
BLACK_PAPER   equ %00000000
BLUE_PAPER    equ %00001000
YELLOW_PAPER  equ %00110000 

;Speccy mem address
ATTRIBUTE_MEMORY_START equ 0x5800
ATTRIBUTE_MEMORY_END_UB equ 0x5B
ATTRIBUTE_MEMORY_LENGTH equ 0x300

setborderblue:
    ld a,1
    call 0x229B
    ret

setborderpink:
    ld a,3
    call 0x229B
    ret

setbordergreen:
    ld a,4
    call 0x229B
    ret

;HL=0x5800
;DE=attr pointer
paint_bg:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    ld a,(de)
    ld (hl),a
    inc hl
    inc de
    jp paint_bg
    ret

;paint all cells random paper and pink ink (and random brightness bit)
paintcellsrandom:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    push hl
    call getrandom
    and %01011111
    or  %00011100
    pop hl
    ld (hl),a
    inc hl
    jp paintcellsrandom


;hardcode to paint just exit sign text
paintexitsign_text: 
    ld h,0
    ld a,(exity)
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,(exitx)
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld de,SCREEN_WIDTH
    add hl,de ;go forward 1 line
    inc hl ;go forward 1 byte
    ld a,iyl
    ld (hl),a ;0,0
    inc hl
    ld (hl),a ;0,1
    ret


;0x5800=Start of colour attri memory
;attribute_address=0x5800 + ((y*32)+x)
paintplayer_16_24:
    ld h,0
    ld a,(playery)
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,(playerx)
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,BLACK_INK
    ld e,(hl) ;E=current cell attribute value
    or e ;combine A with E (so that paper bits are kept)
    ld (hl),a ;0,0
    inc hl
    ld a,BLACK_INK
    ld e,(hl)
    or e
    ld (hl),a ;1,0
    dec hl
    ld de,32
    add hl,de
    ld a,BLACK_INK
    ld e,(hl)
    or e
    ld (hl),a ;0,1
    inc hl
    ld a,BLACK_INK
    ld e,(hl)
    or e
    ld (hl),a ;1,1
    dec hl
    ld de,32
    add hl,de
    ld a,BLACK_INK
    ld e,(hl)
    or e
    ld (hl),a ;0,2
    inc hl
    ld a,BLACK_INK
    ld e,(hl)
    or e
    ld (hl),a ;1,2
    ret







;0x5800=Start of colour attri memory
;attribute_address=0x5800 + ((y*32)+x)
;Input
;B=xpos
;C=ypos
;iyl=Colour byte
paintsprite_16_32:
    ld h,0
    ld a,c
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,b
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,iyl
    ld e,(hl) ;E=current cell attribute value
    ld (hl),a ;0,0
    inc hl
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;1,0
    dec hl
    ld de,32
    add hl,de
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;0,1
    inc hl
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;1,1
    dec hl
    ld de,32
    add hl,de
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;0,2
    inc hl
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;1,2
    dec hl
    ld de,32
    add hl,de
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;0,3
    inc hl
    ld a,iyl
    ld e,(hl)
    
    ld (hl),a ;1,3
    ret


    

;0x5800=Start of colour attri memory
;attribute_address=0x5800 + ((y*32)+x)
;Input
;B=xpos
;C=ypos
;iyl=Colour byte
paintsprite_32_16:
    ld h,0
    ld a,c
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,b
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,iyl
    ld (hl),a ;0,0
    inc hl
    ld (hl),a ;1,0
    inc hl
    ld (hl),a ;2,0
    inc hl
    ld (hl),a ;3,0
    ld de,29
    add hl,de
    ld (hl),a ;0,1
    inc hl
    ld (hl),a ;1,1
    inc hl
    ld (hl),a ;2,1
    inc hl
    ld (hl),a ;3,1
    ret












;Input
;B=xpos
;C=ypos
;iyl=Colour byte
paintsprite_32_24:
    ld h,0
    ld a,c
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,b
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,iyl
    ld (hl),a ;0,0
    inc hl
    ld (hl),a ;1,0
    inc hl
    ld (hl),a ;2,0
    inc hl
    ld (hl),a ;3,0
    ld de,29
    add hl,de
    ld (hl),a ;0,1
    inc hl
    ld (hl),a ;1,1
    inc hl
    ld (hl),a ;2,1
    inc hl
    ld (hl),a ;3,1
    ld de,29
    add hl,de
    ld (hl),a ;0,2
    inc hl
    ld (hl),a ;1,2
    inc hl
    ld (hl),a ;2,2
    inc hl
    ld (hl),a ;3,2
    ret


;Input
;B=xpos
;C=ypos
;iyl=Colour byte
paintsprite_16_8:
    ld h,0
    ld a,c
    ld l,a ;HL=player cell y*8
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,b
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,iyl
    ld (hl),a ;0,0
    inc hl
    ld (hl),a ;1,0
    ret

















;;;;;;;;32 16
;0x5800=Start of colour attri memory
;attribute_address=0x5800 + ((y*32)+x)
;Input
;B=xpos
;C=ypos
;iyl=Colour byte
paintsprite_48_32:
    ld h,0
    ld a,c
    ld l,a ;HL=player cell y
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,b
    ld d,0
    ld e,a
    add hl,de ;HL=((y*32)+x)
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;HL = 0x5800 + ((y*32)+x)
    ld a,iyl
    ld (hl),a ;0,0
    inc hl
    ld (hl),a ;1,
    inc hl
    ld (hl),a ;2,
    inc hl
    ld (hl),a ;3,
    inc hl
    ld (hl),a ;4,
    inc hl
    ld (hl),a ;5,
    ld de,27
    add hl,de
    ld (hl),a ;0,1
    inc hl
    ld (hl),a ;1,
    inc hl
    ld (hl),a ;2,
    inc hl
    ld (hl),a ;3,
    inc hl
    ld (hl),a ;4,
    inc hl
    ld (hl),a ;5,
    ld de,27
    add hl,de
    ld (hl),a ;0,2
    inc hl
    ld (hl),a ;1,
    inc hl
    ld (hl),a ;2,
    inc hl
    ld (hl),a ;3,
    inc hl
    ld (hl),a ;4,
    inc hl
    ld (hl),a ;5,
    ld de,27
    add hl,de
    ld (hl),a ;0,3
    inc hl
    ld (hl),a ;1,
    inc hl
    ld (hl),a ;2,
    inc hl
    ld (hl),a ;3,
    inc hl
    ld (hl),a ;4,
    inc hl
    ld (hl),a ;5,    
    ret

