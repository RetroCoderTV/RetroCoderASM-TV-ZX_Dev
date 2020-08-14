ENTRY_POINT equ 36864

    org ENTRY_POINT

init:
    call 0xDAF ;cls
    
    ld a,COLOUR_BLACK
    call setbordercolour

    ld l,0
    ld h,PLAY_WINDOW_START_UB
    call drawbackground
    
main:
    halt
    
    ld bc,playersprite
    ld a,(playerx)
    ld d,a
    ld a,(playery)
    ld e,a
    call drawsprite8


    call playwindow_draw
    call sync

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

scrollbackground:   
    ld a,h
    cp PLAY_WINDOW_END_UB
    jp z,scrollbackground_end
    ld a,(hl)
    rlc a
    ld (hl),a
    inc hl
    jp scrollbackground
scrollbackground_end:
    ret


;BC=sprite pointer
;DE=xy
drawsprite8:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;x2
    add hl,hl ;x4
    add hl,hl ;x8
    add hl,hl ;16 (wwidth is 16)
    ld e,d
    ld d,0
    add hl,de 
    ld de,PLAY_WINDOW_START
    add hl,de
    ld de,0

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



; ENTRY_POINT equ 0xa000

;     org ENTRY_POINT

; init:
;     call 0xDAF ;cls


    
;     ld a,COLOUR_BLACK
;     call setbordercolour

   
        
; main:
;     halt

;     ld h,PLAY_WINDOW_START_UB
;     call drawbackground

;     ; ld h,PLAY_WINDOW_START_UB
;     ; call scrollbackground

;     ld hl,0
;     ld bc,playersprite
;     call drawsprite8

;     call playwindow_draw
;     call sync
;     jp main

; ;INPUT:
; ;H=UB PLAYER WINDOW MEM START
; drawbackground:
;     ld l,0
;     ld a,h
;     cp PLAY_WINDOW_END_UB
;     jp z, drawbackground_end
;     ld a,(background)
;     ld (hl),a
;     inc hl
;     jp drawbackground
; drawbackground_end:
;     ret

; scrollbackground:   
;     ld l,0
;     ld a,h
;     cp PLAY_WINDOW_END_UB
;     call z,scrollbackground_end
;     ld a,(hl)
;     rlc a
;     ld (hl),a
;     inc hl
;     jp scrollbackground
; scrollbackground_end:
;     ret

; ;BC=sprite pointer
; drawsprite8:
;     ld hl,0
;     ld a,(playery)
;     ld l,a
;     add hl,hl ;x2
;     add hl,hl ;x4
;     add hl,hl ;x8
;     add hl,hl ;16 (wwidth is 16)
;     ld de,PLAY_WINDOW_START
;     add hl,de
;     ld de,0
;     ld a,(playerx)
;     ld e,a
;     add hl,de ;HL=(windowstart + (y*wwidth) + x)
;     ld hl,PLAY_WINDOW_START+2
;     ;start drawing bytes...
;     ;0
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer by wwidth
;     ;1
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer 
;     ;2
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer
;     ;3
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer 
;     ;4
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer 
;     ;5
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer
;     ;6
;     ld a,(bc)
;     ld (hl),a 
;     inc bc
;     ld de,WINDOW_WIDTH
;     add hl,de ;increment HL pointer 
;     ;7
;     ld a,(bc)
;     ld (hl),a 

;     ret






; background db %10101010




;     include 'constants.asm'
;     include 'playwindow.asm'
;     include 'player.asm'
;     include "tools.asm"
    

;     end ENTRY_POINT