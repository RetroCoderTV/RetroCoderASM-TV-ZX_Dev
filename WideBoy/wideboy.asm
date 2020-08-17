ENTRY_POINT equ 0x8c1f

    org ENTRY_POINT



    ld a,2
    call 0x229B ;Border = A
    call 0xDAF ;cls

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
    call z,move_up

    ld a,(keypressed_S)
    cp 1
    call z,move_down

    call reset_keys


    ld ix,annoyingtestcard
    ld iy,annoyingtestcard+TILE_PROPERTIES_LENGTH
    ld b,TILE_COUNT
    call drawtiles

    ld bc,playersprite
    ld de,(playery) ;D=x E=y
    call drawsprite16

    call drawgamewindow
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
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    pop bc
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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
    ld de,GAME_WINDOW_WIDTH
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


;;;;; INCLUDES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    include 'player.asm'
    include 'inputkeys.asm'
    include 'testcards.asm'
    include 'doublebuffering.asm'
    include 'vsync.asm'


    end ENTRY_POINT