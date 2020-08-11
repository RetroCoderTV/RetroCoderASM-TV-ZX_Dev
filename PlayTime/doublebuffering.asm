

movebuffertoscreen:
    ld (stack_ptr),sp
    
  ;;;;;;CHAR LINE 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;CHAR LINE 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;CHAR LINE 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;CHAR LINE 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Scanline 0 /a
    ld sp,PLAYAREA_BUFFER_START
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 0 /b
    ld sp,PLAYAREA_BUFFER_START+HALFLINE
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 1 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P1
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 1 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P1
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 2 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P2
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 2 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P2
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 3 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P3
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 3 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P3
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 4 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*8)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P4
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 4 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*9)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P4
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 5 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*10)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P5
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 5 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*11)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P5
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 6 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*12)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P6
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 6 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*13)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P6
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 7 /a
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*14)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+HALFLINE+P7
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af
    ;Scanline 7 /b
    ld sp,PLAYAREA_BUFFER_START+(HALFLINE*15)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+ENDLINE+P7
    push hl
    push de
    push bc
    exx
    pop hl
    pop de
    pop bc
    pop af

    ld sp,(stack_ptr)
    ret

stack_ptr dw 0
