ENTRY_POINT equ 0x9900

    org ENTRY_POINT 

game_init:
    call setborderblue
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


begin_level02:
    ld a,LEVEL_02_DINER
    ld (currentgamestate),a
    call 0xDAF ;cls
    call level_02_init
    jp main

main:
    
    

    ld a,(currentgamestate)
    cp MAIN_MENU
    jp z,mainmenu_update
    cp LEVEL_01_CLASS
    jp z,level_01_update
    cp LEVEL_02_DINER
    jp z,level_02_update
    
    jp main



    
    


;B=tile count
;IX=tiles
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
    call drawspritedesks
    ld de,DESK_DATA_LENGTH
    add ix,de
    jp drawdesks



;IX=desks
drawlockers:
    ld a,(ix)
    cp 255
    ret z
    ld bc,lockersprite
    ld d,(ix+1)
    ld e,(ix+2)
    call drawsprite16_24
    ld de,L2_LOCKER_DATA_LENGTH
    add ix,de
    jp drawlockers




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


;IX=hearts
drawhearts:
    ld a,(ix)
    cp 255
    ret z
    ld a,(ix)
    cp 0
    jp z,drawhearts_gonext
    ld bc,heartsprite
    ld d,(ix+1)
    ld e,(ix+2)
    call drawsprite16_8
drawhearts_gonext:
    ld de,HEART_DATA_LENGTH
    add ix,de
    jp drawhearts

;;;;; INCLUDES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


currentgamestate db MAIN_MENU

    include 'gamevalues.asm'

    include 'bg\bg1.asm'
    include 'levels\mainmenu.asm'
    include 'levels\level01.asm'
    include 'levels\level02.asm'
    include 'sprites\player.asm'
    include 'sprites\door.asm'
    include 'sprites\desk.asm'
    include 'sprites\exitsign.asm'
    include 'sprites\heart.asm'
    include 'sprites\locker.asm'
    include 'ui\ui.asm'    
    include 'utils\colours.asm'
    include 'utils\doublebuffering.asm'
    include 'utils\keycacher.asm'
    include 'utils\randomnumbers.asm'
    include 'utils\spritedrawing.asm'
    include 'utils\texttools.asm'
    include 'utils\vsync.asm'

    end ENTRY_POINT