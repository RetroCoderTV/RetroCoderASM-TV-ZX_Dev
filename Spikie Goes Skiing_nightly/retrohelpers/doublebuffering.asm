GAME_WINDOW_START equ 0x8000
GAME_WINDOW_LENGTH equ 0x1500
GAME_WINDOW_END_UB equ 0x95
GAME_WINDOW_WIDTH equ 24
GAME_WINDOW_HEIGHT equ 24

BUFFER_SIDE_EXTRA equ 2

BUFFER_WINDOW_WIDTH equ GAME_WINDOW_WIDTH+(BUFFER_SIDE_EXTRA*2)

BUFFER_MIDDLE equ BUFFER_WINDOW_WIDTH/2


BUFFER_CHUNK_LENGTH equ 12
SEG_SIZE equ 0x700

VMEM_SEG_0 equ 0x4000
VMEM_SEG_1 equ 0x4800
VMEM_SEG_2 equ 0x5000
SCREEN_WIDTH equ 32

VMEM_START equ 0x4000
VMEM_END_UB equ 0x58

;line down offsets
L1 equ 0x100
L2 equ 0x200
L3 equ 0x300
L4 equ 0x400
L5 equ 0x500
L6 equ 0x600
L7 equ 0x700
;char down offsets
C1 equ 0x20
C2 equ 0x40
C3 equ 0x60
C4 equ 0x80
C5 equ 0xA0
C6 equ 0xC0
C7 equ 0xE0

stack_ptr dw 0

ready db FALSE 
cleargamewindow:
    ld a,FALSE
    ld (ready),a

    ld hl,GAME_WINDOW_START
    call clr_window
    ret



clr_window:
    
    ld a,h
    cp GAME_WINDOW_END_UB
    jp z,clr_window_end
    xor a
    ld (hl),a
    inc hl
    jp clr_window
clr_window_end:
    ld a,TRUE
    ld (ready),a
    ret








