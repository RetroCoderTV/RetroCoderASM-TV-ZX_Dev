player_init_l2:
    ld a,L2_PLAYER_START_X
    ld (playerx),a
    ld a,L2_PLAYER_START_Y
    ld (playery),a
    ld a,L2_PLAYER_START_FACING
    ld (player_direction),a
    call set_state_skiing
    ret
;

player_check_level_complete_l2:
    ;todo 
    ret
;

plyr_upd_dead_l2:  
    ;todo
    ret
;

player_update_l2:
    call player_check_level_complete_l2
    call check_keys
   
    ld a,(player_state)
    cp SKIING
    call z, plyr_upd_skiing_l2
    ld a,(player_state)
    cp PLAYER_DEAD
    call z, plyr_upd_dead_l2
    ret
;

plyr_upd_skiing_l2:
    ld ix,flag_y_positions
    ld b,NUM_FLAGS
    call move_flags

    ld a,(keypressed_A)
    cp 1
    call z,turn_left_l2

    ld a,(keypressed_D)
    cp 1
    call z,try_move_right_l2

    
    ret
;

;IX=flags
;B=num flags
move_flags:
    ld l,(ix)
    ld h,(ix+1)
    call move_flag
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_flags
    ret



turn_left_l2:
    ;UP not needed
    ;LEFT do nothing
    ld a,(player_direction)
    cp DOWN
    jp z,set_direction_diagleft
    cp RIGHT
    jp z,set_direction_diagright
    cp DIAG_LEFT
    jp z,set_direction_left
    cp DIAG_RIGHT
    jp z,set_direction_down
    ret
;
try_move_right_l2:
    ;UP not needed
    ;RIGHT do nothing
    ld a,(player_direction)
    cp DOWN
    jp z,set_direction_diagright
    cp LEFT
    jp z,set_direction_diagleft
    cp DIAG_LEFT
    jp z,set_direction_down
    cp DIAG_RIGHT
    jp z,set_direction_right
    ret
;



drawplayer_l2:    
    ld a,(player_direction)
    cp DIAG_LEFT
    jp z, drawplayer_l2_diag_left
    cp DIAG_RIGHT
    jp z, drawplayer_l2_diag_right
    cp DOWN
    jp z, drawplayer_l2_down
    cp LEFT
    jp z, drawplayer_l2_left
    cp RIGHT
    jp z, drawplayer_l2_right
drawplayer_l2_diag_left:
    ld bc,playersprite_dl_ski
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
drawplayer_l2_diag_right:
    ld bc,playersprite_dr_ski
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
drawplayer_l2_down:
    ld bc,playersprite_down_ski
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
drawplayer_l2_left:
    ld bc,playersprite_l_ski
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
drawplayer_l2_right:
    ld bc,playersprite_r_ski
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
drawplayer_l2_end:
    ret












