UI_COLOURS equ %01010100

ui_init:
    ld hl,0x5800
    ld b,UI_COLOURS
    call paint_base_attributes

    call init_ui_labels
    call refresh_ui_numbers
    ret


init_ui_labels:
    ld bc,15616
    ld d,CASH_LABEL_Y
    ld e,CASH_LABEL_X
    call GetCharAddr
    ld de,cash_string
    call PrintStr

    ld d,SCORE_LABEL_Y
    ld e,SCORE_LABEL_X
    call GetCharAddr
    ld de,score_string
    call PrintStr

    ld d,LIVES_LABEL_Y
    ld e,LIVES_LABEL_X
    call GetCharAddr
    ld de,lives_string
    call PrintStr

    ld d,UI_SMART_BOMBS_LABEL_Y
    ld e,UI_SMART_BOMBS_LABEL_X
    call GetCharAddr
    ld de,ui_smart_bombs_string
    call PrintStr

    ld d,UI_SHIELD_LABEL_Y
    ld e,UI_SHIELD_LABEL_X
    call GetCharAddr
    ld de,shield_string
    call PrintStr

    ret

refresh_ui_numbers:
    ld bc,15616
    ld d,CASH_Y
    ld e,CASH_10000_X
    call GetCharAddr
    ld a,(cash_10000)
    add a,ASCII_ZERO
    call PrintChar

    ld d,CASH_Y
    ld e,CASH_1000_X
    call GetCharAddr
    ld a,(cash_1000)
    add a,ASCII_ZERO
    call PrintChar

    ld d,CASH_Y
    ld e,CASH_100_X
    call GetCharAddr
    ld a,(cash_100)
    add a,ASCII_ZERO
    call PrintChar

    ld d,CASH_Y
    ld e,CASH_10_X
    call GetCharAddr
    ld a,(cash_10)
    add a,ASCII_ZERO
    call PrintChar

    ld d,CASH_Y
    ld e,CASH_1_X
    call GetCharAddr
    ld a,(cash_1)
    add a,ASCII_ZERO
    call PrintChar

    ld d,CASH_Y
    ld e,CASH_1_X+1
    call GetCharAddr
    ld a,'M'
    call PrintChar

    ;;POINTS::

    ld d,SCORE_Y
    ld e,SCORE_100000_X
    call GetCharAddr
    ld a,(score_100000)
    add a,ASCII_ZERO
    call PrintChar

    ld d,SCORE_Y
    ld e,SCORE_10000_X
    call GetCharAddr
    ld a,(score_10000)
    add a,ASCII_ZERO
    call PrintChar

    ld d,SCORE_Y
    ld e,SCORE_1000_X
    call GetCharAddr
    ld a,(score_1000)
    add a,ASCII_ZERO
    call PrintChar

    ld d,SCORE_Y
    ld e,SCORE_100_X
    call GetCharAddr
    ld a,(score_100)
    add a,ASCII_ZERO
    call PrintChar

    ld d,SCORE_Y
    ld e,SCORE_10_X
    call GetCharAddr
    ld a,(score_10)
    add a,ASCII_ZERO
    call PrintChar

    ld d,SCORE_Y
    ld e,SCORE_1_X
    call GetCharAddr
    ld a,(score_1)
    add a,ASCII_ZERO
    call PrintChar

    ;LIVES

    ld d,LIVES_Y
    ld e,LIVES_1_X
    call GetCharAddr
    ld a,(lives_1)
    add a,ASCII_ZERO
    call PrintChar


    ;SMART BOMBS:

    ld d,UI_SMART_BOMBS_Y
    ld e,UI_SMART_BOMBS_1_X
    call GetCharAddr
    ld a,(player_smartbombs)
    add a,ASCII_ZERO
    call PrintChar


    ;SHIELDS:

    ld d,UI_SHIELD_Y
    ld e,UI_SHIELD_1_X
    call GetCharAddr
    ld a,(player_shields)
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












