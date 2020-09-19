ENTRY_POINT equ 0x9800

    org ENTRY_POINT

    call 0xDAF

    ld a,0
    call 0x229B

program_start:

    jp main


main
    call main_update
    call main_draw
    jp main



main_update:
    halt
    call player_update
    call bullets_update
    call level_update
    ; call wormhole_update
    ret



main_draw:
    call cleargamewindow
    call enemies_draw
    call player_draw
    call bullets_draw
    call wormhole_draw
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
    include 'levels\level_manager.asm'
    include 'levels\level_1.asm'
    include 'objects\enemies.asm'
    include 'objects\wormhole.asm'
program_end:
    ld a,2
    call 0x229b
    call sound_A_0_25
    call sound_B_0_25
    call sound_GSharp_0_25
    call sound_B_0_25
    call sound_A_0_25



    end ENTRY_POINT