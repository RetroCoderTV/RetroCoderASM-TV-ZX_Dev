;Soundtools - collection of functions regarding sound output
;
;Table of Hertz values for sound notes:
; Middle C
; 261.63
; C sharp
; 277.18
; D
; 293.66
; D sharp
; 311.13
; E
; 329.63
; F
; 349.23
; F sharp
; 369.99
; G
; 392.00
; G sharp
; 415.30
; A
; 440.00
; A sharp
; 466.16
; B
; 493.88
;
; Octave higher = double frequency
;
;DE = Duration = Frequency * Seconds
;HL = Pitch = 437500 / Frequency - 30.125




;NOTES:
;DE = Duration = Frequency * Seconds
;HL = Pitch = 437500 / Frequency - 30.125
sound_GSharp_0_25: ;GSharp, 0.25 seconds
    ld hl,497 ;sound pitch
    ld de,208 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_A_0_25:
    ld hl,110 ;sound pitch
    ld de,964 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_B_0_25:
    ld hl,123 ;sound pitch
    ld de,856 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_F_0_25:
    ld hl,87 ;sound pitch
    ld de,1223 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_F_0_50:
    ld hl,176 ;sound pitch
    ld de,856 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_G_0_125: ;G, 0.125secs
    ld hl,49 ;sound pitch
    ld de,1086 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_G_0_25: ;G, 0.25secs
    ld hl,98 ;sound pitch
    ld de,1086 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_G_0_375: ;G, 0.375secs
    ld hl,147 ;sound pitch
    ld de,1086 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret

sound_G_0_5: ;G, 0.5secs
    ld hl,196 ;sound pitch
    ld de,1086 ;sound 'duration'
    call 0x3b5 ;ROM beeper routine
    ret


;JINGLES
sound_jingle_dontyouforgetaboutme: 
    call sound_B_0_25
    ld b,2 ;pause length
    call pause_loop
    call sound_G_0_375
    ld b,6 ;pause length
    call pause_loop
    call sound_G_0_25
    ld b,2
    call pause_loop
    call sound_F_0_50
    ; ld b,1
    ; call pause_loop
    call sound_G_0_25
    ld b,1
    call pause_loop
    call sound_A_0_25
    ld b,1
    call pause_loop
    call sound_G_0_375
    ret

;B=frames to pause for
pause_loop:
    halt
    djnz pause_loop
    ret