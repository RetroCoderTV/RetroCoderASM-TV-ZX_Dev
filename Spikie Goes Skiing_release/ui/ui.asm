init_ui_labels:
    ld bc,15616
    ld d,CASH_LABEL_Y
    ld e,CASH_LABEL_X
    call GetCharAddr
    ld de,cash_string
    call PrintStr

    ld bc,15616
    ld d,SCORE_LABEL_Y
    ld e,SCORE_LABEL_X
    call GetCharAddr
    ld de,score_string
    call PrintStr

    ret

init_ui_numbers:
    ld bc,15616
    ld d,CASH_Y
    ld e,CASH_1000_X
    call GetCharAddr
    ld a,(cash_1000)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,CASH_Y
    ld e,CASH_100_X
    call GetCharAddr
    ld a,(cash_100)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,CASH_Y
    ld e,CASH_10_X
    call GetCharAddr
    ld a,(cash_10)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,CASH_Y
    ld e,CASH_1_X
    call GetCharAddr
    ld a,(cash_1)
    add a,ASCII_ZERO
    call PrintChar

    ;;POINTS::

    ld bc,15616
    ld d,SCORE_Y
    ld e,SCORE_100000_X
    call GetCharAddr
    ld a,(score_100000)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,SCORE_Y
    ld e,SCORE_10000_X
    call GetCharAddr
    ld a,(score_10000)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,SCORE_Y
    ld e,SCORE_1000_X
    call GetCharAddr
    ld a,(score_1000)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,SCORE_Y
    ld e,SCORE_100_X
    call GetCharAddr
    ld a,(score_100)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,SCORE_Y
    ld e,SCORE_10_X
    call GetCharAddr
    ld a,(score_10)
    add a,ASCII_ZERO
    call PrintChar

    ld bc,15616
    ld d,SCORE_Y
    ld e,SCORE_1_X
    call GetCharAddr
    ld a,(score_1)
    add a,ASCII_ZERO
    call PrintChar

    ret
;

;DE=yx
;A=(value)
draw_digit:
    ld bc,15616
    push af
    call GetCharAddr
    pop af
    add a,ASCII_ZERO
    call PrintChar  
    ret
; 

decrease_cash:
    ld a,(cash_10)
    cp 0
    ret z

    ld a,(cash_10)
    dec a
    ld (cash_10),a

    ld d,CASH_Y
    ld e,CASH_10_X
    ld a,(cash_10)
    call draw_digit
    ret

increment_score1:
    ld a,(score_1)
    inc a
    ld (score_1),a 
    cp 9
    jp z, reset_score_1
    
    ld d,SCORE_Y
    ld e,SCORE_1_X
    ld a,(score_1)
    call draw_digit
    ret
reset_score_1:
    call increment_score10
    xor a
    ld (score_1),a
    ld d,SCORE_Y
    ld e,SCORE_1_X
    ld a,(score_1)
    call draw_digit
    ret

increment_score10:
    ld a,(score_10)
    cp 9
    jp nc,reset_score10
    inc a
    ld (score_10),a
    ld d,SCORE_Y
    ld e,SCORE_10_X
    ld a,(score_10)
    call draw_digit
    ret

reset_score10:
    call increment_score100
    xor a
    ld (score_10),a
    ld d,SCORE_Y
    ld e,SCORE_10_X
    ld a,(score_10)
    call draw_digit
    
    ret

increment_score100:
    ld a,(score_100)
    cp 9
    jp z,reset_score100
    inc a
    ld (score_100),a
    ld d,SCORE_Y
    ld e,SCORE_100_X
    ld a,(score_100)
    call draw_digit
    ret

reset_score100:
    call increment_score1000
    xor a
    ld (score_100),a
    ld d,SCORE_Y
    ld e,SCORE_100_X
    ld a,(score_100)
    call draw_digit
    
    ret

increment_score1000:
    ld a,(score_1000)
    cp 9
    jp z,reset_score1000
    inc a
    ld (score_1000),a
    ld d,SCORE_Y
    ld e,SCORE_1000_X
    ld a,(score_1000)
    call draw_digit
    ret

reset_score1000:
    call increment_score10000
    xor a
    ld (score_1000),a
    ld d,SCORE_Y
    ld e,SCORE_1000_X
    ld a,(score_1000)
    call draw_digit
    
    ret

increment_score10000:
    ld a,(score_10000)
    cp 9
    jp z,reset_score10000
    inc a
    ld (score_10000),a
    ld d,SCORE_Y
    ld e,SCORE_10000_X
    ld a,(score_10000)
    call draw_digit
    ret

reset_score10000:
    call increment_score100000
    xor a
    ld (score_10000),a
    ld d,SCORE_Y
    ld e,SCORE_10000_X
    ld a,(score_10000)
    call draw_digit  
    ret

increment_score100000:
    ld a,(score_100000)
    cp 9
    ret z
    inc a
    ld (score_100000),a
    ld d,SCORE_Y
    ld e,SCORE_100000_X
    ld a,(score_100000)
    call draw_digit
    ret


    


;;;; DATA ;;;;;;;;;;



cash_string db 'CASH',0
CASH_LABEL_Y equ 1
CASH_LABEL_X equ 26
CASH_Y equ CASH_LABEL_Y+1
CASH_1_X equ 29
CASH_10_X equ 28
CASH_100_X equ 27
CASH_1000_X equ 26


cash_1     db 0
cash_10    db 3
cash_100   db 0
cash_1000  db 0



SCORE_LABEL_Y equ 4
SCORE_LABEL_X equ 25
SCORE_Y equ SCORE_LABEL_Y+1


SCORE_1_X equ 30
SCORE_10_X equ 29
SCORE_100_X equ 28
SCORE_1000_X equ 27
SCORE_10000_X equ 26
SCORE_100000_X equ 25

score_string db 'POINTS',0

score_1     db 0
score_10    db 0
score_100   db 0
score_1000  db 0
score_10000  db 0
score_100000  db 0



























