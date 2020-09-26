py dw 0x5A00
px dw 0x0500

vy dw 0x0000
vx dw 0x0000



THRUST_FORCE equ -64 ;%1111111111000000
THRUST_MAX equ -8
THRUST_SIDE_FORCE equ 64
THRUST_SIDE_MAX equ 1
GRAVITY_MAX equ 8 ;upper byte
GRAVITY_FORCE equ 32; %0000000000011111  



; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
playersprite:
    db %00011111, %11000000
    db %00110010, %01100000
    db %01100010, %00110000
    db %11111111, %11111111
    db %11111111, %11111111
    db %10000111, %11100001
    db %10110111, %11101101
    db %00110000, %00001100
;



player_update:
    call check_keys

    call plyr_apply_gravity
    ; call plyr_apply_drag ;sideways 

    ld a,(keypressed_W)
    cp TRUE
    call z,plyr_apply_thrusters

    ld a,(keypressed_D)
    cp TRUE
    call z,plyr_apply_thrusters_r

    ld a,(keypressed_A)
    cp TRUE
    call z,plyr_apply_thrusters_l

    call move_player
    ret

move_player:
    ld hl,px
    inc hl
    ld d,(hl)
    ld hl,vx
    inc hl
    ld a,(hl)
    add a,d
    ld hl,px
    inc hl
    ld (hl),a


    ld hl,py
    inc hl
    ld d,(hl)
    ld hl,vy
    inc hl
    ld a,(hl)
    add a,d
    ld hl,py
    inc hl
    ld (hl),a
    ret

player_draw:
    ld hl,px
    inc hl
    ld d,(hl)
    ld hl,py
    inc hl
    ld e,(hl)
    ld bc,playersprite
    call drawsprite16_8
    ret
;




plyr_apply_gravity:
    ld hl,vy
    inc hl
    ld a,(hl)
    cp GRAVITY_MAX
    ret z

    ld hl,(vy)
    ld de,GRAVITY_FORCE
    add hl,de
    ld (vy),hl
    ret
;


; Unsigned

; If A == N, then Z flag is set.
; If A != N, then Z flag is reset.
; If A < N, then C flag is set.
; If A >= N, then C flag is reset.

; Signed

; If A == N, then Z flag is set.
; If A != N, then Z flag is reset.
; If A < N, then S and P/V are different.
; A >= N, then S and P/V are the same.

plyr_apply_thrusters:
    ld hl,vy
    inc hl
    ld a,(hl)
    cp THRUST_MAX
    ret z

    ld hl,(vy)
    ld de,THRUST_FORCE
    add hl,de
    ld (vy),hl
    ret

plyr_apply_thrusters_r:
    ld hl,vx
    inc hl
    ld a,(hl)
    cp THRUST_SIDE_MAX
    ret z

    ld hl,(vx)
    ld de,THRUST_SIDE_FORCE
    add hl,de
    ld (vx),hl
    ret
plyr_apply_thrusters_l:
    ld hl,vx
    inc hl
    ld a,(hl)
    cp -THRUST_SIDE_MAX
    ret z

    ld hl,(vx)
    ld de,-THRUST_SIDE_FORCE
    add hl,de
    ld (vx),hl
    ret




