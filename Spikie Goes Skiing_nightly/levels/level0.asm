mainmenu_init:
    ld d,MENU_SHOP_X
    ld e,MENU_SHOP_Y
    ld bc,shop_sprite
    call drawsprite48_24

    ld d,MENU_SPIKIE_X
    ld e,MENU_SPIKIE_Y
    ld bc,playersprite_right
    call drawsprite16_24

    ld d,MENU_SPIKIE_SKI_X
    ld e,MENU_SPIKIE_SKI_Y
    ld bc,playersprite_dl_ski
    call drawsprite16_24

    ld d,MENU_SIGN_X
    ld e,MENU_SIGN_Y
    ld bc,menusprite_skisign
    call drawsprite48_24

    ld d,MENU_SIGN_X+1
    ld e,MENU_SIGN_Y+24
    ld c,MENU_SIGN_POLE_L
    call drawpole8_16

    ld d,MENU_SIGN_X+4
    ld e,MENU_SIGN_Y+24
    ld c,MENU_SIGN_POLE_R
    call drawpole8_16

    ld d,MENU_CAR_X
    ld e,MENU_CAR_Y
    ld bc,menusprite_car
    call drawsprite72_48

    ld d,MENU_CAR_2_X
    ld e,MENU_CAR_2_Y
    ld bc,menusprite_car
    call drawsprite72_48


    call drawgamewindow


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
    ld a,TITLE_Y
    rst 16
    ld a,TITLE_X
    rst 16
    ld de,title_string
    ld bc,eo_title_string-title_string
    call 8252

    ld a,ASCII_AT
    rst 16
    ld a,PRESSKEY_Y
    rst 16
    ld a,PRESSKEY_X
    rst 16
    ld de,presskey_string
    ld bc,eo_presskey_string-presskey_string
    call 8252

    


   


    ld a,ASCII_AT
    rst 16
    ld a,RETROSTRING_Y
    rst 16
    ld a,RETROSTRING_X
    rst 16
    ld de,retro_string
    ld bc,eo_retro_string-retro_string
    call 8252

    call sound_jingle_dontyouforgetaboutme
    ret

mainmenu_update:
    call check_keys

    ld a,(keypressed_F)
    cp TRUE
    jp z, begin_level_1

    jp mainmenu_update



;;;; DATA ;;;;;;;;;;

MENU_SHOP_X equ 2
MENU_SHOP_Y equ 170
RETROSTRING_X equ 0
RETROSTRING_Y equ 0
PRESSKEY_X equ 4
PRESSKEY_Y equ 4
TITLE_X equ 0
TITLE_Y equ 12
MENU_SPIKIE_X equ 10
MENU_SPIKIE_Y equ 158
MENU_SPIKIE_SKI_X equ 24
MENU_SPIKIE_SKI_Y equ 30
MENU_SIGN_X equ 4
MENU_SIGN_Y equ 112
MENU_SIGN_POLE_L equ %01100100
MENU_SIGN_POLE_R equ %11001000
MENU_CAR_X equ 13
MENU_CAR_Y equ 150

MENU_CAR_2_X equ 17
MENU_CAR_2_Y equ 100



title_string db 'SPIKIE GOES..'
eo_title_string equ $

retro_string db 0x7f,' RetroCoder TV 2020'
eo_retro_string equ $
presskey_string db 'PRESS F TO START'
eo_presskey_string equ $