ENTRY_POINT equ 0x9000

    org ENTRY_POINT

    
    call 0xDAF ;cls
    

    ;draw background into buffer
    ld h,SCREEN_BUFFER_START_UB
drawnextpixel:
    ld a,h
    cp SCREEN_BUFFER_END_UB
    jp z, init
    ld (hl), %11111111
    inc hl
    jp drawnextpixel
    
init:
    call changeborder
    jp main

    
main: 

    halt

    ld de,sprite
    call drawsprite 
    
    call movebuffertoscreen

    jp main

changeborder:    
    ld a,3
    call 8859
    ret

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
    add hl,bc ;HL = SCREEN_BUFFER_START + (y*32) + x

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
    


;; DATA ;;;;;;;;;;;;;;;;;;;;;

stack_ptr dw 0
spritex db 0
spritey db 0

sprite:
    db %10000001, %10000001
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


PLAYAREA_SEG1 equ 0x4800
PLAYAREA_SEG2 equ 0x5000
SEGSIZE equ 0x800
P1 equ 256
P2 equ 512
P3 equ 768
P4 equ 1024
P5 equ 1280
P6 equ 1536
P7 equ 1792
C1 equ 32
C2 equ 64
C3 equ 96
C4 equ 128
C5 equ 160
C6 equ 192
C7 equ 224

BUFFER_MOVE_CHAR_DOWN equ 256
SPECTRUM_MOVE_CHAR_DOWN equ 32

    include 'dbuff.asm'

    end ENTRY_POINT