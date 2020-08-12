ENTRY_POINT equ 0x9000

    org ENTRY_POINT

init:
    call 0xDAF ;cls
    
    ld a,COLOUR_BLACK
    call setbordercolour
    
    
main:
    halt
    call sync
    
    ld hl,0
    ld h,PLAY_WINDOW_START_UB
    call drawbackground

    ld bc,playersprite
    call drawplayer

    call playwindow_draw
    jp main

;INPUT:
;H=UB PLAYER WINDOW MEM START
drawbackground:
    ld a,h
    cp PLAY_WINDOW_END_UB
    jp z, drawbackground_end
    ld a,(background)
    ld (hl),a
    inc hl
    jp drawbackground
drawbackground_end:
    ld a,(background)
    rlc a
    ld (background),a
    ret

;BC=sprite pointer
drawplayer:
    ld hl,0
    ld a,(playery)
    ld l,a
    add hl,hl ;x2
    add hl,hl ;x4
    add hl,hl ;x8
    add hl,hl ;16 (wwidth is 16)
    ld de,PLAY_WINDOW_START
    add hl,de
    ld de,0
    ld a,(playerx)
    ld e,a
    add hl,de ;HL=(windowstart + (y*wwidth) + x)
    ;start drawing bytes...
    ;0
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer by wwidth
    ;1
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;2
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer
    ;3
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;4
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;5
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer
    ;6
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;7
    ld a,(bc)
    ld (hl),a 

    ret






background db %11001100




    include 'constants.asm'
    include 'playwindow.asm'
    include 'player.asm'
    include "tools.asm"
    

    end ENTRY_POINT