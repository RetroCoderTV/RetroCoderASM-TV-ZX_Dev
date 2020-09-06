ENTRY_POINT equ 0x9800

    org ENTRY_POINT

    call setborderblue
    ld a,COLOUR_BLACK
    call 0x229B
    call 0xDAF


begin_level_0:
    call mainmenu_init
    jp mainmenu_update
    
begin_level_1:
    ld a,LEVEL_01
    ld (game_state),a
    call l1_start
    jp main

begin_level_2:
    ld a,LEVEL_02
    ld (game_state),a
    call l2_start
    jp main
    
    
main:   
    
    call cleargamewindow 
    
    call sync 

    ld a,(game_state)
    cp LEVEL_01
    call z, l1_update
    cp LEVEL_02
    call z, l2_update
    
    call increment_score1
    
    ld a,(skis_got)
    cp TRUE
    call z, drawskiicon

    
    call drawgamewindow
    
    jp main





game_state db LEVEL_01

    include 'retrohelpers\colours.asm'
    include 'retrohelpers\constants.asm'
    include 'retrohelpers\doublebuffering.asm'
    include 'retrohelpers\keycacher.asm'
    include 'retrohelpers\randomnumbers.asm'
    include 'retrohelpers\spritedrawing.asm'
    include 'retrohelpers\sgsconstants.asm'
    include 'retrohelpers\texttools.asm'
    include 'retrohelpers\vsync.asm'
    include 'levels\level0.asm'
    include 'levels\level1.asm'
    include 'levels\level2.asm'
    include 'sprites\flaggy.asm'
    include 'sprites\vehicles.asm'
    include 'spikie\player.asm'
    include 'spikie\player_l1.asm'
    include 'spikie\player_l2.asm'
    include 'ui\ui.asm'
    include 'retrohelpers\bazinga.asm'

    end ENTRY_POINT