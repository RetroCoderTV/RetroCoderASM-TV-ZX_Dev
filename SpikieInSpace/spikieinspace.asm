ENTRY_POINT equ 0x9800

    org ENTRY_POINT

    call 0xDAF

    ld a,2
    call 0x229B

program_start:

    jp main


main
    call main_update
    call main_draw
    jp main



main_update:
    call player_update
    call bullets_update
    call level_update
    ret



main_draw:
    call cleargamewindow
    call enemies_draw
    call player_draw
    call bullets_draw
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
    include 'bullet.asm'
    include 'level.asm'
    include 'enemies.asm'

    end ENTRY_POINT