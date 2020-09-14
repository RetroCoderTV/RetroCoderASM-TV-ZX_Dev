mainmenu_init:
    ld a,ASCII_INK
    rst 16
    ld a,6 ;ink
    rst 16
    ld a,ASCII_PAPER
    rst 16
    ld a,1 ;paper
    rst 16

    ld a,ASCII_AT
    rst 16
    ld a,4
    rst 16
    ld a,2
    rst 16
    ld de,title_string
    ld bc,eo_title_string-title_string
    call 8252

    ld a,ASCII_AT
    rst 16
    ld a,6
    rst 16
    ld a,4
    rst 16
    ld de,presskey_string
    ld bc,eo_presskey_string-presskey_string
    call 8252


    ; ld a,ASCII_INK
    ; rst 16
    ; ld a,5 ;ink
    ; rst 16
    ; ld a,ASCII_PAPER
    ; rst 16
    ; ld a,1 ;paper
    ; rst 16


    ld a,ASCII_AT
    rst 16
    ld a,20
    rst 16
    ld a,2
    rst 16
    ld de,retro_string
    ld bc,eo_retro_string-retro_string
    call 8252

    ret

mainmenu_update:
    call check_keys

    ld a,(keypressed_W)
    cp TRUE
    jp z, begin_level_1

    jp mainmenu_update



;;;; DATA ;;;;;;;;;;


title_string db 'SPIKIE GOES SKIING!'
eo_title_string equ $

retro_string db 0x7f,' RetroCoder TV 2020'
eo_retro_string equ $
presskey_string db 'PRESS W TO BEGIN..'
eo_presskey_string equ $