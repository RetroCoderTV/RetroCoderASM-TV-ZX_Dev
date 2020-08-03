


; Simple pseudo-random number generators.


;memstep:
; Steps a pointer through the ROM (held in seed), returning
; the contents of the byte at that location.
;Outputs:
;   A=random number (1byte)
random_memstep:
    ld hl,(memstep_seed) ; Pointer
    ld a,h
    and %00011111 ; keep it within first 8k of ROM.
    ld h,a
    ld a,(hl) ; Get "random" number from location.
    inc hl ; Increment pointer.
    ld (memstep_seed),hl
    ret
memstep_seed dw 0

;True or false random
;Outputs:
;   A=0 or 1 (false/true)
random_memstep_bool:
    ld hl,(memstepbool_seed) ; Pointer
    ld a,h
    and %00011111 ; keep it within first 8k of ROM.
    ld h,a
    ld a,(hl) ; Get "random" number from location.
    and %00000001 ;make it 0 or 1.
    inc hl ; Increment pointer.
    ld (memstepbool_seed),hl
    ret
memstepbool_seed dw 0