;written for window 24x24 cells.
;each scanline is drawn in two 'chunks' starting at left of screen.
;moves the 'game window' back buffer, into the 'screen memory' front buffer (ie. draws it on screen)
drawgamewindow:
    ld a,FALSE
    ld (ready),a

    ld (stack_ptr),sp ;cache correct stack_ptr

    ;SEG0

    ;Char Row 0

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*0)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*1)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*2)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*3)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*4)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*5)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*6)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*7)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*8)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*9)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*10)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*11)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*12)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*13)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*14)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*15)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    



    ;Char Row 1

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*16)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*17)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*18)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*19)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*20)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*21)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*22)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*23)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*24)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*25)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*26)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*27)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*28)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*29)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*30)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C1+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*31)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C1+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
        



    ;Char Row 2

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*32)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*33)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*34)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*35)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*36)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*37)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*38)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*39)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*40)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*41)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*42)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*43)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*44)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*45)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*46)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C2+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*47)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C2+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 3

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*48)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*49)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*50)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*51)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*52)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*53)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*54)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*55)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*56)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*57)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*58)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*59)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*60)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*61)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*62)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C3+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*63)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C3+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af




    ;Char Row 4

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*64)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*65)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*66)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*67)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*68)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*69)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*70)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*71)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*72)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*73)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*74)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*75)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*76)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*77)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*78)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C4+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*79)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C4+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af





    ;Char Row 5

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*80)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*81)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*82)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*83)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*84)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*85)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*86)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*87)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*88)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*89)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*90)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*91)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*92)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*93)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*94)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C5+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*95)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C5+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 6

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*96)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*97)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*98)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*99)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*100)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*101)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*102)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*103)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*104)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*105)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*106)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*107)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*108)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*109)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*110)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C6+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*111)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C6+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 7

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*112)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*113)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*114)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*115)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*116)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*117)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*118)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*119)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*120)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*121)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*122)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*123)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*124)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*125)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+GAME_WINDOW_START+(BUFFER_MIDDLE*126)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C7+VMEM_SEG_0+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,GAME_WINDOW_START+(BUFFER_MIDDLE*127)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C7+VMEM_SEG_0+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



































    ;SEG1

    ;Char Row 0

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*0)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*1)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*2)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*3)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*4)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*5)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*6)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*7)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*8)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*9)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*10)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*11)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*12)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*13)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*14)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*15)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    



    ;Char Row 1

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*16)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*17)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*18)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*19)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*20)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*21)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*22)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*23)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*24)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*25)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*26)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*27)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*28)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*29)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*30)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C1+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*31)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C1+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
        



    ;Char Row 2

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*32)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*33)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*34)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*35)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*36)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*37)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*38)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*39)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*40)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*41)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*42)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*43)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*44)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*45)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*46)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C2+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*47)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C2+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 3

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*48)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*49)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*50)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*51)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*52)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*53)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*54)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*55)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*56)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*57)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*58)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*59)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*60)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*61)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*62)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C3+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*63)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C3+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af




    ;Char Row 4

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*64)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*65)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*66)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*67)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*68)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*69)  
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*70)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*71)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*72)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*73)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*74)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*75)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*76)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*77)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*78)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C4+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*79)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C4+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af





    ;Char Row 5

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*80)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*81)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*82)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*83)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*84)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*85)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*86)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*87)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*88)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*89)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*90)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*91)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*92)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*93)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*94)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C5+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*95)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C5+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 6

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*96)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*97)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*98)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*99)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*100)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*101)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*102)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*103)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*104)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*105)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*106)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*107)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*108)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*109)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*110)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C6+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*111)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C6+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 7

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*112)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*113)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*114)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*115)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*116)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*117)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*118)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*119)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*120)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*121)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*122)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*123)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*124)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*125)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*126)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C7+VMEM_SEG_1+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*127)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C7+VMEM_SEG_1+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af





































    ;SEG2

    ;Char Row 0

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*0)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*1)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*2)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*3)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*4)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*5)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*6)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*7)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*8)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*9)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*10)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*11)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*12)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*13)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*14)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*15)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    



    ;Char Row 1

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*16)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*17)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*18)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*19)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*20)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*21)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*22)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*23)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*24)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*25)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*26)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*27)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*28)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*29)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*30)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C1+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*31)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C1+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
        



    ;Char Row 2

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*32)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*33)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*34)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*35)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*36)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*37)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*38)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*39)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*40)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*41)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*42)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*43)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*44)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*45)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*46)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C2+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*47)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C2+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 3

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*48)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*49)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*50)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*51)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*52)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*53)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*54)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*55)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*56)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*57)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*58)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*59)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*60)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*61)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*62)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C3+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*63)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C3+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af




    ;Char Row 4

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*64)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*65)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*66)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*67)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*68)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*69)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*70)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*71)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*72)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*73)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*74)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*75)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*76)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*77)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*78)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C4+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*79)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C4+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af





    ;Char Row 5

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*80)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*81)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*82)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*83)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*84)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*85)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*86)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*87)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*88)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*89)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*90)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*91)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*92)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*93)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*94)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C5+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*95)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C5+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 6

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*96)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*97)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*98)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*99)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*100)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*101)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*102)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*103)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*104)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*105)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*106)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*107)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*108)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*109)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*110)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C6+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*111)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C6+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af



    ;Char Row 7

    ;Scanline 0
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*112)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*113)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 1
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*114)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*115)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L1+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 2
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*116)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*117)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L2+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 3
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*118)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*119)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L3+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 4
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*120)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*121)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L4+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 5
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*122)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*123)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L5+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 6
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*124)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*125)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L6+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Scanline 7
    ;1/2
    ld sp,BUFFER_SIDE_EXTRA+SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*126)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C7+VMEM_SEG_2+BUFFER_CHUNK_LENGTH
    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;2/2
    ld sp,SEG_SIZE+SEG_SIZE+GAME_WINDOW_START+(BUFFER_MIDDLE*127)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,L7+C7+VMEM_SEG_2+(BUFFER_CHUNK_LENGTH*2)
    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ld sp,(stack_ptr)

    

    ld a,TRUE
    ld (ready),a
    ret