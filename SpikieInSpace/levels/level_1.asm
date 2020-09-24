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
L1_SPAWNSLOT_MIDDLE equ 95
L1_SPAWNSLOT_BOTTOM equ 130


; wave # | slot | pattern |     sprite
; 1     TOP         WAVE        SAUCER
; 2     BOTTOM      ZAG         SAUCER
; 3     TOP         ZIG         SAUCER
; 4     BOTTOM      ZAG         SAUCER
; 5     MID         WAVE        ARROW
; 6     MID         WAVE        ARROW
; 7     TOP         WAVE        SAUCER
; 8     TOP         ZIG         SAUCER
; 9     BOTTOM      ZAG         ARROW
; 10    BOTTOM      ZAG         ARROW
; 11    MID         ZAG         ARROW
; 12    MID         ZIG         ARROW
; 13    TOP         WAVE        SAUCER
; 14    BOTTOM      ZAG         SAUCER
; 15    TOP         ZIG         SAUCER
; 16    BOTTOM      WAVE        ARROW
; 17    BOTTOM      WAVE        SAUCER
; 18    BOTTOM      ZAG         ARROW
; 19    MID         WAVE        ARROW
; 20    MID         ZAG         ARROW
;INPUTS:
;H=(level timer)
l1_setoffset:
    ld a,L1_SPAWNSLOT_TOP
    ld (wave_y_offset),a
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L1_LEVEL_END
    push af
    call z,boss_1_spawn
    pop af
    ret z
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

    ld a,h
    cp L1_LEVEL_END
    jp c, increment_timer

    ret

;H=level timer (high byte)
l1_setpattern:
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


l1_setenemysprite:
    push hl
    ld hl,enemysprite_saucer
    ld (current_enemy_spritetype),hl
    pop hl
    ld a,h
    cp L1_WAVE_1_START
    ret z
    cp L1_WAVE_2_START
    ret z
    cp L1_WAVE_3_START
    ret z
    cp L1_WAVE_4_START
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
    cp L1_WAVE_17_START
    ret z

    ld hl,enemysprite_arrow
    ld (current_enemy_spritetype),hl
    
    ret