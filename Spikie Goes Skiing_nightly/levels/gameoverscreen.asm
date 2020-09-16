gameover_init:
    ; todo: find a way to clear screen
    
    ld bc,15616
    ld d,GAMEOVER_STRING_Y
    ld e,GAMEOVER_STRING_X
    call GetCharAddr
    ld de,gameover_string
    call PrintStr
    
    call sound_GSharp_0_25
    call sound_G_0_5
    call sound_G_0_375
 

    ret



gameover_main:
    call check_keys
    ld a,(keypressed_W)
    cp TRUE
    jp z, begin_level_0
    jp gameover_main




;;;; DATA ;;;;;;;;;;

GAMEOVER_STRING_X equ 2
GAMEOVER_STRING_Y equ 5
gameover_string db 'GAME OVER. W TO QUIT'
gostring_end db 0




