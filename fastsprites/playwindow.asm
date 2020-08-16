


;game area is to be: 16x8 characters only
playwindow_draw:
    ld (stack_ptr),sp
    ;SEG1 (only this seg needed)

    ;Char Row 0

    ;Line 0
    ld sp,PLAY_WINDOW_START
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy
    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*1)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*2)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*3)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*4)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*5)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*6)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*7)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 1

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*8)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*9)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*10)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*11)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*12)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*13)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*14)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*15)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 2

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*16)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*17)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*18)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*19)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*20)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*21)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*22)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*23)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 3

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*24)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*25)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*26)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*27)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*28)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*29)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*30)
    pop af
    pop bc
    pop de
    pop hl
    pop ix
    pop iy

    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*31)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    
    ;Char Row 4

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*32)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*33)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*34)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*35)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*36)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*37)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*38)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*39)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 5

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*40)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*41)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*42)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*43)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*44)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*45)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*46)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*47)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 6

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*48)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*49)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*50)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*51)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*52)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*53)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*54)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*55)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    
    ;Char Row 7

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*56)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*57)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*58)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*59)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*60)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*61)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*62)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*63)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af
























;SEG2 (only this seg needed)

    ;Char Row 0

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*64)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*65)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*66)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*67)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*68)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*69)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*70)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*71)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 1

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*72)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*73)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*74)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*75)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*76)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*77)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*78)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*79)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 2

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*80)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*81)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*82)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*83)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*84)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*85)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*86)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*87)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 3

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*88)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*89)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*90)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*91)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*92)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*93)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*94)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*95)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    
    ;Char Row 4

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*96)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*97)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*98)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*99)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*100)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*101)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*102)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*103)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 5

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*104)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*105)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*106)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*107)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*108)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*109)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*110)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*111)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    ;Char Row 6

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*112)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*113)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*114)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*115)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*116)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*117)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*118)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*119)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af

    
    ;Char Row 7

    ;Line 0
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*120)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*121)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L1

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*122)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L2

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*123)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L3

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*124)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L4

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*125)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L5

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*126)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L6

    push iy
    push ix
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(WINDOW_WIDTH*127)
    pop af
    pop bc
    pop de
    pop hl 
    pop ix
    pop iy 
 
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_2+WINDOW_WIDTH+L7

    push iy
    push ix
    push hl
    push de
    push bc
    push af


    ld sp,(stack_ptr)
    ret


stack_ptr dw 0