mainmenu_init:
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


    ld bc,15616
    ld d,TITLE_Y
    ld e,TITLE_X
    call GetCharAddr
    ld de,title_string
    call PrintStr

    ld bc,15616
    ld d,PRESSKEY_Y
    ld e,PRESSKEY_X
    call GetCharAddr
    ld de,presskey_string
    call PrintStr   

    ld bc,15616
    ld d,RETROSTRING_Y
    ld e,RETROSTRING_X
    call GetCharAddr
    ld de,retro_string
    call PrintStr   

    ret

mainmenu_update:

    ;; calling rand every frame in menu. I could not tell how 'seed' is made or used in SpecChum's rand routine. That is why
    ;; i just call this over and over in a hope to change the seed before the game starts
    call rand ; todo: This is my stupid way to randomise cars different each time
    


    call check_keys

    ld a,(keypressed_F)
    cp TRUE
    jp z, begin_level_1

    jp mainmenu_update



;;;; DATA ;;;;;;;;;;


RETROSTRING_X equ 0
RETROSTRING_Y equ 23
PRESSKEY_X equ 4
PRESSKEY_Y equ 4
TITLE_X equ 0
TITLE_Y equ 10
MENU_SPIKIE_X equ 10
MENU_SPIKIE_Y equ 140
MENU_SPIKIE_SKI_X equ 24
MENU_SPIKIE_SKI_Y equ 16
MENU_SIGN_X equ 4
MENU_SIGN_Y equ 100
MENU_SIGN_POLE_L equ %01100100
MENU_SIGN_POLE_R equ %11001000
MENU_CAR_X equ 13
MENU_CAR_Y equ 130
MENU_CAR_2_X equ 17
MENU_CAR_2_Y equ 82


title_string db 'SPIKIE GOES..',0
retro_string db 0x7F,' RetroCoder TV 2020',0
presskey_string db 'PRESS F TO START',0
