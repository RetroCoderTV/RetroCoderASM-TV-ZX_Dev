GAME_WINDOW_START equ 0x8000
GAME_WINDOW_LENGTH equ 0xC00
GAME_WINDOW_WIDTH equ 24
BUFFER_CHUNK_LENGTH equ 12
SEG_SIZE equ 0x600

; VMEM_SEG_0 equ 0x4000
VMEM_SEG_1 equ 0x4000
VMEM_SEG_2 equ 0x4800

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

;written for window 24x16 cells.
;each scanline is drawn in two 'chunks' starting at left of screen.
;moves the 'game window' back buffer, into the 'screen memory' front buffer (ie. draws it on screen)
drawgamewindow:
    ld (stack_ptr),sp ;cache correct stack_ptr

    ;SEG1

    ;Char Row 0

    ;Scanline 0
    ;1/2
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*0)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*1)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*2)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*3)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*4)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*5)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*6)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*7)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*8)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*9)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*10)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*11)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*12)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*13)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*14)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*15)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*16)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*17)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*18)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*19)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*20)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*21)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*22)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*23)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*24)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*25)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*26)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*27)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*28)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*29)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*30)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*31)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*32)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*33)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*34)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*35)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*36)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*37)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*38)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*39)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*40)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*41)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*42)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*43)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*44)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*45)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*46)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*47)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*48)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*49)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*50)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*51)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*52)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*53)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*54)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*55)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*56)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*57)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*58)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*59)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*60)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*61)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*62)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*63)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*64)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*65)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*66)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*67)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*68)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*69)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*70)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*71)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*72)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*73)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*74)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*75)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*76)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*77)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*78)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*79)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*80)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*81)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*82)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*83)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*84)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*85)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*86)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*87)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*88)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*89)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*90)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*91)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*92)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*93)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*94)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*95)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*96)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*97)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*98)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*99)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*100)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*101)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*102)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*103)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*104)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*105)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*106)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*107)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*108)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*109)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*110)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*111)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*112)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*113)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*114)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*115)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*116)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*117)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*118)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*119)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*120)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*121)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*122)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*123)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*124)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*125)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*126)
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
    ld sp,GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*127)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*0)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*1)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*2)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*3)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*4)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*5)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*6)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*7)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*8)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*9)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*10)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*11)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*12)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*13)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*14)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*15)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*16)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*17)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*18)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*19)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*20)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*21)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*22)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*23)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*24)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*25)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*26)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*27)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*28)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*29)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*30)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*31)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*32)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*33)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*34)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*35)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*36)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*37)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*38)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*39)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*40)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*41)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*42)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*43)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*44)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*45)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*46)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*47)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*48)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*49)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*50)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*51)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*52)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*53)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*54)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*55)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*56)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*57)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*58)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*59)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*60)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*61)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*62)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*63)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*64)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*65)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*66)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*67)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*68)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*59)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*70)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*71)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*72)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*73)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*74)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*75)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*76)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*77)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*78)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*79)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*80)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*81)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*82)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*83)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*84)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*85)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*86)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*87)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*88)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*89)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*90)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*91)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*92)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*93)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*94)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*95)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*96)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*97)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*98)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*99)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*100)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*101)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*102)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*103)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*104)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*105)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*106)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*107)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*108)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*109)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*110)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*111)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*112)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*113)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*114)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*115)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*116)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*117)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*118)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*119)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*120)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*121)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*122)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*123)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*124)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*125)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*126)
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
    ld sp,SEG_SIZE+GAME_WINDOW_START+(BUFFER_CHUNK_LENGTH*127)
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
    ret