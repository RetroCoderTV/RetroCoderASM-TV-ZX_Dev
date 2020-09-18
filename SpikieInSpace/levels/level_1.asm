L1_WAVE_1_START equ 1 
L1_WAVE_2_START equ 2
L1_WAVE_3_START equ 3
L1_WAVE_4_START equ 4
L1_WAVE_5_START equ 6
L1_WAVE_6_START equ 7
L1_WAVE_7_START equ 8
L1_WAVE_8_START equ 9
L1_WAVE_9_START equ 12
L1_WAVE_10_START equ 14
L1_WAVE_11_START equ 16
L1_WAVE_12_START equ 17
L1_WAVE_13_START equ 18
L1_WAVE_14_START equ 19
L1_WAVE_15_START equ 20
L1_WAVE_16_START equ 23
L1_WAVE_17_START equ 24
L1_WAVE_18_START equ 25
L1_WAVE_19_START equ 26
L1_WAVE_20_START equ 27
L1_LEVEL_END equ 35



;enemy spawn slots
L1_SPAWNSLOT_TOP equ 0
L1_SPAWNSLOT_MIDDLE equ 35
L1_SPAWNSLOT_BOTTOM equ 110




;wave offsets:
; wave 1=TOP     / 1
; wave 2=BOTTOM    / 1
; wave 3=TOP     / 2
; wave 4=BOTTOM    / 2
; wave 5=MID     / 2
; wave 6=MID     / 1
; wave 7=TOP     / 1
; wave 8=TOP     / 1
; wave 9=BOTTOM     / 1
; wave 10=BOTTOM     / 1
; wave 11=MID     / 1
; wave 12=MID     / 1
; wave 13=TOP     / 1
; wave 14=TOP     / 1
; wave 15=TOP     / 1
; wave 16=BOTTOM     / 1
; wave 17=BOTTOM     / 1
; wave 18=BOTTOM     / 1
; wave 19=MID     / 1
; wave 20=MID     / 1
;INPUTS:
;H=(level timer)
setoffset:
    ld a,L1_SPAWNSLOT_TOP
    ld (wave_y_offset),a
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L1_WAVE_1_START
    ret z
    cp L1_WAVE_3_START
    ret z
    cp L1_WAVE_7_START
    ret z
    cp L1_WAVE_8_START
    ret z
    cp L1_WAVE_13_START
    ret z
    cp L1_WAVE_14_START
    ret z
    cp L1_WAVE_15_START
    ret z

    ld a,L1_SPAWNSLOT_BOTTOM
    ld (wave_y_offset),a
    ld a,h
    cp L1_WAVE_2_START
    ret z
    cp L1_WAVE_4_START
    ret z
    cp L1_WAVE_9_START
    ret z
    cp L1_WAVE_10_START
    ret z
    cp L1_WAVE_16_START
    ret z
    cp L1_WAVE_17_START
    ret z
    cp L1_WAVE_18_START
    ret z

    ;if neither of the above, default to middle

    ld a,L1_SPAWNSLOT_MIDDLE
    ld (wave_y_offset),a
    ld a,h
    cp L1_WAVE_5_START
    ret z
    cp L1_WAVE_6_START
    ret z
    cp L1_WAVE_11_START
    ret z
    cp L1_WAVE_12_START
    ret z
    cp L1_WAVE_19_START
    ret z
    cp L1_WAVE_19_START
    ret z

    jp spawnwave_end

;D=level timer (high byte)
setpattern:
    push hl
    ld hl,flightpattern_1
    ld (current_pattern),hl
    pop hl
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L1_WAVE_1_START
    ret z
    cp L1_WAVE_2_START
    ret z

    push hl
    ld hl,flightpattern_2
    ld (current_pattern),hl
    pop hl
    ld a,h
    cp L1_WAVE_2_START
    ret z
    cp L1_WAVE_3_START
    ret z
    cp L1_WAVE_4_START
    ret z

    ;temp: default to 1
    ld hl,flightpattern_1
    ld (current_pattern),hl

    ret


