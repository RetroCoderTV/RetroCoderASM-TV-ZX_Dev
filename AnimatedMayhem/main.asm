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

    call 0xDAF

main 
    halt
    ld ix,playerdata
    call deletesprite

    ld bc,65022 ;ASDFG port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    push af
    call nc, moveleft ;TODO: create function for this
    pop af
    rra 
    ;push af
    ;call nc, movedown
    ;pop af
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
    



    ld a,(directionx)
    cp 0
    call z,play_anim_left
    ld a,(directionx)
    cp 1
    call z,play_anim_right
    

    ld ix,playerdata ;IX=data pointer (memory address)
    ld hl,player ;HL= sprite data
    ld a,(currentframe)
    add a,a ;x2
    add a,a ;
    add a,a ;
    add a,a ;
    add a,a ;x32
    ld d,0
    ld e,a
    add hl,de
    call drawsprite


    jp main
    

    

moveleft:
    xor a
    ld (directionx),a ;set correct direction value

    ld a,(ix+1)
    sub PLAYER_SPEED
    ld (ix+1),a

    ret


moveright:
    ld a,1
    ld (directionx),a ;set correct direction value

    ld a,(ix+1)
    add a,PLAYER_SPEED
    ld (ix+1),a

    ret



play_anim_right:
    ld a,(animtimer)
    inc a
    ld (animtimer),a ;inc timer
    cp ANIM_FRAME_LENGTH ;compare timer with FRAME LENGTH
    call nc, go_next_frame_right
    ret

go_next_frame_right:
    xor a
    ld (animtimer),a ;reset timer
    ld a,(currentframe)
    cp FRAMES_PER_STATE
    push af
    call nc, resetframe_right
    pop af
    ret nc
    inc a
    ld (currentframe),a
    ret

resetframe_right:
    xor a
    ld (currentframe),a
    ret

play_anim_left:
    ld a,(animtimer)
    inc a
    ld (animtimer),a ;inc timer
    cp ANIM_FRAME_LENGTH ;compare timer with FRAME LENGTH
    call nc, go_next_frame_left
    ret

go_next_frame_left:
    xor a
    ld (animtimer),a ;reset timer
    ld a,(currentframe)
    cp LEFT_FRAMES_BEGIN+FRAMES_PER_STATE
    push af
    call nc, resetframe_left
    pop af
    ret nc
    inc a
    ld (currentframe),a
    ret

resetframe_left:
    ld a,3
    ld (currentframe),a
    ret
; Here are some general rules on using CP
; Unsigned

; If A == N, then Z flag is set.
; If A != N, then Z flag is reset.
; If A < N, then C flag is set.
; If A >= N, then C flag is reset.
;;;;;; DATA ;;;;;;;;;;;;


;data format:
;isAlive,x,y,sizex (cells),sizey (lines)
playerdata:
    db 1,(255/2)-8,170,2,16

PLAYER_SPEED equ 2

directionx db 1 ;0=left 1=right
currentframe db 0
animtimer db 0
ANIM_FRAME_LENGTH equ 8
FRAMES_PER_STATE equ 2
LEFT_FRAMES_BEGIN equ 3

    include 'util\tools.asm'
    include 'util\screentools.asm'
    include 'util\spritetools.asm'
    include 'util\soundtools.asm'
    include 'bitmaps\bitmaps.asm'

    end ENTRY_POINT