increment_cash1:
    ld a,(cash_1)
    inc a
    ld (cash_1),a 
    cp 9
    jp z, reset_cash_1
    
    ld d,CASH_Y
    ld e,CASH_1_X
    ld a,(cash_1)
    call draw_digit
    ret
reset_cash_1:
    call increment_cash10
    xor a
    ld (cash_1),a
    ld d,CASH_Y
    ld e,CASH_1_X
    ld a,(cash_1)
    call draw_digit
    ret

increment_cash10:
    ld a,(cash_10)
    cp 9
    jp nc,reset_cash10
    inc a
    ld (cash_10),a
    ld d,CASH_Y
    ld e,CASH_10_X
    ld a,(cash_10)
    call draw_digit
    ret

reset_cash10:
    call increment_cash100
    xor a
    ld (cash_10),a
    ld d,CASH_Y
    ld e,CASH_10_X
    ld a,(cash_10)
    call draw_digit
    
    ret

increment_cash100:
    ld a,(cash_100)
    cp 9
    jp z,reset_cash100
    inc a
    ld (cash_100),a
    ld d,CASH_Y
    ld e,CASH_100_X
    ld a,(cash_100)
    call draw_digit
    ret

reset_cash100:
    call increment_cash1000
    xor a
    ld (cash_100),a
    ld d,CASH_Y
    ld e,CASH_100_X
    ld a,(cash_100)
    call draw_digit
    
    ret

increment_cash1000:
    ld a,(cash_1000)
    cp 9
    jp z,reset_cash1000
    inc a
    ld (cash_1000),a
    ld d,CASH_Y
    ld e,CASH_1000_X
    ld a,(cash_1000)
    call draw_digit
    ret

reset_cash1000:
    call increment_cash10000
    xor a
    ld (cash_1000),a
    ld d,CASH_Y
    ld e,CASH_1000_X
    ld a,(cash_1000)
    call draw_digit
    
    ret

increment_cash10000:
    ld a,(cash_10000)
    cp 9
    ret z
    inc a
    ld (cash_10000),a
    ld d,CASH_Y
    ld e,CASH_10000_X
    ld a,(cash_10000)
    call draw_digit
    ret








decrement_cash100:
    ld a,(cash_100)
    cp 0
    jp z,dec_reset_cash100
    dec a
    ld (cash_100),a
    ld d,CASH_Y
    ld e,CASH_100_X
    ld a,(cash_100)
    call draw_digit
    ret

dec_reset_cash100:
    call decrement_cash1000
    ld a,9
    ld (cash_100),a
    ld d,CASH_Y
    ld e,CASH_100_X
    ld a,(cash_100)
    call draw_digit
    ret

decrement_cash1000:
    ld a,(cash_1000)
    cp 0
    jp z,dec_reset_cash1000
    dec a
    ld (cash_1000),a
    ld d,CASH_Y
    ld e,CASH_1000_X
    ld a,(cash_1000)
    call draw_digit
    ret

dec_reset_cash1000:
    call decrement_cash10000
    ld a,9
    ld (cash_1000),a
    ld d,CASH_Y
    ld e,CASH_1000_X
    ld a,(cash_1000)
    call draw_digit
    
    ret

decrement_cash10000:
    ld a,(cash_10000)
    cp 0
    ret z
    dec a
    ld (cash_10000),a
    ld d,CASH_Y
    ld e,CASH_10000_X
    ld a,(cash_10000)
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


  

increment_smartbombs:
    ld a,(cash_1000)
    cp UI_SMART_BOMB_PRICE
    call c,check_cash_10000
    ret z

    ld a,(player_smartbombs)
    cp PLAYER_MAX_SMARTBOMBS
    ret z
    inc a
    ld (player_smartbombs),a
    call decrement_cash1000

    ld d,UI_SMART_BOMBS_Y
    ld e,UI_SMART_BOMBS_1_X
    ld a,(player_smartbombs)
    call draw_digit
    ret

