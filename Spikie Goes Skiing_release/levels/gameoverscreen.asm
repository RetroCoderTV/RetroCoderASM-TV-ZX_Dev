gameover_init:
    ; todo: find a way to clear screen
    call 0xDAF

    ld b,GAMEOVER_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes
    
    ld bc,15616
    ld d,GAMEOVER_STRING_Y
    ld e,GAMEOVER_STRING_X
    call GetCharAddr
    ld de,gameover_string
    call PrintStr

    ld d,GAMEOVER_STRING_Y+1
    ld e,GAMEOVER_STRING_X
    call GetCharAddr
    ld de,gameover_quit_string
    call PrintStr
    
    call sound_GSharp_0_25
 

    ret



gameover_main:
    call check_keys
    ld a,(keypressed_Q)
    cp TRUE
    jp z, begin_level_0
    jp gameover_main




;;;; DATA ;;;;;;;;;;

GAMEOVER_STRING_X equ 2
GAMEOVER_STRING_Y equ 5
gameover_string db 'GAME OVER!',0
gameover_quit_string db 'Q - QUIT TO MENU',0




