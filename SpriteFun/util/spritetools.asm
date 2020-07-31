;spritetools.asm
;deletes and draws a moveable sprite
;data format:
;isAlive,x,y,sizex (cells),sizey (lines)

;deletes a sprite
;inputs:
;IX=properties (must include yx and bitmap size data)
deletesprite:
    ld b,(ix+2) ;B=ypos
    ld c,(ix+1) ;C=xpos
    call yx2pix ;DE=screen mem address for yx
    ld b,(ix+4) ;load b with number of lines in sprite (sizey)
    dec b
spritedellinesloop:
    push bc ;save lines remaining to stack
    ld b,(ix+3) ;a=width (in bytes)
spritedelbytesloop: ;loop if more that 1 byte width for rest of the width
    xor a
    ld (de),a
    inc e
    djnz spritedelbytesloop
    ld b, (ix+3) ; load b with number of bytes width again
spritedelshiftbackloop:
    dec e
    djnz spritedelshiftbackloop
    call nextlinedown
    pop bc ;retrieve lines remaining
    djnz spritedellinesloop ;loop back if not 0
    ret    

;draws a sprite of any size
;inputs:
;HL=sprite bitmap
;IX=properties (must include yx and bitmap size data)
drawsprite:
    ld b,(ix+2) ;B=ypos
    ld c,(ix+1) ;C=xpos
    call yx2pix ;DE=screen mem address for yx
    ld b,(ix+4) ;load b with number of lines in sprite (sizey)
    dec b
spritedrawlinesloop:
    push bc ;save lines remaining to stack
    ld b,(ix+3) ;a=width (in bytes)
spritedrawbytesloop: ;loop if more that 1 byte width for rest of the width
    ld a,d ;load A with D for checking if it passes upper memory
    cp 0x58 ;if 0x58 it has gone passed bitmap memory
    jr z, skipdrawjump ;is H==0x58, skip drawing.
    ld a,(hl) ;take byte from HL pointer
    ld (de),a ;draw it to screen memory
    inc hl
    inc e
skipdrawjump: 
    djnz spritedrawbytesloop
    ld b, (ix+3) ; load b with number of bytes width again
spritedrawshiftbackloop:
    dec e
    djnz spritedrawshiftbackloop
    call nextlinedown
    pop bc ;retrieve lines remaining
    djnz spritedrawlinesloop ;loop back if not 0
    ret

