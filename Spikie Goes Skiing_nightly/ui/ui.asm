draw_ui:
    ;; CASH!!! 

    ld a,ASCII_AT
    rst 16
    xor a
    rst 16
    ld a,CASH_LABEL_X
    rst 16
    ld de,cash_string
    ld bc,eo_cash_string-cash_string
    call 8252

    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,26
    rst 16
    ld a,(cash_1000)
    add a,ASCII_ZERO
    rst 16
   
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,27
    rst 16
    ld a,(cash_100)
    add a,ASCII_ZERO
    rst 16    

    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,28
    rst 16
    ld a,(cash_10)
    add a,ASCII_ZERO
    rst 16
   
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,29
    rst 16
    ld a,(cash_1)
    add a,ASCII_ZERO
    rst 16    









    ;;POINTS::
    
    ld a,ASCII_AT
    rst 16
    ld a,3
    rst 16
    ld a,SCORE_LABEL_X
    rst 16
    ld de,score_string
    ld bc,eo_score_string-score_string
    call 8252


    ld a,ASCII_AT
    rst 16
    ld a,SCORE_Y
    rst 16
    ld a,SCORE_100000_X
    rst 16
    ld a,(score_100000)
    add a,ASCII_ZERO
    rst 16

    ld a,ASCII_AT
    rst 16
    ld a,SCORE_Y
    rst 16
    ld a,SCORE_10000_X
    rst 16
    ld a,(score_10000)
    add a,ASCII_ZERO
    rst 16
   
    ld a,ASCII_AT
    rst 16
    ld a,SCORE_Y
    rst 16
    ld a,SCORE_1000_X
    rst 16
    ld a,(score_1000)
    add a,ASCII_ZERO
    rst 16    

    ld a,ASCII_AT
    rst 16
    ld a,SCORE_Y
    rst 16
    ld a,SCORE_100_X
    rst 16
    ld a,(score_100)
    add a,ASCII_ZERO
    rst 16
   
    ld a,ASCII_AT
    rst 16
    ld a,SCORE_Y
    rst 16
    ld a,SCORE_10_X
    rst 16
    ld a,(score_10)
    add a,ASCII_ZERO
    rst 16    

    ld a,ASCII_AT
    rst 16
    ld a,SCORE_Y
    rst 16
    ld a,SCORE_1_X
    rst 16
    ld a,(score_1)
    add a,ASCII_ZERO
    rst 16    

    ret

;



;DE=yx
;HL=score_pointer
draw_digit:
    ld a,ASCII_AT
    rst 16
    ld a,d
    rst 16
    ld a,e
    rst 16
    ld a,(hl)
    add a,ASCII_ZERO
    rst 16   

    ret
 


increment_score1:
    ld a,(score_1)
    inc a
    ld (score_1),a 
    cp 9
    jp z, reset_score_1
    
    ld d,SCORE_Y
    ld e,SCORE_1_X
    ld hl,score_1
    call draw_digit
    ret
reset_score_1:
    call increment_score10
    xor a
    ld (score_1),a
    ld d,SCORE_Y
    ld e,SCORE_1_X
    ld hl,score_1
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
    ld hl,score_10
    call draw_digit
    ret

reset_score10:
    call increment_score100
    xor a
    ld (score_10),a
    ld a,SCORE_Y
    ld d,SCORE_Y
    ld e,SCORE_10_X
    ld hl,score_10
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
    ld hl,score_100
    call draw_digit
    ret

reset_score100:
    call increment_score1000
    xor a
    ld (score_100),a
    ld a,SCORE_Y
    ld d,SCORE_Y
    ld e,SCORE_100_X
    ld hl,score_100
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
    ld hl,score_1000
    call draw_digit
    ret

reset_score1000:
    call increment_score10000
    xor a
    ld (score_1000),a
    ld a,SCORE_Y
    ld d,SCORE_Y
    ld e,SCORE_1000_X
    ld hl,score_1000
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
    ld hl,score_10000
    call draw_digit
    ret

reset_score10000:
    call increment_score100000
    xor a
    ld (score_10000),a
    ld a,SCORE_Y
    ld d,SCORE_Y
    ld e,SCORE_10000_X
    ld hl,score_100000
    call draw_digit  
    ret

increment_score100000:
    ld a,(score_100000)
    cp 9
    jp z,reset_score100000
    inc a
    ld (score_100000),a
    ld d,SCORE_Y
    ld e,SCORE_100000_X
    ld hl,score_100000
    call draw_digit
    ret

reset_score100000:
   
    ret



drawskiicon:
    ld a,22
    rst 16
    ld a,8
    rst 16
    ld a,27
    rst 16
    ld a,'*'
    rst 16
    ret




;;;; DATA ;;;;;;;;;;

skis_got db 0

CASH_LABEL_X equ 26
cash_string db 'CASH'
eo_cash_string equ $

cash_1     db 0
cash_10    db 3
cash_100   db 0
cash_1000  db 0


SCORE_LABEL_X equ 25

SCORE_Y equ 4
SCORE_1_X equ 30
SCORE_10_X equ 29
SCORE_100_X equ 28
SCORE_1000_X equ 27
SCORE_10000_X equ 26
SCORE_100000_X equ 25

score_string db 'POINTS'
eo_score_string equ $

score_1     db 0
score_10    db 0
score_100   db 0
score_1000  db 0
score_10000  db 0
score_100000  db 0



























