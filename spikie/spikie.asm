ENTRY_POINT equ 0x9900

    org ENTRY_POINT

    ld a,0
    call 0x229B ;Border = A
    call 0xDAF ;cls

    
    ld ix,bg
    ld b,TILE_COUNT
    call paintbgtiles
   
    halt 
    halt

main:
    call sync 

    call init_collisions_check
    call check_keys

    ld a,(keypressed_W)
    cp 1
    call z,try_move_up

    ld a,(keypressed_S)
    cp 1
    call z,try_move_down

    ld a,(keypressed_A)
    cp 1
    call z,try_move_left

    ld a,(keypressed_D)
    cp 1
    call z,try_move_right

    call reset_keys

    ld ix,desksdata
    ld de,DESK_DATA_LENGTH
    call check_collisions

    call movetotargetpos
    
    call paintplayer_16_24

    ld bc,(doory)
    ld iyl,DOOR_COLOUR
    call paintsprite_16_32


    ld ix,bg
    ld iy,bg+TILE_PROPERTIES_LENGTH
    ld b,TILE_COUNT
    call drawtiles16_16

    
    ld ix,desksdata
    call drawdesks


    ld bc,doorsprite
    ld de,(doory)
    call drawsprite16_32

    



    ld bc,playersprite
    ld de,(playery)
    call drawsprite16_24





    halt
    call drawgamewindow

 


    jp main

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

;;;;; INCLUDES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    include 'gamevalues.asm'

    include 'bg\bg1.asm'
    include 'sprites\player.asm'
    include 'sprites\door.asm'
    include 'sprites\desk.asm'
    include 'utils\colours.asm'
    include 'utils\doublebuffering.asm'
    include 'utils\keycacher.asm'
    include 'utils\randomnumbers.asm'
    include 'utils\spritedrawing.asm'
    include 'utils\vsync.asm'

    end ENTRY_POINT