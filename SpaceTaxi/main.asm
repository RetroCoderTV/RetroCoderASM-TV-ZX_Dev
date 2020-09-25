ENTRY_POINT equ 0x9800    
    
    org ENTRY_POINT


    DEVICE ZXSPECTRUM48
    

program_start:
    call 0xDAF
    ld a,GAME_BORDER_COLOUR
    call 0x229B
begin_game:
    
    jp main



main:
    call main_update
    call main_draw
    jp main



main_update:
    call player_update
    ret



main_draw:
    call cleargamewindow
    call player_draw
    call drawgamewindow

    ret



    
    include 'retrohelpers\bazinga.asm'
    include 'retrohelpers\colours.asm'
    include 'retrohelpers\constants.asm'
    include 'retrohelpers\doublebuffering.asm'
    include 'retrohelpers\keycacher.asm'
    include 'retrohelpers\sounds.asm'
    include 'retrohelpers\spritedrawing.asm'
    include 'ui\ui.asm'
    include 'player\player.asm'
    

STACK_SIZE: equ 10    ; in words
stack_bottom:
    defs    STACK_SIZE*2, 0
stack_top:  defb 0  ; WPMEM


program_end:
    call sound_A_0_25
    call sound_B_0_25
    call sound_GSharp_0_25
    call sound_B_0_25
    call sound_A_0_25
    







    SAVESNA "main.sna", program_start