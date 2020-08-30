TEETH_WIDTH equ 2
TEETH_HEIGHT equ 16

TEETH_SPEED_X equ 1
TEETH_SPEED_Y equ 4


teethy db 0
teethx db 0

teeth_current_state db TEETH_DEAD

teeth_aiming_up db FALSE
teeth_aiming_down db FALSE
teeth_aiming_left db FALSE
teeth_aiming_right db FALSE






teeth_spawn:
    ld a,(bobx)
    ld (teethx),a
    ld a,(boby)
    ld (teethy),a
    ld a,TEETH_AIMING
    ld (teeth_current_state),a
    ret

teeth_update:
    ld a,(teeth_current_state)
    cp TEETH_DEAD
    ret z
    cp TEETH_AIMING
    call z,teeth_update_aiming
    cp TEETH_FLYING
    call z,teeth_update_flying
    ret


;check boundary and set to dead*
;in bob, check if dead before spawning*
;check player-teeth collisions


teeth_update_aiming:
    ld a,(teethx)
    ld b,a
    ld a,(playerx) 
    cp b
    jp z, teeth_upd_fly_checky
    call c, teeth_aim_left
    call nc, teeth_aim_right
teeth_upd_fly_checky:
    ld a,(teethy)
    ld b,a
    ld a,(playery)
    cp b
    ret z
    call c,teeth_aim_up
    call nc,teeth_aim_down
    ld a,TEETH_FLYING
    ld (teeth_current_state),a
    ret



teeth_update_flying:
    ld a,(teeth_aiming_up)
    cp TRUE
    call z, teeth_move_up

    ld a,(teeth_aiming_down)
    cp TRUE
    call z, teeth_move_down

    ld a,(teeth_aiming_left)
    cp TRUE
    call z, teeth_move_left

    ld a,(teeth_aiming_right)
    cp TRUE
    call z, teeth_move_right

    call teeth_boundary_check
    ret



teeth_boundary_check:
    ld a,(teethx)
    cp MAX_X-2
    jp nc, teeth_set_dead
    cp MIN_X+1
    jp c, teeth_set_dead
    ld a,(teethy)
    cp MAX_Y-2
    jp nc, teeth_set_dead
    cp MIN_Y
    jp c, teeth_set_dead
    ret
teeth_set_dead:
    ld a,TEETH_DEAD
    ld (teeth_current_state),a
    ret




teeth_aim_up:
    ld a,TRUE
    ld (teeth_aiming_up),a
    ret
teeth_aim_down:
    ld a,TRUE
    ld (teeth_aiming_down),a
    ret
teeth_aim_left:
    ld a,TRUE   
    ld (teeth_aiming_left),a
    ret
teeth_aim_right:
    ld a,TRUE
    ld (teeth_aiming_right),a
    ret



teeth_move_up:
    ld a,(teethy)
    add a,-TEETH_SPEED_Y
    ld (teethy),a
    ret
teeth_move_down:
    ld a,(teethy)
    add a,TEETH_SPEED_Y
    ld (teethy),a
    ret
teeth_move_left:
    ld a,(teethx)
    add a,-TEETH_SPEED_X
    ld (teethx),a
    ret
teeth_move_right:
    ld a,(teethx)
    add a,TEETH_SPEED_X
    ld (teethx),a
    ret


teeth_draw:
    ld a,(teeth_current_state)
    cp TEETH_DEAD
    ret z
    ld bc,teethsprite
    ld de,(teethy)
    call drawsprite16_16
    ret






teethsprite:
; ASM data file from a ZX-Paintbrush picture with 16 x 16 pixels (= 2 x 2 characters)
; line based output of pixel data:
    ;frame0
    db %00000111, %11111110
    db %00011000, %00000010
    db %00010000, %00000011
    db %00110000, %00000001
    db %00100000, %00000001
    db %01100000, %00000111
    db %01111110, %00000111
    db %01111111, %10001111
    db %01010111, %11111111
    db %11110101, %11111011
    db %11100111, %01010011
    db %10100000, %01110011
    db %10101110, %11101111
    db %11101010, %10101011
    db %11111010, %10101111
    db %01111111, %11111110
    ;frame1
    db %00001111, %11111000
    db %00010000, %00001100
    db %00111111, %11100010
    db %01010101, %01010010
    db %01010101, %01011010
    db %00111111, %11110101
    db %00000111, %11110111
    db %00000011, %11111111
    db %00000001, %11111111
    db %00000111, %11111111
    db %11101000, %00000011
    db %10110000, %00000010
    db %10101110, %11101111
    db %01101010, %10101010
    db %00111010, %10101110
    db %00011111, %11111000