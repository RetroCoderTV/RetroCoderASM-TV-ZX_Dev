instructions_start:
    call 0xDAF

    ld b,INSTRUCTIONS_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes

    ld bc,15616
    ld d,0
    ld e,10
    call GetCharAddr
    ld de,instructions_title_string
    call PrintStr

    ld d,3
    ld e,8
    call GetCharAddr
    ld de,instructions_onfoot1
    call PrintStr

    ld d,4
    ld e,6
    call GetCharAddr
    ld de,instructions_onfoot2
    call PrintStr

    ld d,5
    ld e,6
    call GetCharAddr
    ld de,instructions_onfoot3
    call PrintStr

    ld d,6
    ld e,6
    call GetCharAddr
    ld de,instructions_onfoot4
    call PrintStr

    ld d,7
    ld e,6
    call GetCharAddr
    ld de,instructions_onfoot5
    call PrintStr

    ld d,9
    ld e,8
    call GetCharAddr
    ld de,instructions_skiing1
    call PrintStr

    ld d,10
    ld e,6
    call GetCharAddr
    ld de,instructions_skiing2
    call PrintStr

    ld d,11
    ld e,6
    call GetCharAddr
    ld de,instructions_skiing3
    call PrintStr

    ld d,12
    ld e,6
    call GetCharAddr
    ld de,instructions_skiing4
    call PrintStr

    ld d,14
    ld e,6
    call GetCharAddr
    ld de,instructions_all1
    call PrintStr

    ld d,22
    ld e,1
    call GetCharAddr
    ld de,instructions_quit
    call PrintStr

    jp instructions_main


instructions_main:
    call check_keys


    ld a,(keypressed_Q)
    cp TRUE
    jp z,begin_level_0


    jp instructions_main


instructions_title_string db 'INSTRUCTIONS:',0
instructions_onfoot1 db 'ON FOOT:',0
instructions_onfoot2 db 'W - Up',0
instructions_onfoot3 db 'S - Down',0
instructions_onfoot4 db 'A - Left',0
instructions_onfoot5 db 'D - Right',0

instructions_skiing1 db 'SKIING:',0
instructions_skiing2 db 'S - Start skiing',0
instructions_skiing3 db 'A - Steer left',0
instructions_skiing4 db 'D - Steer right',0


instructions_all1 db 'F - Respawn',0
instructions_quit db 'Q - Back to menu',0
