
; better car spawns *
; gate collision (one shot, hit/miss) **
; loading screen --








ENTRY_POINT equ 0x9800

    org ENTRY_POINT
    
    call 0xDAF

    

begin_level_0:
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ld b,DEFAULT_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes
    call mainmenu_init
    jp mainmenu_update
    
begin_level_1:
    ld a,LEVEL_01
    ld (game_state),a
    call l1_start
    jp main

begin_level_1_withski:
    ld a,LEVEL_01
    ld (game_state),a
    call l1_start_withski
    jp main

begin_level_1_noski:
    ld a,LEVEL_01
    ld (game_state),a
    call l1_start_noski
    jp main

begin_level_2:
    ld a,LEVEL_02
    ld (game_state),a
    call l2_start
    jp main
    

begin_gameover:
  
    ld a,COLOUR_RED
    call 0x229B
    ld a,GAME_OVER
    ld (game_state),a
    call gameover_init
    jp gameover_main
    
main:   
    
    call cleargamewindow 
    
    ld a,(game_state)
    cp LEVEL_01
    call z, l1_update
    cp LEVEL_02
    call z, l2_update


    call drawgamewindow
 
    
    jp main


game_state db LEVEL_01

    include 'retrohelpers\bazinga.asm'
    include 'retrohelpers\colours.asm'
    include 'retrohelpers\constants.asm'
    include 'retrohelpers\doublebuffering.asm'
    include 'retrohelpers\keycacher.asm'
    include 'retrohelpers\randomnumbers.asm'
    include 'retrohelpers\spritedrawing.asm'
    include 'retrohelpers\sgsconstants.asm'
    include 'retrohelpers\sounds.asm'
    include 'retrohelpers\texttools.asm'
    include 'retrohelpers\vsync.asm'
    include 'levels\level0.asm'
    include 'levels\level1.asm'
    include 'levels\level2.asm'
    include 'levels\gameoverscreen.asm'
    include 'sprites\skiflags.asm'
    include 'sprites\skitrees.asm'
    include 'sprites\vehicles.asm'
    include 'sprites\menusprites.asm'
    include 'spikie\player.asm'
    include 'spikie\player_l1.asm'
    include 'spikie\player_l2.asm'
    include 'ui\ui.asm'


    end ENTRY_POINT