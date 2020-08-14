setbordercolour:
    call 0x229B
    ret


;vsync routine
previousframecount db 0

sync:
    ld hl,previousframecount
    ld a,(0x5C78) ;A=current internal frame count
    sub (hl) ;A=current-prev count
    cp FRAME_DELAY
    jp nc,sync_end
    ;waiting for sync    
    jp sync
sync_end:
    ld a,(0x5C78) ;get current framecount
    ld (hl),a ;previousframecount=framecount
    ret 

