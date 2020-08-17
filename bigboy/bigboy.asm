ENTRY_POINT equ 0x8c1f

    org ENTRY_POINT

    ld a,3
    call 0x229B ; Border = A
    call 0xDAF ;clear screen

main:

    jp main


    end ENTRY_POINT