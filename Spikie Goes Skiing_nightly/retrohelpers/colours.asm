
;Colours
;FBPPPIII
COLOUR_BLACK equ 0  ;%000
COLOUR_BLUE equ 1   ;%001
COLOUR_RED equ 2    ;%010
COLOUR_PINK equ 3   ;%011
COLOUR_GREEN equ 4  ;%100
COLOUR_CYAN equ 5   ;%101
COLOUR_YELLOW equ 6 ;%110
COLOUR_WHITE equ 7  ;%111

;ink only, use masking for paper bits
BLACK_INK   equ %00000010
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
    ld a,COLOUR_BLUE
    call 0x229B
    ret

setborderpink:
    ld a,COLOUR_PINK
    call 0x229B
    ret

setbordergreen:
    ld a,COLOUR_GREEN
    call 0x229B
    ret

setborderred:
    ld a,COLOUR_RED
    call 0x229B
    ret

setborderdefault:
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ret

paint_background:
    ld hl,ATTRIBUTE_MEMORY_START
    xor a
    ld c,a
    ld iyl,L1_PAVEMENT_COLOUR
    call pnt_bg
    ret

;HL=0x5800
pnt_bg:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    ld a,c
    cp ROAD_START_LINE
    call nc,pnt_bg_setroadcolour
    cp ROAD_END_LINE
    call nc,pnt_bg_setpavementcolour
    ld b,GAME_WINDOW_WIDTH
    call pnt_line
    ld de,SCREEN_WIDTH-GAME_WINDOW_WIDTH
    add hl,de
    inc c
    jp pnt_bg
    ret
;iyl=colour
;b=window width
pnt_line:
    ld a,iyl
    ld (hl),a
    inc hl
    inc de
    djnz pnt_line
    ret



pnt_bg_setpavementcolour:
    ld iyl,L1_PAVEMENT_COLOUR
    ret
pnt_bg_setroadcolour:
    ld iyl,L1_ROAD_COLOUR
    ret













;DE=xy
;B=colour
paint_sprite_1_1:
    ld a,d
    cp BUFFER_SIDE_EXTRA
    ret c
    ld a,d
    cp BUFFER_WINDOW_WIDTH-4
    ret nc
    ld a,e
    cp 192-23 ; GAME_WINDOW_HEIGHT-3-1
    ret nc
    ld hl,0
    ld l,e
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,d
    sub BUFFER_SIDE_EXTRA
    ld d,0
    ld e,a
    add hl,de ;+=x
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;sprite origin cell

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    


    ret











;HL=exact cell in attri mem
;B=ink
do_paint:
    ld a,d
    cp BUFFER_SIDE_EXTRA
    ret c

    ld a,d
    cp BUFFER_WINDOW_WIDTH-4
    ret nc

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a

    ret


















;origin addr=attrmem+(y*4)+x
;DE=xy
;B=ink only colour
paint_sprite_2_2:
    
    
    
    
    push de

    ld hl,0
    ld l,e
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,d
    sub BUFFER_SIDE_EXTRA
    ld d,0
    ld e,a
    add hl,de ;+=x
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;sprite origin cell

    pop de

    ld a,e
    cp 192-7 
    ret nc
    
    call do_paint

    inc hl

    call do_paint

    ld a,e
    cp 192-15 
    ret nc

    push de

    ld de,31
    add hl,de

    pop de

    call do_paint

    inc hl

    call do_paint


    ret



























;origin addr=attrmem+(y*4)+x
;DE=xy
;B=ink only colour
paint_sprite_4_2:
    
    ld hl,0
    ld l,e
    
    push de

    add hl,hl ;x2
    add hl,hl ;x4
    ld a,d
    sub BUFFER_SIDE_EXTRA
    ld d,0
    ld e,a
    add hl,de ;+=x
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;sprite origin cell

    pop de

    ld a,e
    cp 192-7 
    ret nc


    call do_paint

    inc hl

    call do_paint

    inc hl
    
    call do_paint

    inc hl

    call do_paint

    push de

    ld a,e
    cp 192-15 
    ret nc

    ld de,29
    add hl,de

    pop de

    call do_paint

    inc hl

    call do_paint

    inc hl

    call do_paint

    inc hl

    call do_paint

    ret



















;origin addr=attrmem+(y*4)+x
;DE=xy
;B=ink only colour
paint_sprite_2_3:
    ld a,d
    cp BUFFER_SIDE_EXTRA
    ret c
    ld a,d
    cp BUFFER_WINDOW_WIDTH-4
    ret nc
    ld a,e
    cp 192-23 ; GAME_WINDOW_HEIGHT-3-1
    ret nc
    ld hl,0
    ld l,e
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,d
    sub BUFFER_SIDE_EXTRA
    ld d,0
    ld e,a
    add hl,de ;+=x
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;sprite origin cell

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    ld de,31
    add hl,de

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    ld de,31
    add hl,de

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a


    ret



























;origin addr=attrmem+(y*4)+x
;DE=xy
;B=ink only colour
paint_sprite_6_3:
    ld a,d
    cp BUFFER_SIDE_EXTRA
    ret c
    ld a,d
    cp BUFFER_WINDOW_WIDTH-4
    ret nc
    ld a,e
    cp 192-23 ; GAME_WINDOW_HEIGHT-3-1
    ret nc
    ld hl,0
    ld l,e
    
    add hl,hl ;x2
    add hl,hl ;x4
    ld a,d
    sub BUFFER_SIDE_EXTRA
    ld d,0
    ld e,a
    add hl,de ;+=x
    ld de,ATTRIBUTE_MEMORY_START
    add hl,de ;sprite origin cell

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    ld de,27
    add hl,de

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    ld de,27
    add hl,de

    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a
    inc hl
    ld a,(hl)
    and %01111000
    or b
    ld (hl),a

    ret







