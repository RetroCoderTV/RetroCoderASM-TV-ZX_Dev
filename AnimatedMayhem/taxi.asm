

ENTRY_POINT equ 32768

    org ENTRY_POINT

    call 0xDAF

taxi_main:
    halt
    ld ix,taxidata
    call deletesprite

    ld ix,taxidata
    call keypress_checker

    ld a,(gravity_timer)
    inc a
    ld (gravity_timer),a
    call nc, applygravity
    

    ld ix,taxidata
    ld hl,taxisprite
    call drawsprite

    jp taxi_main

keypressed_A:
    ret 
keypressed_D:
    ret 
keypressed_W:
    ld a,(thrust_timer)
    inc a
    ld a,(thrust_delay_y)
    ld b,a
    ld a,(thrust_timer)
    ld (thrust_timer),a
    cp b
    call nc, applythrust_up
    ret 
keypressed_S:
    ret 

applythrust_up:
    xor a
    ld (thrust_timer),a
    ld a,(thrust_delay_y)
    sub THRUST
    ld (thrust_delay_y),a
    ld ix,playerdata
    inc (ix+2)
    ret

applygravity:
    xor a
    ld (gravity_timer),a
    ld a,(thrust_delay_y)
    add a,GRAVITY
    ld (thrust_delay_y),a
    ld ix,playerdata
    dec (ix+2)
    ret


;; DATA ;;;;;;

taxidata:
    db 1,50,50,2,16

THRUST equ 2

thrust_delay_y db 255
thrust_timer db 0

gravity_delay db 50
gravity_timer db 0

GRAVITY equ 1


    include 'util\tools.asm'
    include 'util\screentools.asm'
    include 'util\spritetools.asm'
    include 'util\soundtools.asm'
    include 'util\keyboardtools.asm'
    include 'bitmaps\taxibitmaps.asm'

    end ENTRY_POINT