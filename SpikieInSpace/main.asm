ENTRY_POINT equ 0x9800    
    
    org ENTRY_POINT


    DEVICE ZXSPECTRUM48
    

;screen transitions are broken....


program_start:
    call 0xDAF
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    call mainmenu_start
    jp mainmenu_update

begin_game:
    call 0xDAF
    ld a,1
    ld (current_level),a
    call ui_init
    call starfield_paint
    call player_game_start

    ;start of game jingle...
    call sound_B_0_25
    call sound_A_0_25    
    jp main


begin_shop:
    call 0xDAF
    ld a,6
    call 0x229B
    call ui_init
    call starfield_paint
    call shopmenu_start
    jp shopmenu_update
    
begin_level_2:
    ld a,2
    ld (current_level),a
    call 0xDAF
    ld a,1
    call 0x229B
    call starfield_paint
    call init_ui_labels
    call refresh_ui_numbers
    call level_nextlevel
    jp main


main:
    call main_update
    call main_draw
    jp main



main_update:
    ld a,GAME_BORDER_COLOUR
    call 0x229b
    call player_update
    call bullets_update
        
    ld a,(player_isalive)
    cp FALSE
    ret z
    
    
    call level_update
    call starfield_update
    call enemies_update
    call boss_1_update
    call squid_update
    ret



main_draw:
    ld a,(player_isalive)
    cp FALSE
    ret z
    
    call cleargamewindow
    call starfield_draw
    call player_draw
    call bullets_draw
    call enemies_draw
    call boss_1_draw
    call squid_draw
    ; call wormhole_draw
    call drawgamewindow

    ret



    
    include 'retrohelpers\bazinga.asm'
    include 'retrohelpers\colours.asm'
    include 'retrohelpers\constants.asm'
    include 'retrohelpers\doublebuffering.asm'
    include 'retrohelpers\keycacher.asm'
    include 'retrohelpers\sounds.asm'
    include 'retrohelpers\spritedrawing.asm'
    include 'player\player.asm'
    include 'objects\bullet.asm'
    include 'objects\boss_1.asm'
    include 'levels\mainmenu.asm'
    include 'levels\shop.asm'
    include 'levels\level_manager.asm'
    include 'levels\level_1.asm'
    include 'levels\level_2.asm'
    include 'objects\enemies.asm'
    include 'objects\squid.asm'
    ; include 'objects\wormhole.asm'
    include 'starfield.asm'
    include 'ui\ui.asm'
    

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