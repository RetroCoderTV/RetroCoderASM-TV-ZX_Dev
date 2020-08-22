ENTRY_POINT equ 0x9900

    org ENTRY_POINT 

game_init:
    ld a,0
    call 0x229B ;Border = A
    call 0xDAF ;cls

    call mainmenu_init
    halt 
    jp main


begin_level01:
    ld a,LEVEL_01_CLASS
    ld (currentgamestate),a
    call 0xDAF ;cls
    call level_01_init
    jp main

main:
    call check_keys

    ld a,(currentgamestate)
    cp MAIN_MENU
    jp z,mainmenu_update
    cp LEVEL_01_CLASS
    jp z,level_01_update
    
    jp main



setborderpink:
    ld a,3
    call 0x229B
    ret

drawtiles16_16:
    push bc
    push iy
    pop bc
    ld d,(ix)
    ld e,(ix+1)
    call drawsprite16_16
    pop bc
    ld de,TILE_LENGTH
    add ix,de
    add iy,de
    djnz drawtiles16_16
    ret

;IX=desks
drawdesks:
    ld a,(ix)
    cp 255
    ret z
    ld bc,desksprite
    ld d,(ix+1)
    ld e,(ix+2)
    call drawsprite32_16
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp drawdesks

;IX=object array pointer
;;;;;TODO: DE=object data length;;
paintdesks:
    ld a,(ix)
    cp 255
    ret z
    ld b,(ix+1)
    ld c,(ix+2)
    call paintsprite_32_16
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp paintdesks

;;;;; INCLUDES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


currentgamestate db MAIN_MENU

    include 'gamevalues.asm'

    include 'bg\bg1.asm'
    include 'levels\mainmenu.asm'
    include 'levels\level01.asm'
    include 'sprites\player.asm'
    include 'sprites\door.asm'
    include 'sprites\desk.asm'
    include 'utils\colours.asm'
    include 'utils\doublebuffering.asm'
    include 'utils\keycacher.asm'
    include 'utils\randomnumbers.asm'
    include 'utils\spritedrawing.asm'
    include 'utils\texttools.asm'
    include 'utils\vsync.asm'

    end ENTRY_POINT