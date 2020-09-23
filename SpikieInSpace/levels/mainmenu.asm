MAINMENU_ATTRIBUTES equ %00010101

title_string db 'SPIKIE IN SPACE',0
TITLE_X equ 8
TITLE_Y equ 1

tagline_string db "Bald Bob Strikes Back",0
TAGLINE_X equ 5
TAGLINE_Y equ TITLE_Y+1





mainmenu_start:
    ld hl,0x5800
    ld b,MAINMENU_ATTRIBUTES
    call paint_base_attributes

    ld bc,15616
    ld d,TITLE_Y
    ld e,TITLE_X
    call GetCharAddr
    ld de,title_string
    call PrintStr

    ld d,TAGLINE_Y
    ld e,TAGLINE_X
    call GetCharAddr
    ld de,tagline_string
    call PrintStr
    ret


mainmenu_update:
    call rand
    call check_keys

    ld a,(keypressed_Space)
    cp TRUE
    jp z, begin_game

    jp mainmenu_update