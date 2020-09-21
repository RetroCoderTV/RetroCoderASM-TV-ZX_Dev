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
L1_LEVEL_END equ 28



;enemy spawn slots
L1_SPAWNSLOT_TOP equ 15
L1_SPAWNSLOT_MIDDLE equ 90
L1_SPAWNSLOT_BOTTOM equ 140




; wave # | slot | pattern
; 1     TOP         WAVE
; 2     BOTTOM      ZAG
; 3     TOP         ZIG
; 4     BOTTOM      ZAG    
; 5     MID         WAVE
; 6     MID         WAVE
; 7     TOP         WAVE
; 8     TOP         ZIG
; 9     BOTTOM      ZAG
; 10    BOTTOM      ZAG
; 11    MID         ZAG
; 12    MID         ZIG
; 13    TOP         WAVE
; 14    BOTTOM      ZAG
; 15    TOP         ZIG
; 16    BOTTOM      WAVE
; 17    BOTTOM      WAVE
; 18    BOTTOM      ZAG 
; 19    MID         WAVE
; 20    MID         ZAG
;INPUTS:
;H=(level timer)
setoffset:
    ld a,L1_SPAWNSLOT_TOP
    ld (wave_y_offset),a
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L1_LEVEL_END
    jp z,program_end
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
    cp L1_WAVE_15_START
    ret z

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
    cp L1_WAVE_20_START
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
    cp L1_WAVE_14_START
    ret z
    cp L1_WAVE_16_START
    ret z
    cp L1_WAVE_17_START
    ret z
    cp L1_WAVE_18_START
    ret z

    jp increment_timer

;H=level timer (high byte)
setpattern:
    push hl
    ld hl,flightpattern_wave
    ld (current_pattern),hl
    pop hl
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L1_WAVE_1_START
    ret z
    cp L1_WAVE_1_START
    ret z
    cp L1_WAVE_5_START
    ret z
    cp L1_WAVE_6_START
    ret z
    cp L1_WAVE_7_START
    ret z
    cp L1_WAVE_13_START
    ret z
    cp L1_WAVE_16_START
    ret z
    cp L1_WAVE_17_START
    ret z
    cp L1_WAVE_19_START
    ret z
    cp L1_WAVE_20_START
    ret z
    

    push hl
    ld hl,flightpattern_zig
    ld (current_pattern),hl
    pop hl
    cp L1_WAVE_3_START
    ret z
    cp L1_WAVE_8_START
    ret z
    cp L1_WAVE_11_START
    ret z
    cp L1_WAVE_12_START
    ret z
    cp L1_WAVE_15_START
    ret z
    
    push hl
    ld hl,flightpattern_zag
    ld (current_pattern),hl
    pop hl
    cp L1_WAVE_2_START
    ret z
    cp L1_WAVE_4_START
    ret z
    cp L1_WAVE_10_START
    ret z
    cp L1_WAVE_14_START
    ret z
    cp L1_WAVE_18_START
    ret z
    
    

    ret


