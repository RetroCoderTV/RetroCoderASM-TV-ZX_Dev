;TODO:
;playerx 0 or 1 doesnt show player on screen
;add movement proper (inertia)


ENTRY_POINT equ 0x9000

    org ENTRY_POINT

init:
    call 0xDAF ;cls
    
    ld a,COLOUR_BLACK
    call setbordercolour


main:    
    halt
    
    ld hl,0
    ld h,PLAY_WINDOW_START_UB
    call drawbackground

    ld bc,playersprite
    call drawsprite

    call playwindow_draw


    call sync
    jp main

;H=UB Window start
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
    rlc a
    ld (background),a
    ret

;BC=sprite pointer
drawsprite:
    ld hl,0
    ld a,(playery)
    add hl,hl ;x2
    add hl,hl ;x4
    add hl,hl ;x8
    add hl,hl ;x16
    ld de,PLAY_WINDOW_START
    add hl,de
    ld de,0
    ld a,(playerx)
    ld e,a
    add hl,de ;HL=(BASEMEM_ADDRESS + (y*width) + x)
    ;start drawing bytes....
    ;0
    ld a,(bc)
    ld (hl),a
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de
    ;1
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;2
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de ;increment HL pointer
    ;3
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;4
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;5
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de ;increment HL pointer
    ;6
    ld a,(bc)
    ld (hl),a 
    inc bc
    ld de,PLAY_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;7
    ld a,(bc)
    ld (hl),a 
    ret

background db %00001100


    
    include "constants.asm"
    include 'playwindow.asm'
    include 'player.asm'
    include 'tools.asm'
  
    
    end ENTRY_POINT