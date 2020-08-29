

previousframecount db 0


sync:
    ld hl,previousframecount
    ld a,(0x5C78) ;A=current internal frame count
    sub (hl)
    cp FRAME_DELAY
    jp nc, sync_end
    ;waiting for next frame
    ;
    ;
 
    ;;
    jp sync
sync_end:
    ld a,(0x5C78) ;get framecount
    ld (hl),a ;cache current frame count
    ret


sync_late:
    ld hl,previousframecount
    ld a,(0x5C78) ;A=current internal frame count
    sub (hl)
    cp FRAME_DELAY_LATE
    jp nc, sync_late_end
    ;waiting for next frame
    ;
    ;
 
    ;;
    jp sync
sync_late_end:
    ld a,(0x5C78) ;get framecount
    ld (hl),a ;cache current frame count
    ret