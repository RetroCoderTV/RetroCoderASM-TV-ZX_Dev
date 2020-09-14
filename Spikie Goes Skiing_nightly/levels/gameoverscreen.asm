gameover_init:
    ; todo: find a way to clear screen

    ld de,gameover_string
    ld bc,eo_gameover_string-gameover_string
    call 8252

 

    ret



gameover_main:
    call check_keys
    ld a,(keypressed_W)
    cp TRUE
    jp z, begin_level_0
    jp gameover_main




;;;; DATA ;;;;;;;;;;


gameover_string db 0xD,0xD,0x20,0x20,0x20,'GAME OVER',0xD,0x20,0x20,0x20,'PRESS W'
eo_gameover_string equ $

