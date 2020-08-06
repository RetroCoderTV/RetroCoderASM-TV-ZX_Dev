keypress_checker:
    ld bc,65022 ;ASDFG port
    in a,(c) ;reads port in (c)
    rra ;rotate right, bit0 into carry
    push af
    call nc, keypressed_A ;TODO: create function for this
    pop af
    rra 
    push af
    call nc, keypressed_S
    pop af
    rra 
    push af
    call nc, keypressed_D
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
    call nc, keypressed_W
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