ENTRY_POINT equ 36864

    org ENTRY_POINT

; init:
    call 0xDAF ;cls
    
    ld a,COLOUR_BLACK
    call setbordercolour

    
    
main:
    halt

    call check_keys
    

    ld a,(keypressed_A)
    cp 1
    call z,move_left

    ld a,(keypressed_D)
    cp 1
    call z,move_right

    ld a,(keypressed_W)
    cp 1
    call z,move_jump

    call jump_update

    call reset_keys

    ld ix,tiles
    ld iy,tiles+TILE_PROPERTIES_OFFSET
    ld b,TILE_COUNT
    call drawtiles

    
    ld bc,playersprite
    ld a,(playerx)
    ld d,a
    ld a,(playery)
    ld e,a
    call drawsprite8


    ld ix,tiles
    ld b,TILE_COUNT
    call paintbackground


    
    call playwindow_draw
    call sync

    jp main

drawtiles:
    push bc
    push iy
    pop bc
    ld d,(ix)
    ld e,(ix+1)
    call drawsprite16
    pop bc
    ld de,TILE_LENGTH
    add ix,de
    add iy,de
    djnz drawtiles
    ret

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

;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite8:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push bc
    push hl
    pop bc ;BC=4
    add hl,hl ;HL= y*8
    add hl,bc ;HL=y*12
    pop bc
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,PLAY_WINDOW_START
    add hl,de ;HL+=memstart
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


;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite16:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push bc
    push hl
    pop bc ;BC=4
    add hl,hl ;HL= y*8
    add hl,bc ;HL=y*12
    pop bc
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,PLAY_WINDOW_START
    add hl,de ;HL+=memstart
    ld de,0
    ;start drawing bytes...
    ;0,0
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,0
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer by wwidth
    ;0,1
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,1
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,2
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,2
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,3
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,3
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,4
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,4
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,5
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,5
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,6
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,6
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,7
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,7
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,8
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,8
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,9
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,9
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,10
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,10
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,11
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,11
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,12
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,12
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,13
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,13
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,14
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,14
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,15
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,15
    ld a,(bc)
    ld (hl),a
    ret


;REM: TILEMEM = (MEMSTART + (ypos * windowwidth) + xpos)
;IX=tiles data
;B=TILES COUNT
paintbackground:
    ld hl,0
    ld a,(ix+1) ;A=tile y
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    ld e,(ix+0) ;A=file x
    ld d,0
    add hl,de ;HL+=x
    ld de,VIEWPORT_ATTRIBUTE_MEM_START
    add hl,de ;HL+=memstart ;HL=correct mem address for first tile
    ;paint...
    ld a,(ix+2)
    ld (hl),a
    inc hl
    ld a,(ix+3)
    ld (hl),a
    ld de,SCREEN_WIDTH-1
    add hl,de
    ld a,(ix+4)
    ld (hl),a
    inc hl
    ld a,(ix+5)
    ld (hl),a
    ld de,TILE_LENGTH
    add ix,de
    djnz paintbackground
    ret



painttile1:
    ld de,COLOUR_MEMORY_START
    ld a,%00011110
    ld (de),a
    ret


background db %11001100



    include 'inputkeys.asm'
    include 'constants.asm'
    include 'playwindow.asm'
    include 'player.asm'
    include "tools.asm"
    include 'tilescoloured.asm'
    ; include 'tilemapsbeach.asm'
    

    end ENTRY_POINT
