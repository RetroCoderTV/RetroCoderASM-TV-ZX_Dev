ENTRY_POINT equ 0x9500
    
    org ENTRY_POINT




game_init:
    call 0xDAF
    ld a,3
    call 0x229B
    jp main

main:
    halt

    call camera_move_r

    ld hl,GAME_WINDOW_START
    call cleargamewindow

    call world

    call sync

    call drawgamewindow

    jp main


camera_move_r:
    ld a,(camera_x)
    inc a
    ld (camera_x),a
    ret

; camera_move_u:
;     ld a,(camera_y)
;     sub 8
;     ld (camera_y),a
;     ret

; camera_move_d:
;     ld a,(camera_y)
;     add a,8
;     ld (camera_y),a
;     ret





world:
    ld ix,tile_brick_positions
    ld iy,tilessprites
    call world_draw_tile_section

    ld ix,tile_water_positions
    ld iy,tilessprites+TILE_LENGTH
    call world_draw_tile_section
    ret



; ;IX=tiles positions
; ;IY=sprite
; world_draw_tile_section:    
;     ld a,(camera_x)
;     add a,GAME_WINDOW_WIDTH
;     ld d,a
;     ld a,(ix)
;     cp d
;     ret nc

;     ld a,(camera_x)
;     ld d,a
;     ld a,(ix)
;     cp d  
;     call nc, world_draw_tile ;if tile X >= camx, call drawtile
; world_draw_next:
;     inc ix
;     inc ix
;     jp world_draw_tile_section    

; world_draw_tile: 
;     ld a,(camera_x)
;     ld e,a
;     ld a,(ix)
;     sub e
;     ld e,a ;=tile pos X - camerax

;     ld b,iyh
;     ld c,iyl
;     call drawsprite16_16
;     ret


;or a sbc hl,[reg16] add hl,[reg16]
;DE=tiles positions
;IY=sprite
world_draw_tile_section:    
    ld bc,(camera_x)
    ld ix,GAME_WINDOW_WIDTH
    add ix,bc
    ld a,(de)
    ld h,a
    or a
    sbc hl,bc
    add hl,bc
    ret nc

    ld a,(camera_x)
    ld d,a
    ld a,(ix)
    cp d  
    call nc, world_draw_tile ;if tile X >= camx, call drawtile
world_draw_next:
    inc ix
    inc ix
    jp world_draw_tile_section    

world_draw_tile: 
    ld a,(camera_x)
    ld e,a
    ld a,(ix)
    sub e
    ld e,a ;=tile pos X - camerax

    ld b,iyh
    ld c,iyl
    call drawsprite16_16
    ret



WORLD_WIDTH equ 75 ;bytes
WORLD_HEIGHT equ 32 ;lines

camera_x dw 0
camera_y dw 0

drawing_completed db 0




    include 'utils\doublebuffering.asm'
    include 'utils\constants.asm'
    include 'utils\spritedrawing.asm'
    include 'utils\colours.asm'
    include 'utils\randomnumbers.asm'
    include 'utils\vsync.asm'
    include 'levels\level1.asm'
    include 'tiles\tiles.asm'


    end ENTRY_POINT
