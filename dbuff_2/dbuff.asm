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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16 ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80
    pop af
    pop bc
    pop de
    pop hl
    exx
ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112
    pop af
    pop bc
    pop de
    pop hl
    exx
ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144
    pop af
    pop bc
    pop de
    pop hl
    exx
ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG1+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16 ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224 ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16 ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32 ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+BUFFER_MOVE_CHAR_DOWN ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+BUFFER_MOVE_CHAR_DOWN
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+SPECTRUM_MOVE_CHAR_DOWN ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*2) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*2)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*2) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*3) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*3)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*3) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*4) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*4)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*4) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*5) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*5)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*5) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*6) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*6)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*6) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
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
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)(sp is decrement by 2 for each 2byte pushed)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 0 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+16+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+32+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 1 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+48+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P1+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+64+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 2 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+80+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P2+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+96+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 3 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+112+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P3+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+128+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 4 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+144+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P4+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+160+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 5 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+176+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P5+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+192+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 6 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+208+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P6+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /a
    ld sp,SEGSIZE+SCREEN_BUFFER_START+224+(BUFFER_MOVE_CHAR_DOWN*7) ; start of buffer line.
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+16+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line. (it works backwards from stacking order)
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af
    ;line 7 /b
    ld sp,SEGSIZE+SCREEN_BUFFER_START+240+(BUFFER_MOVE_CHAR_DOWN*7)
    pop af
    pop bc
    pop de
    pop hl
    exx
    ex af,af'
    pop af
    pop bc
    pop de
    pop hl
    ld sp,PLAYAREA_SEG2+P7+32+(SPECTRUM_MOVE_CHAR_DOWN*7) ; end of screen line.
    push hl
    push de
    push bc
    push af
    exx
    ex af,af'
    push hl
    push de
    push bc
    push af






    ld sp,(stack_ptr) ; restore stack pointer.
    ret





