STARFIELD_ATTRIBUTES equ %00000110

NEW_STAR equ %00000001


;isAlive,x,y,star-byte
stars:
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%01000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00001000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00000001
    db ALIVE,0,0,%00000010
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%01000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00001000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00000001
    db ALIVE,0,0,%00000010
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%01000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00001000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00000001
    db ALIVE,0,0,%00000010
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%01000000
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00001000
    db ALIVE,0,0,%00010000
    db ALIVE,0,0,%00000001
    db ALIVE,0,0,%00000010
    db ALIVE,0,0,%10000000
    db ALIVE,0,0,%00000000
    db 255
STARS_DATA_LENGTH equ 4

starfield_init:
    ld hl,0x5800
    ld b,STARFIELD_ATTRIBUTES
    call paint_base_attributes
    ret
   



starfield_update:
    ld ix,stars
spwnstar_start:
    ld a,(ix)
    cp 255
    ret z
    cp DEAD
    jp nz, spwnstar_next

    call rand
    and %00001111
    ld b,a
    call rand
    and %00000111
    add a,b
    add a,BUFFER_SIDE_EXTRA
    ld (ix+1),a
    call rand
    and %01111111
    ld b,a
    call rand
    and %00011111
    add a,b
    ld (ix+2),a
    ld (ix+3),NEW_STAR
    ld (ix),TRUE
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
    ld (ix),DEAD
    ret
    

starfield_draw:
    ld ix,stars
sfd_start:
    ld a,(ix)
    cp 255
    ret z
    cp DEAD
    jp z,sfd_next

    ld d,(ix+1)
    ld e,(ix+2)
    call drawstarsprite
sfd_next:
    ld de,STARS_DATA_LENGTH
    add ix,de
    jp sfd_start
    
