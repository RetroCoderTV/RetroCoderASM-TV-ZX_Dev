;monolithic routine used to move screen pixels from a buffer to the physical screen memory
;specific to having a play area having width of the whole screen and height 2/3 of screen.
movebuffertoscreen: 
    ld (stack_ptr),sp ; store stack pointer.
    ;starts from Character line 8 (lines 0-7 are for UI bar). SEG1=lines 8-15 ; SEG2=lines 16-23
    ;
    ;
    ;
    ;SEG1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Character Line 0:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14 ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af

    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28 ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 1:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+BUFFER_MOVE_CHAR_DOWN ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 2:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 3:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 4:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 5:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 6:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af 

    ;Character Line 7:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af 







































;  ;;; SEG2:

;Character Line 0:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14 ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28 ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 1:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+BUFFER_MOVE_CHAR_DOWN ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 2:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 3:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.


    ;Character Line 4:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 5:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af ;character line finally completes here.

    ;Character Line 6:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af 

    ;Character Line 7:
    ;line 0 /a (its split into 2 halves because not enough registers for a 32 byte line)
    ld sp,SEGSIZE+SCREEN_BUFFER_START+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line. (sp is increment by 2 for each 2byte popped)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+14+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+28+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+42+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+56+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+70+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+84+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+98+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+126+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+140+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+154+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+168+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+182+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+196+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+14+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+210+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ;pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+28+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    ;push af
    exx
    push hl
    push de
    push bc
    push af 






    ld sp,(stack_ptr) ; restore stack pointer.
    ret




