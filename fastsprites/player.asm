STARTING_Y equ 128-8-4
playerx db 6
playery db STARTING_Y
jumpstart_y db STARTING_Y
isJumping db 0 ;bool
jumpstart_time db 0
jumpstart_timerset db 0
PLAYER_SPEED equ 1
PLAYER_JUMP_SPEED equ 4
PLAYER_JUMP_FRAMES equ 8 
MIN_X equ 0
MAX_X equ 10
MIN_Y equ 0
MAX_Y equ 119
playersprite:
    db %11111111
    db %11111111
    db %10011001
    db %10011001
    db %11111111
    db %11111111
    db %10000001
    db %11111111



move_left:
    ld a,(playerx)
    cp MIN_X
    ret z
    sub PLAYER_SPEED
    ld (playerx),a
    ret

move_right:
    ld a,(playerx)
    cp MAX_X
    ret z
    ld a,(playerx)
    add a,PLAYER_SPEED
    ld (playerx),a
    ret

move_jump:
    ld a,(isJumping)
    cp 0
    call z, jump_start
    
    
    ret

jump_start:
    ld a,(playery)
    ld (jumpstart_y),a ;save ypos
    ld a,1
    ld (isJumping),a ;set bool true
    ld a,(jumpstart_timerset)
    cp 0
    call z,set_timer
    ret
jump_update:
    ld hl,jumpstart_time
    ld a,(0x5C78)
    sub (hl)
    cp PLAYER_JUMP_FRAMES
    call c, jump_up
    call nc, jump_down
    ret
jump_up:
    ld a,(isJumping)
    cp 0
    ret z
    ; go up...
    ld a,(playery)
    cp MIN_Y
    ret z
    ld a,(playery)
    sub PLAYER_JUMP_SPEED
    ld (playery),a
    ret
jump_down:
    ld a,(isJumping)
    cp 0
    ret z
    ;go down
    ld hl,jumpstart_y
    ld a,(playery)
    cp (hl)
    call z,end_jump
    ld a,(playery)
    add a,PLAYER_SPEED
    ld (playery),a
    ret
end_jump:    
    xor a
    ld (jumpstart_timerset),a
    xor a
    ld (isJumping),a
    ret



set_timer:
    ld a,(0x5C78) ;A=current internal frame count
    ld (jumpstart_time),a
    ld a,1
    ld (jumpstart_timerset),a
    ret






