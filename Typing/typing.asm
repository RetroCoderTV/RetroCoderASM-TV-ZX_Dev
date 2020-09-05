ENTRY_POINT equ 0x8000

    org ENTRY_POINT


    ld a,3
    call 0x229B
    call 0xDAF


main:
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,1
    rst 16
    ld a,(score_10000000)
    add a,ASCII_ZERO
    rst 16
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,2
    rst 16
    ld a,(score_1000000)
    add a,ASCII_ZERO
    rst 16
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,3
    rst 16
    ld a,(score_100000)
    add a,ASCII_ZERO
    rst 16

    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,4
    rst 16
    ld a,(score_10000)
    add a,ASCII_ZERO
    rst 16
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,5
    rst 16
    ld a,(score_1000)
    add a,ASCII_ZERO
    rst 16
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,6
    rst 16
    ld a,(score_100)
    add a,ASCII_ZERO
    rst 16
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,7
    rst 16
    ld a,(score_10)
    add a,ASCII_ZERO
    rst 16
    ld a,ASCII_AT
    rst 16
    ld a,1
    rst 16
    ld a,8
    rst 16
    ld a,(score_1)
    add a,ASCII_ZERO
    rst 16

   
   
 
    ld a,(score_1)
    cp 9
    jp z,increment_score_10
    inc a
    ld (score_1),a

    jp main

increment_score_10:
    ld a,(score_10)
    cp 9
    jp z, increment_score_100
    xor a
    ld (score_1),a
    ld a,(score_10)
    inc a
    ld (score_10),a
    jp main

increment_score_100:
    ld a,(score_100)
    cp 9
    jp z, increment_score_1000
    xor a
    ld (score_10),a
    ld a,(score_100)
    inc a
    ld (score_100),a
    jp main

increment_score_1000:
    ld a,(score_1000)
    cp 9
    jp z, increment_score_10000
    xor a
    ld (score_100),a
    ld a,(score_1000)
    inc a
    ld (score_1000),a
    jp main

increment_score_10000:
    ld a,(score_10000)
    cp 9
    jp z, increment_score_100000
    xor a
    ld (score_1000),a
    ld a,(score_10000)
    inc a
    ld (score_10000),a
    jp main

increment_score_100000:
    ld a,(score_100000)
    cp 9
    jp z, increment_score_1000000
    xor a
    ld (score_10000),a
    ld a,(score_100000)
    inc a
    ld (score_100000),a
    jp main

increment_score_1000000:
    ld a,(score_1000000)
    cp 9
    jp z, increment_score_10000000
    xor a
    ld (score_100000),a
    ld a,(score_1000000)
    inc a
    ld (score_1000000),a
    jp main

increment_score_10000000:
    ld a,(score_10000000)
    cp 9
    jp z, main
    xor a
    ld (score_1000000),a
    ld a,(score_10000000)
    inc a
    ld (score_10000000),a
    jp main

ASCII_AT equ 0x16
ASCII_ZERO equ 0x30
score_1 db 0
score_10 db 0
score_100 db 0
score_1000 db 0
score_10000 db 0
score_100000 db 0
score_1000000 db 0
score_10000000 db 0

    end ENTRY_POINT