;draws a sprite specified size
;ie. drawspritex_y:





;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawplayer16_24:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart
    ld de,0

    ;start drawing bytes...
    REPT 24, ii, 23, -1
        ;0,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret




















;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite8_8:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 8, ii, 7, -1
        ;0,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc    
            ld de,BUFFER_WINDOW_WIDTH
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM
    
    ret


;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite8_8_shiftleft1:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 8, ii, 7, -1
        ;0,i
        ld a,(bc)
        sla a
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc    
            ld de,BUFFER_WINDOW_WIDTH
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM
    
    ret













































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite8_16:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 16, ii, 15, -1
        ;0,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc    
            ld de,BUFFER_WINDOW_WIDTH
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret



































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite16_8:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 8, ii, 7, -1
        ;0,i
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret





































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
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 16, ii, 15, -1
        ;0,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

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
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 24, ii, 23, -1

        ;0,0
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a 
        inc bc
        inc hl
        ;1,0
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

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
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 32, ii, 31, -1
        ;0,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret













































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawspritedesks:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 24, ii, 23, -1
        ;0,i
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;2,i
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;3,i
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-3
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret





















;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite32_16:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 16, ii, 15, -1
        ;0,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a
        inc bc
        inc hl
        ;2,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a
        inc bc
        inc hl
        ;3,i
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-3
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret

















































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite32_24:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 24, ii, 23, -1
        ;0,0
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,0
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;2,0
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;3,0
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-3
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret



































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite24_64:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart
    ;start drawing bytes...
    REPT 64, ii, 63, -1
        ;0,i
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;2,i
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-2
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret

























































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite16_128:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 128, ii, 127, -1
        ;0,i
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret























drawdoorframe:
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

    ;start drawing bytes...
    REPT 8, ii, 7, -1
        ;0,i
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,i
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;2,i
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;3,i
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-3
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM


    ;sideframes
    REPT 4
    ;i
        REPT 8
            ;0,0
            ld a,(bc)
            ld (hl),a 
            inc bc
            inc hl
            inc hl
            inc hl
            ;3,
            ld a,(bc)
            ld (hl),a
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-3
            add hl,de ;increment HL pointer by wwidth
        ENDM
    ENDM

    ret




































































;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite48_24:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 24, ii, 23, -1
        ;0,0    ;;;;;;0
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a 
        inc bc
        inc hl
        ;1,
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a
        inc bc
        inc hl
        ;2,
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a
        inc bc
        inc hl
        ;3,
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a
        inc bc
        inc hl
        ;4,
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a
        inc bc
        inc hl
        ;5,
        ld a,(bc)
        ld d,(hl)
        or d
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-5
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM
    
    ret




















;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite40_8:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 8, ii, 7, -1
        ;0,0    ;;;;;;0
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;2,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;3,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;4,
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-4
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret





;;Window Width of 24....
;INPUTS:
;wwidth=24
;BC=sprite pointer
;DE=xy
drawsprite48_32:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push bc
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop bc
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 32, ii, 31, -1
        ;0,0    ;;;;;;0
        ld a,(bc)
        ld (hl),a 
        inc bc
        inc hl
        ;1,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;2,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;3,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;4,
        ld a,(bc)
        ld (hl),a
        inc bc
        inc hl
        ;5,
        ld a,(bc)
        ld (hl),a

        IF ii > 0
            inc bc
            ld de,BUFFER_WINDOW_WIDTH-5
            add hl,de ;increment HL pointer by wwidth
        ENDIF
    ENDM

    ret















;DE=xy
draw_endpole_l_8_16:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart
    ;start drawing bytes...

    REPT 16, ii, 15, -1
        ;0,0
        ld a,END_POLE_L
        ld d,(hl)
        or d
        ld (hl),a 

        IF ii > 0
            inc hl
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de
        ENDIF
    ENDM

    ret













;DE=xy
draw_endpole_r_8_16:
    ld hl,0
    ld a,e
    ld l,a
    add hl,hl ;HL= y*2
    add hl,hl ;HL= y*4
    push de
    push hl
    pop de ;DE=y*4
    add hl,hl ;HL= y*8
    push hl
    pop bc ;BC=y*8
    add hl,hl
    add hl,bc ;HL=y*24
    add hl,de ;HL=y*28
    pop de
    ld e,d
    ld d,0
    add hl,de ;HL+=x
    ld de,GAME_WINDOW_START
    add hl,de ;HL+=memstart

    ;start drawing bytes...
    REPT 16, ii, 15, -1
        ;0,0
        ld a,END_POLE_R
        ld d,(hl)
        or d
        ld (hl),a 

        IF ii > 0
            inc hl
            ld de,BUFFER_WINDOW_WIDTH-1
            add hl,de
        ENDIF
    ENDM
    ret
