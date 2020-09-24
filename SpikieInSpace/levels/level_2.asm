L2_WAVE_1_START equ 1 
L2_WAVE_2_START equ 2
L2_WAVE_3_START equ 3
L2_WAVE_4_START equ 4
L2_WAVE_5_START equ 6
L2_WAVE_6_START equ 7
L2_WAVE_7_START equ 8
L2_WAVE_8_START equ 9
L2_WAVE_9_START equ 12
L2_WAVE_10_START equ 14
L2_WAVE_11_START equ 16
L2_WAVE_12_START equ 17
L2_WAVE_13_START equ 18
L2_WAVE_14_START equ 19
L2_WAVE_15_START equ 20
L2_WAVE_16_START equ 23
L2_WAVE_17_START equ 24
L2_WAVE_18_START equ 25
L2_WAVE_19_START equ 26
L2_WAVE_20_START equ 27
L2_LEVEL_END equ 28



;enemy spawn slots
L2_SPAWNSLOT_TOP equ 15
L2_SPAWNSLOT_MIDDLE equ 95
L2_SPAWNSLOT_BOTTOM equ 130


; wave # | slot | pattern |     sprite
; 1     TOP         WAVE        ARROW
; 2     BOTTOM      ZAG         ARROW
; 3     TOP         ZIG         ARROW
; 4     BOTTOM      ZAG         ARROW
; 5     MID         WAVE        ARROW
; 6     MID         WAVE        ARROW
; 7     TOP         WAVE        ARROW
; 8     TOP         ZIG         ARROW
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
l2_setoffset:
    ld a,L2_SPAWNSLOT_TOP
    ld (wave_y_offset),a
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L2_LEVEL_END
    push af
    call z,boss_1_spawn
    pop af
    ret z
    cp L2_WAVE_1_START
    ret z
    cp L2_WAVE_3_START
    ret z
    cp L2_WAVE_7_START
    ret z
    cp L2_WAVE_8_START
    ret z
    cp L2_WAVE_13_START
    ret z
    cp L2_WAVE_15_START
    ret z

    ld a,L2_SPAWNSLOT_MIDDLE
    ld (wave_y_offset),a
    ld a,h
    cp L2_WAVE_5_START
    ret z
    cp L2_WAVE_6_START
    ret z
    cp L2_WAVE_11_START
    ret z
    cp L2_WAVE_12_START
    ret z
    cp L2_WAVE_19_START
    ret z
    cp L2_WAVE_20_START
    ret z

    ld a,L2_SPAWNSLOT_BOTTOM
    ld (wave_y_offset),a
    ld a,h
    cp L2_WAVE_2_START
    ret z
    cp L2_WAVE_4_START
    ret z
    cp L2_WAVE_9_START
    ret z
    cp L2_WAVE_10_START
    ret z
    cp L2_WAVE_14_START
    ret z
    cp L2_WAVE_16_START
    ret z
    cp L2_WAVE_17_START
    ret z
    cp L2_WAVE_18_START
    ret z

    ld a,h
    cp L2_LEVEL_END
    jp c, increment_timer

    ret

;H=level timer (high byte)
l2_setpattern:
    push hl
    ld hl,flightpattern_wave
    ld (current_pattern),hl
    pop hl
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L2_WAVE_1_START
    ret z
    cp L2_WAVE_1_START
    ret z
    cp L2_WAVE_5_START
    ret z
    cp L2_WAVE_6_START
    ret z
    cp L2_WAVE_7_START
    ret z
    cp L2_WAVE_13_START
    ret z
    cp L2_WAVE_16_START
    ret z
    cp L2_WAVE_17_START
    ret z
    cp L2_WAVE_19_START
    ret z
    cp L2_WAVE_20_START
    ret z
    

    push hl
    ld hl,flightpattern_zig
    ld (current_pattern),hl
    pop hl
    cp L2_WAVE_3_START
    ret z
    cp L2_WAVE_8_START
    ret z
    cp L2_WAVE_11_START
    ret z
    cp L2_WAVE_12_START
    ret z
    cp L2_WAVE_15_START
    ret z
    
    push hl
    ld hl,flightpattern_zag
    ld (current_pattern),hl
    pop hl
    cp L2_WAVE_2_START
    ret z
    cp L2_WAVE_4_START
    ret z
    cp L2_WAVE_10_START
    ret z
    cp L2_WAVE_14_START
    ret z
    cp L2_WAVE_18_START
    ret z
    
    

    ret


l2_setenemysprite:
    push hl
    ld hl,enemysprite_saucer
    ld (current_enemy_spritetype),hl
    pop hl
    ld a,h
    cp L2_WAVE_13_START
    ret z
    cp L2_WAVE_14_START
    ret z
    cp L2_WAVE_15_START
    ret z
    cp L2_WAVE_17_START
    ret z

    ld hl,enemysprite_arrow
    ld (current_enemy_spritetype),hl
    
    ret