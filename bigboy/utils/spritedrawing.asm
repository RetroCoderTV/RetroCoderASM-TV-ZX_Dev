;draws a sprite specified size
;ie. drawspritex_y:




;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite16_16:
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






;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite16_24:
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
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,16
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,16
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,17
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,17
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,18
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,18
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,19
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,19
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,20
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,20
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,21
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,21
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,22
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,22
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,23
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,23
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ret










;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite16_32:
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
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,16
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,16
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,17
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,17
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,18
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,18
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,19
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,19
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,20
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,20
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,21
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,21
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,22
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,22
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,23
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,23
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,24
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,24
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,25
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,25
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,26
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,26
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,27
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,27
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,28
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,28
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,29
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,29
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,30
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,30
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ;0,31
    ld a,(bc)
    ld (hl),a 
    inc bc
    inc hl
    ;1,31
    ld a,(bc)
    ld (hl),a
    inc bc
    dec hl
    ld de,GAME_WINDOW_WIDTH
    add hl,de ;increment HL pointer 
    ret
