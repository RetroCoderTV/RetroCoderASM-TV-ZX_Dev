LOCKER_LID_COLOUR equ %01101000
LOCKER_MID_COLOUR equ %01011000



LOCKER_TRIGGER_OFFSET_X equ 1
LOCKER_TRIGGER_OFFSET_Y equ 20


; line based output of attribute data:

    ; db 
    ; db %00101011
    ; db 
    ; db %00000011
    ; db %00000011
    ; db %00000011


emptylockerbyte_r db %10000000
emptylockerbyte_l db %00000001



; ASM data file from a ZX-Paintbrush picture with 16 x 24 pixels (= 2 x 3 characters)
; line based output of pixel data:
lockersprite:
    db %11111111, %11111111
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %11111111, %11111111
    db %11111111, %11111111
    ;
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    ;
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %10000000, %00000001
    db %11111111, %11111111

heartlockersprite:
    db %00000000
    db %00010100
    db %00111110
    db %00101110
    db %00111110
    db %00011100
    db %00001000
    db %00000000




;;;Stupid idea!:
;N=number of hearts in locker
;C=TOTAL HEARTS AT START
;D=C-N =iterations
;if (D == 1) call delheart1()
;if (D == 1) call delheart2()
;if (D == 1) call delheart3()
;if (D == 1) call delheart4()