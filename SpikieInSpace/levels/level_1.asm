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
L1_WAVE_21_START equ 29 
L1_WAVE_22_START equ 30
L1_WAVE_23_START equ 32
L1_WAVE_24_START equ 33
L1_WAVE_25_START equ 36
L1_WAVE_26_START equ 37
L1_WAVE_27_START equ 38
L1_WAVE_28_START equ 39
L1_WAVE_29_START equ 40
L1_WAVE_30_START equ 43
L1_WAVE_31_START equ 44
L1_WAVE_32_START equ 46
L1_WAVE_33_START equ 47
L1_WAVE_34_START equ 48
L1_WAVE_35_START equ 49
L1_WAVE_36_START equ 50
L1_WAVE_37_START equ 52
L1_WAVE_38_START equ 53
L1_WAVE_39_START equ 55
L1_WAVE_40_START equ 56
L1_LEVEL_END equ 60



;enemy spawn slots
L1_SPAWNSLOT_TOP equ 15
L1_SPAWNSLOT_MIDDLE equ 85
L1_SPAWNSLOT_BOTTOM equ 125


; wave # | slot | pattern |     sprite
; 1     TOP         STRAIGHT    INVADER
; 2     BOTTOM      ZAG         INVADER
; 3     TOP         ZIG         INVADER
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
; 18    BOTTOM      ZAG         T
; 19    MID         WAVE        T
; 20    MID         ZAG         WING
; 21     TOP         WAVE        INVADER
; 22     BOTTOM      ZAG         T
; 23     TOP         ZIG         T
; 24     BOTTOM      ZAG         SPERM
; 25     MID         WAVE        SPERM
; 26     MID         WAVE        SPERM
; 27     TOP         WAVE        SPERM
; 28     TOP         ZIG         SAUCER
; 29     BOTTOM      ZAG         ARROW
; 30    BOTTOM      ZAG         T
; 31    MID         ZAG         T
; 32    MID         ZIG         ARROW
; 33    TOP         WAVE        SAUCER
; 34    BOTTOM      ZAG         INVADER
; 35    TOP         ZIG         SAUCER
; 36    BOTTOM      WAVE        ARROW
; 37    BOTTOM      WAVE        SAUCER
; 38    BOTTOM      ZAG         T
; 39    MID         WAVE        WING
; 40    MID         ZAG         WING
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
    cp L1_WAVE_21_START
    ret z
    cp L1_WAVE_23_START
    ret z
    cp L1_WAVE_27_START
    ret z
    cp L1_WAVE_28_START
    ret z
    cp L1_WAVE_33_START
    ret z
    cp L1_WAVE_35_START
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
    cp L1_WAVE_25_START
    ret z
    cp L1_WAVE_26_START
    ret z
    cp L1_WAVE_31_START
    ret z
    cp L1_WAVE_32_START
    ret z
    cp L1_WAVE_39_START
    ret z
    cp L1_WAVE_40_START
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
    cp L1_WAVE_22_START
    ret z
    cp L1_WAVE_24_START
    ret z
    cp L1_WAVE_29_START
    ret z
    cp L1_WAVE_30_START
    ret z
    cp L1_WAVE_34_START
    ret z
    cp L1_WAVE_36_START
    ret z
    cp L1_WAVE_37_START
    ret z
    cp L1_WAVE_38_START
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
    cp L1_WAVE_21_START
    ret z
    cp L1_WAVE_25_START
    ret z
    cp L1_WAVE_26_START
    ret z
    cp L1_WAVE_27_START
    ret z
    cp L1_WAVE_33_START
    ret z
    cp L1_WAVE_36_START
    ret z
    cp L1_WAVE_37_START
    ret z
    cp L1_WAVE_39_START
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
    cp L1_WAVE_23_START
    ret z
    cp L1_WAVE_28_START
    ret z
    cp L1_WAVE_32_START
    ret z
    cp L1_WAVE_35_START
    ret z
    
    push hl
    ld hl,flightpattern_zag
    ld (current_pattern),hl
    pop hl
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
    cp L1_WAVE_18_START
    ret z
    cp L1_WAVE_22_START
    ret z
    cp L1_WAVE_24_START
    ret z
    cp L1_WAVE_29_START
    ret z
    cp L1_WAVE_30_START
    ret z
    cp L1_WAVE_31_START
    ret z
    cp L1_WAVE_34_START
    ret z
    cp L1_WAVE_38_START
    ret z
    cp L1_WAVE_40_START
    ret z
    
    push hl
    ld hl,flightpattern_straight
    ld (current_pattern),hl
    pop hl
    ld a,h ;compare high byte to P starts (pattern starts)
    cp L1_WAVE_1_START
    ret z
    

    ret


l1_setenemysprite:
    push hl
    ld hl,enemysprite_saucer
    ld (current_enemy_spritetype),hl
    pop hl
    ld a,h
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
    cp L1_WAVE_28_START
    ret z
    cp L1_WAVE_33_START
    ret z
    cp L1_WAVE_35_START
    ret z
    cp L1_WAVE_37_START
    ret z

    push hl
    ld hl,enemysprite_tfighter
    ld (current_enemy_spritetype),hl
    pop hl
    ld a,h
    cp L1_WAVE_18_START
    ret z
    cp L1_WAVE_19_START
    ret z
    cp L1_WAVE_22_START
    ret z
    cp L1_WAVE_23_START
    ret z
    cp L1_WAVE_30_START
    ret z
    cp L1_WAVE_31_START
    ret z
    cp L1_WAVE_38_START
    ret z

    push hl
    ld hl,enemysprite_sperm
    ld (current_enemy_spritetype),hl
    pop hl
    ld a,h
    cp L1_WAVE_24_START
    ret z
    cp L1_WAVE_25_START
    ret z
    cp L1_WAVE_26_START
    ret z
    cp L1_WAVE_27_START
    ret z

    push hl 
    ld hl,enemysprite_wing
    ld (current_enemy_spritetype),hl
    pop hl
    cp L1_WAVE_20_START
    ret z
    cp L1_WAVE_39_START
    ret z
    cp L1_WAVE_40_START
    ret z


    push hl
    ld hl,enemysprite_invader
    ld (current_enemy_spritetype),hl
    pop hl
    ld a,h
    cp L1_WAVE_1_START
    ret z
    cp L1_WAVE_2_START
    ret z
    cp L1_WAVE_3_START
    ret z
    cp L1_WAVE_21_START
    ret z
    cp L1_WAVE_34_START
    ret z

    ld hl,enemysprite_arrow
    ld (current_enemy_spritetype),hl
    
    ret