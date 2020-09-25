;Shop.
;sells the following:
;Nukes
;Life
;Forcefield
;Apple
;Flowers



shop_title_string db 'WELCOME TO KWIK-E-MOON',0
SHOP_TITLE_X equ 1
SHOP_TITLE_Y equ 1
exit_string db 'EXIT',0


;smartbomb string is stored in UI.asm
SHOP_ITEMS_LABEL_X equ 10
SHOP_NUKES_LABEL_Y equ 5
SHOP_LIFE_LABEL_Y equ 6
SHOP_SHIELD_LABEL_Y equ 7
SHOP_EXIT_LABEL_Y equ 10



SELECTOR equ '*'
SELECTOR_X equ 8
selector_y db SHOP_NUKES_LABEL_Y



shopmenu_start:
    ;print labels...
    ld bc,15616
    ld d,SHOP_TITLE_Y
    ld e,SHOP_TITLE_X
    call GetCharAddr
    ld de,shop_title_string
    call PrintStr

    ld d,SHOP_NUKES_LABEL_Y
    ld e,SHOP_ITEMS_LABEL_X
    call GetCharAddr
    ld de,ui_smart_bombs_string
    call PrintStr

    ld d,SHOP_LIFE_LABEL_Y
    ld e,SHOP_ITEMS_LABEL_X
    call GetCharAddr
    ld de, lives_string
    call PrintStr

    ld d,SHOP_SHIELD_LABEL_Y
    ld e,SHOP_ITEMS_LABEL_X
    call GetCharAddr
    ld de, shield_string
    call PrintStr

    ld d,SHOP_EXIT_LABEL_Y
    ld e,SHOP_ITEMS_LABEL_X
    call GetCharAddr
    ld de,exit_string
    call PrintStr


    ret


shopmenu_update:
    call check_keys


    ld bc,15616
    ld a,(selector_y)
    ld d,a
    ld e,SELECTOR_X
    call GetCharAddr
    ld a,SELECTOR
    call PrintChar


    ld a,(keypressed_Q)
    cp TRUE
    call z,move_selector_up
    ld a,(keypressed_A)
    cp TRUE
    call z,move_selector_down


    ld a,(keypressed_Space)
    cp TRUE
    call z,try_selection


    jp shopmenu_update    


move_selector_up:
    ld a,(keypressed_Q_Held)
    cp TRUE
    ret z

    ld a,(selector_y)
    cp SHOP_NUKES_LABEL_Y+1 ;first item in shop
    ret c

    ;delete char before moving 
    ld bc,15616
    ld a,(selector_y)
    ld d,a
    ld e,SELECTOR_X
    call GetCharAddr
    ld a,' '
    call PrintChar

    ld a,(selector_y)
    dec a
    ld (selector_y),a
    
    ret


move_selector_down:
    ld a,(keypressed_A_Held)
    cp TRUE
    ret z

    ld a,(selector_y)
    cp SHOP_EXIT_LABEL_Y; bottom of list
    ret nc

    ;delete char before moving down
    ld bc,15616
    ld a,(selector_y)
    ld d,a
    ld e,SELECTOR_X
    call GetCharAddr
    ld a,' '
    call PrintChar

    ld a,(selector_y)
    inc a
    ld (selector_y),a

    ret




try_selection:
    ld a,(keypressed_Space_Held)
    cp TRUE
    ret z

    call sound_GSharp_0_05
    
    ld a,(selector_y)
    cp SHOP_NUKES_LABEL_Y
    push af
    call z, increment_smartbombs
    pop af
    cp SHOP_LIFE_LABEL_Y
    push af
    call z, increment_lives
    pop af
    cp SHOP_SHIELD_LABEL_Y
    push af
    call z, increment_shields
    pop af
    cp SHOP_EXIT_LABEL_Y
    call z, shop_goto_next_level
    ret

shop_goto_next_level:
    ld a,(current_level)
    cp 1
    jp z,begin_level_2

    