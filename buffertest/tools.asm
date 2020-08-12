;sets border colour to value in A
setbordercolour:
    call 0x229B
    ret

;vsync routine
previousframecount db 0
sync:
    ld hl,previousframecount
    ld a,(0x5C78) ;A=current internal frame count
    sub (hl) ;A= current minus previous frame count
    cp FRAME_DELAY
    jp nc,sync_end
    ;waiting
    jp sync
sync_end:
    ld a,(0x5C78)
    ld (hl),a
    ret