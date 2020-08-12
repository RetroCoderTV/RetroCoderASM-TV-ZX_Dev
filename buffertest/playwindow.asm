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
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+PLAY_WINDOW_WIDTH
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af

    ;Char Row 1

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*8)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*9)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*10)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*11)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*12)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*13)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*14)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*15)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C1+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af

    ;Char Row 2

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*16)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*17)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*18)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*19)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*20)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*21)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*22)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*23)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C2+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af

    ;Char Row 3

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*24)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*25)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*26)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*27)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*28)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*29)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*30)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*31)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C3+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    
    ;Char Row 4

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*32)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*33)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*34)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*35)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*36)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*37)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*38)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*40)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C4+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af

    ;Char Row 5

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*41)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*42)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*43)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*44)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*45)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*46)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*47)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*48)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C5+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af

    ;Char Row 6

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*49)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*50)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*51)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*52)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*53)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*54)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*55)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*56)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C6+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af

    
    ;Char Row 7

    ;Line 0
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*57)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 1
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*58)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L1
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 2
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*59)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L2
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 3
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*60)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L3
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 4
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*61)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L4
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 5
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*62)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L5
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 6
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*63)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L6
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;Line 7
    ld sp,PLAY_WINDOW_START+(PLAY_WINDOW_WIDTH*64)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop af
    pop bc
    pop de
    pop hl
    ld sp,C7+MARGIN_SIZE+VMEM_SEG_1+PLAY_WINDOW_WIDTH+L7
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af


    ld sp,(stack_ptr)
    ret


stack_ptr dw 0