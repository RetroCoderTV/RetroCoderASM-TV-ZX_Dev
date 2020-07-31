; Middle C      261.63
; C sharp       277.18
; D             293.66
; D sharp       311.13
; E             329.63
; F             349.23
; F sharp       369.99
; G             392.00
; G sharp       415.30
; A             440.00
; A sharp       466.16
; B             493.88

; DE = Duration = Frequency * Seconds
; HL = Pitch = 437500 / Frequency - 30.125

makesound_csharp_0_25:
    ld hl,1548
    ld de,69
    call 949 ;ROM beeper routine
    ret

makesound_gsharp_0_5:
    ld hl,1023
    ld de,208
    call 949 ;ROM beeper routine
    ret

makesound_gsharp_0_25:
    ld hl,1023
    ld de,104
    call 949 ;ROM beeper routine
    ret