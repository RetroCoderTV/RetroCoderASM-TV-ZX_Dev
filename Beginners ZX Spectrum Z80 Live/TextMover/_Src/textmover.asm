;Keyboard ports:
;INPUT PORTS:
;32766 B, N, M, Symbol Shift, Space
;49150 H, J, K, L, Enter
;57342 Y, U, I, O, P
;61438 6, 7, 8, 9, 0 (*1) *Joystick
;63486 5, 4, 3, 2, 1 (*2) 
;64510 T, R, E, W, Q
;65022 G, F, D, S, A
;65278 V, C, X, Z, Caps Shift
;
; 
;
ENTRY_POINT equ 32768

    org ENTRY_POINT

    call 0xdaf ;ROM routine of Spectrum clears screen and opens channel 2
    ld hl,udg ;HL=pointer at our first UDG
    ld (23675),hl ;change pointer in 23675 to point to our first UDG

    ld a, ATTR_BLUE_INK_YELLOW_PAPER
    ld (23693),a ;poke that value into the screen colour attributes memory address
    call 0xdaf ;cls

    ; call makesound_gsharp_0_25

    ; ld b, 50 ;50 frames = 1 sec for delay
    ; call waitloop ;do the delay

    ; call makesound_csharp_0_25
    ; call makesound_gsharp_0_5

    ld ix,ninjastarsdata
    ld a,(b_stars_initialized)
    cp 0
    call z,spawnstars
    
main:
    halt ;locks us at 50fps, waits for interrupt      

    ld de,(xpos) ;DE=xpos,ypos
    call setposition
    call deletesprite

    halt
    ld bc,65022 ;ASDFG port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    push af
    call nc, moveleft ;TODO: create function for this
    pop af
    rra 
    push af
    call nc, movedown
    pop af
    rra 
    push af
    call nc, moveright
    pop af
    ;rra 
    ;push af
    ;call nc, F Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, G Pressed
    ;pop af

    ld bc,64510 ;QWERT port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    ;push af
    ;call nc, Q Pressed
    ;pop af
    rra 
    push af
    call nc, moveup
    pop af
    ;rra 
    ;push af
    ;call nc, E Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, R Pressed
    ;pop af
    ;rra 
    ;push af
    ;call nc, T Pressed
    ;pop af

    ld ix,ninjastarsdata
    call deletestars

    ld ix,ninjastarsdata
    call updatestars
  
    halt
    ld de,(xpos) ;DE=xpos,ypos
    call setposition
    call displaysprite
   
    
    
  

    ld ix,ninjastarsdata
    call drawstars

    ; ld de,(score_xpos)
    ; call setposition
    ; ld bc,(score) ;BC = score value
    ; call 0x1a1b ;built in routine, prints integer <= 9999

    jp main ;loop forever

;IX=stars data pointer
spawnstars:
    ld a,(ix)
    cp 255
    jp z,end_spawnstars
    call getrandom
    and %00011111 ;0-31 screen width
    ld (ix+2),a
    call getrandom
    and %00001111 ;0-15 of screen height (udg only allowed 0-21 max)
    ld (ix+1),a
    ld de,NINJA_STARS_DATA_LENGTH
    add ix,de
    jp spawnstars
end_spawnstars:
    ld a,1
    ld (b_stars_initialized),a
    ret


;

;IX=stars data pointer
deletestars:
    ld a,(ix)
    cp 255 ;check for end of array signal 255
    ret z ;return if end of array
    ld d,(ix+1)
    ld e,(ix+2)
    call setposition
    call deletesprite
    ld de,NINJA_STARS_DATA_LENGTH
    add ix,de ;increment pointer by data length
    jp deletestars

;IX=stars data pointer
updatestars:
    ld a,(ix)
    cp 255
    ret z
    ld a,(ix)
    cp 0
    jp z,gonext_updatestars
    ;this star is alive...
    call checkcollision_star_player
gonext_updatestars:
    ld de,NINJA_STARS_DATA_LENGTH
    add ix,de
    jp updatestars

checkcollision_star_player:
    ld a,(xpos)
    cp (ix+2)
    ret nz
    ld a,(ypos)
    cp (ix+1)
    ret nz
    ;if here, we have collision...
    ld (ix),0
    ld de,(xpos)
    call setposition
    call deletesprite
    ret

;IX=stars data pointer
drawstars:
    ld a,(ix)
    cp 255
    ret z
    ld a,(ix)
    cp 0
    jp z,drawstars_gonext
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call setposition
    ld a,(ninjastarsprite)
    rst 16
drawstars_gonext:
    ld de,NINJA_STARS_DATA_LENGTH
    add ix,de
    jp drawstars


displaysprite:
    ld a,(playersprite)
    rst 16
    ret

deletesprite:
    ld a,ASCII_SPACE
    rst 16
    ret

;INPUTS
;DE=desired xy
setposition:
    ld a,ASCII_AT
    rst 16
    ld a,d
    rst 16
    ld a,e
    rst 16
    ret

moveleft:
    ld a,(xpos)
    cp 0
    ret z
    ld a,(xpos) ;TODO: is this needed?
    dec a
    ld (xpos),a
    ret
moveright:
    ld a,(xpos)
    cp MAXIMUM_X
    ret nc
    ld a,(xpos) ;TODO: is needed?
    inc a
    ld (xpos),a
    ret
moveup:
    ld a,(ypos)
    cp 0
    ret z
    ld a,(ypos)
    dec a
    ld (ypos),a
    ret
movedown:
    ld a,(ypos)
    cp MAXIMUM_Y
    ret z
    ld a,(ypos)
    inc a
    ld (ypos),a
    ret


;creates a pause. B=frames delayed
;INPUTS:
;B=frames of delay
waitloop:
    halt
    djnz waitloop
    ret

;returns with random number betweem 0-255 in A
getrandom:
    ld hl,(seed)
    ld a,h 
    and %00011111 ;and 31
    ld h,a
    ld a,(hl)
    inc hl
    ld (seed),hl
    ret





;;;;;;;;; DATA /VARIABLES (maybe) ;;;;;;;;;;;;;;;;;;

seed dw 0

score dw 1234
score_ypos db 0
score_xpos db 0

xpos db 0
ypos db 0



playersprite db 0x91
ninjastarsprite db 0x92

;data format:
;byte0=0=not alive, 1=alive
;byte1=ypos
;byte2=xpos
ninjastarsdata:
    db 1,0,0
    db 1,0,0
    db 1,0,0
    db 1,0,0
    db 1,0,0
    db 255
NINJA_STARS_DATA_LENGTH equ 3
b_stars_initialized db 0

include "constants.asm"
include "sprites\udgs.asm"
include "soundmaker.asm"

    end ENTRY_POINT