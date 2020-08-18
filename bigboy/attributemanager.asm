ATTRIBUTE_MEMORY_START equ 0x5800
ATTRIBUTE_MEMORY_END_UB equ 0x5B
ATTRIBUTE_MEMORY_LENGTH equ 0x300

paintcellsrandom:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    push hl
    call getrandom
    and %01011111
    or  %00011100
    pop hl
    ld (hl),a
    inc hl
    jp paintcellsrandom