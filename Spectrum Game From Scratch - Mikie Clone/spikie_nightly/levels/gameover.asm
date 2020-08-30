gameover_init:
    ld a,22
    rst 16
    ld a,4
    rst 16
    ld a,12
    rst 16
    ld de,gameover_string
    ld bc,eo_gameover_string-gameover_string
    call 8252

    ld a,22
    rst 16
    ld a,6
    rst 16
    ld a,9
    rst 16
    ld de,gameover_presskey_string
    ld bc,gameover_eo_presskey_string-presskey_string
    call 8252

    ret

gameover_update:
    call check_keys

    ld a,(keypressed_W)
    cp TRUE
    jp z, begin_level01

    jp mainmenu_update



;;;; DATA ;;;;;;;;;;


gameover_string db 'GAME OVER!'
eo_gameover_string equ $


gameover_presskey_string db 'PRESS W TO BEGIN...'
gameover_eo_presskey_string equ $