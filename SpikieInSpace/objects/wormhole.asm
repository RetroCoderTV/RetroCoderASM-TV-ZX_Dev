wormhole_sprite:
    db %00011000
    db %00111110
    db %01100011
    db %11011101
    db %10100011
    db %11011101
    db %01100010
    db %00111100
;

wormhole_y db 0
WORMHOLE_X equ 25
wormhole_state db WORMHOLE_NOT_VISIBLE


;wormhole states:
WORMHOLE_NOT_VISIBLE equ 0
WORMHOLE_VISIBLE equ 1


wormhole_spawn:
    ld a,(wave_y_offset)
    ld (wormhole_y),a

    ld a,WORMHOLE_VISIBLE
    ld (wormhole_state),a
    ret

wormhole_destroy:
    ld a,WORMHOLE_NOT_VISIBLE
    ld (wormhole_state),a
    ret

; wormhole_update:
;     ld a,(wormhole_state)
;     cp WORMHOLE_VISIBLE
;     ret nz

;     ret

wormhole_draw:
    ld a,(wormhole_state)
    cp WORMHOLE_VISIBLE
    ret nz
    push de
    ld d,WORMHOLE_X
    ld a,(wormhole_y)
    ld e,a
    ld bc,wormhole_sprite
    call drawsprite8_8
    pop de
    ret