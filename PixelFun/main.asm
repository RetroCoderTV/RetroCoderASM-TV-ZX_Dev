ENTRY_POINT equ 0x9000

    org ENTRY_POINT

    
    call 0xDAF ;cls

;     ;demo to show raw pixel memory layout
;     ; ld h,PLAY_AREA_PIXEL_MEMORY_START_UB
;     ld h,SCREEN_BUFFER_START_UB
; drawnextpixel:
;     ld a,h
;     ; cp ATTRIBUTE_MEM_START_UB
;     cp SCREEN_BUFFER_END_UB
;     jp z, changeborder
;     ld (hl), %11110000
;     inc hl
;     jp drawnextpixel

    

changeborder:    
    ld a,3
    call 8859

    
main: 
    halt
    halt
    halt
    halt
    halt
    halt
    
    ; ld a,(spritex)
    ; inc a
    ; ld (spritex),a

    ld de,sprite
    call drawsprite 
    
    call movebuffertoscreen

    jp main


;INPUTS:
;DE=sprite pointer
;draws a 16x8 sprite
;REM: pix=(memstart+((y*32)+x) ---(ie. standard way to convert 2d array to 1d)
drawsprite:
    ld a,(spritey)
    ld hl,0
    ld l,a ;L=y 
    add hl,hl ;x2
    add hl,hl ;x4
    add hl,hl ;x8
    add hl,hl ;x16
    add hl,hl ;x32
    ld a,(spritex)
    ld b,0
    ld c,a
    add hl,bc ;HL+=x
    ld bc,SCREEN_BUFFER_START
    add hl,bc ;HL +=SCREEN_BUFFER_START

    ld a,(de) ;A=sprite 0,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 1,0
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)
    
    ld a,(de) ;A=sprite 0,1
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 1,1
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)

    ld a,(de) ;A=sprite 1,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 2,1
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)
    
    ld a,(de) ;A=sprite 2,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 3,1
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)

    ld a,(de) ;A=sprite 4,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 4,1
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)
    
    ld a,(de) ;A=sprite 5,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 5,1
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)
    
    ld a,(de) ;A=sprite 6,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 6,1
    ld (hl),a ;poke it to buffer
    inc de ;next sprite byte
    ld bc,31
    add hl,bc ;move HL down a whole line (minus 1 because we already moved right once)
    
    ld a,(de) ;A=sprite 7,0
    ld (hl),a ;poke sprite into buffer
    inc de ;next byte of sprite
    inc hl ;next address in buffer
    ld a,(de) ;A=sprite 7,1
    ld (hl),a ;poke it to buffer

    ret
    


;monolithic routine used to move screen pixels from a buffer to the physical screen memory
;specific to having a play area having width of the whole screen and height 2/3 of screen.
movebuffertoscreen: 
    ld (stackpointer),sp ; store stack pointer.
    ;starts from Character line 8 (lines 0-7 are for UI bar). SEG1=lines 8-15 ; SEG2=lines 16-23
    ;Character Line 8:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14 ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 9:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+256+BUFFER_MOVE_CHAR_DOWN ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 10:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+256+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 11:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+256+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 12:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+256+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 13:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+256+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 13:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+256+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ld sp,(stackpointer) ; restore stack pointer.
    ret


;; DATA ;;;;;;;;;;;;;;;;;;;;;

spritex db 0
spritey db 0
sprite:
    db %11111111, %11111111
    db %10000001, %10000001
    db %10000001, %10000001
    db %11111111, %11111111
    db %11111111, %11111111
    db %10000001, %10000001
    db %10000001, %10000001
    db %11111111, %11111111

SCREEN_BUFFER_START equ 0x8000
SCREEN_BUFFER_END equ 0x9000
SCREEN_BUFFER_START_UB equ 0x80 ;all 'drawing' logic will be applied to this 'virtual screen'
SCREEN_BUFFER_END_UB equ 0x90 ;it actually ends one before this, we will get out of loops if reach this figure
PIXEL_MEM_START_UB equ 0x40
PLAY_AREA_PIXEL_MEMORY_START_UB equ 0x48 ;if we start from here we are using approx 2/3 of height of screen. It uses 0xfff (4095) bytes

ATTRIBUTE_MEM_START_UB equ 0x58 


stackpointer dw 0
PLAYAREA_SEG1 equ 0x4800
PLAYAREA_SEG2 equ 0x5600
P0 equ 0
P1 equ 256
P2 equ 512
P3 equ 768
P4 equ 1024
P5 equ 1280
P6 equ 1536
P7 equ 1792
C0 equ 0
C1 equ 32
C2 equ 64
C3 equ 96
C4 equ 128
C5 equ 160
C6 equ 192
C7 equ 224

BUFFER_MOVE_CHAR_DOWN equ 256
SPECTRUM_MOVE_CHAR_DOWN equ 32

    end ENTRY_POINT