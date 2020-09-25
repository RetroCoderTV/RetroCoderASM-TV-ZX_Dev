STARFIELD_COLOURS_L1 equ %01000110
STARFIELD_COLOURS_L2 equ %01000110

NEW_STAR equ %00000001


;isalive,x,y,star-byte
stars:
    db TRUE,0,0,%10000000
    db TRUE,0,0,%01000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00001000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00000001
    db TRUE,0,0,%00000010
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%01000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00001000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00000001
    db TRUE,0,0,%00000010
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%01000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00001000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00000001
    db TRUE,0,0,%00000010
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%01000000
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00010000 
    db TRUE,0,0,%00001000
    db TRUE,0,0,%00010000
    db TRUE,0,0,%00000001
    db TRUE,0,0,%00000010
    db TRUE,0,0,%10000000
    db TRUE,0,0,%00000000
    db 255
STARS_DATA_LENGTH equ 4

starfield_paint:
    ld hl,0x5800
    ld a,(current_level)
    cp 1 
    jp z,sfpaint_l1
    cp 2
    jp z,sfpaint_l2
sfpaint_l1:
    ld b,STARFIELD_COLOURS_L1
    call paint_base_attributes
    ret
sfpaint_l2:
    ld b,STARFIELD_COLOURS_L2
    call paint_base_attributes
    ret



starfield_update:
    ld ix,stars
spwnstar_start:
    ld a,(ix)
    cp 255
    ret z
    cp FALSE
    jp nz, spwnstar_next
spwnstar_randx:
    call rand
    cp 24
    jp nc, spwnstar_randx
    add a,BUFFER_SIDE_EXTRA
    ld (ix+1),a
spwnstar_randy:
    call rand
    cp 192
    jp nc, spwnstar_randy
    ld (ix+2),a
    ld (ix+3),NEW_STAR
    ld (ix),TRUE
    ;;;;;;;; colour the star...
    call rand
    and 7 ;random ink-only colour
    ld b,a
    ld d,(ix+1)
    ld e,(ix+2)
    call paint_sprite_1_1
spwnstar_next:
    ;Update...
    call rand
    and %00000001
    add a,1
    ld b,a
    call move_star

    ld a,(ix+3)
    cp %00000000
    call z,kill_star


    ld de,STARS_DATA_LENGTH
    add ix,de
    jp spwnstar_start


;B=move amount
move_star:
    sla (ix+3)
    djnz move_star
    ret

kill_star:
    ld (ix),FALSE
    ret
    

starfield_draw:
    ld ix,stars
sfd_start:
    ld a,(ix)
    cp 255
    ret z
    cp FALSE
    jp z,sfd_next

    ld d,(ix+1)
    ld e,(ix+2)
    call drawstarsprite
sfd_next:
    ld de,STARS_DATA_LENGTH
    add ix,de
    jp sfd_start
    