decrement_smartbombs:
    ld a,(player_smartbombs)
    cp 0
    ret z
    dec a
    ld (player_smartbombs),a

    ld d,UI_SMART_BOMBS_Y
    ld e,UI_SMART_BOMBS_1_X
    ld a,(player_smartbombs)
    call draw_digit
    ret


increment_lives:
    ld a,(cash_1000) ;todo change price
    cp UI_LIFE_PRICE
    call c,check_cash_10000
    ret z

    ld a,(lives_1)
    cp PLAYER_MAX_LIVES
    ret z
    inc a
    ld (lives_1),a
    call decrement_cash1000

    ld d,LIVES_Y
    ld e,LIVES_1_X
    ld a,(lives_1)
    call draw_digit
    ret

decrement_lives:
    ld a,(lives_1)
    cp 0
    ret z

    ld a,(lives_1)
    dec a
    ld (lives_1),a

    ld d,LIVES_Y
    ld e,LIVES_1_X
    ld a,(lives_1)
    call draw_digit
    ret

increment_shields:
    ld a,(cash_1000) ;todo change price
    cp UI_SHIELD_PRICE
    call c,check_cash_10000
    ret z
    ld a,(player_shields)
    cp PLAYER_MAX_SHEILDS
    ret z
    inc a
    ld (player_shields),a
    call decrement_cash1000 

    ld d,UI_SHIELD_Y
    ld e,UI_SHIELD_1_X
    ld a,(player_shields)
    call draw_digit
    ret

check_cash_10000:
    ld a,(cash_10000)
    cp 0
    ret
    


decrement_shields:
    ld a,(player_shields)
    cp 0
    ret z
    dec a
    ld (player_shields),a

    ld d,UI_SHIELD_Y
    ld e,UI_SHIELD_1_X
    ld a,(player_shields)
    call draw_digit
    ret

;;;; DATA ;;;;;;;;;;



cash_string db 'MONEY',0
CASH_LABEL_Y equ 1
CASH_LABEL_X equ 25
CASH_Y equ CASH_LABEL_Y+1
CASH_1_X equ 29
CASH_10_X equ 28
CASH_100_X equ 27
CASH_1000_X equ 26
CASH_10000_X equ 25


cash_1     db 0
cash_10    db 0
cash_100   db 0
cash_1000  db 0
cash_10000  db 0



SCORE_LABEL_Y equ 4
SCORE_LABEL_X equ 25
SCORE_Y equ SCORE_LABEL_Y+1


SCORE_1_X equ 30
SCORE_10_X equ 29
SCORE_100_X equ 28
SCORE_1000_X equ 27
SCORE_10000_X equ 26
SCORE_100000_X equ 25

score_string db 'SCORE',0

score_1     db 0
score_10    db 0
score_100   db 0
score_1000  db 0
score_10000  db 0
score_100000  db 0




LIVES_LABEL_Y equ 7
LIVES_LABEL_X equ 25
LIVES_Y equ LIVES_LABEL_Y+1
LIVES_1_X equ 29
UI_LIFE_PRICE equ 1 ;x1000

lives_string db 'LIVES',0
lives_1 db PLAYER_START_LIVES



UI_SMART_BOMBS_LABEL_Y equ 10
UI_SMART_BOMBS_LABEL_X equ 25
UI_SMART_BOMBS_Y equ UI_SMART_BOMBS_LABEL_Y+1
UI_SMART_BOMBS_1_X equ 29
ui_smart_bombs_string db 'NUKES',0
UI_SMART_BOMB_PRICE equ 1 ; x1000
player_smartbombs db 1
PLAYER_MAX_SMARTBOMBS equ 3
PLAYER_MAX_LIVES equ 9



shield_string db 'SHIELD',0
UI_SHIELD_LABEL_Y equ 13
UI_SHIELD_LABEL_X equ 25
UI_SHIELD_Y equ UI_SHIELD_LABEL_Y+1
UI_SHIELD_1_X equ 29
UI_SHIELD_PRICE equ 1 ;x1000
player_shields db 1
PLAYER_MAX_SHEILDS equ 3
































