player_init_l2:
    ld a,L2_PLAYER_START_X
    ld (playerx),a
    ld a,L2_PLAYER_START_Y
    ld (playery),a
    ld a,L2_PLAYER_START_FACING
    ld (player_direction),a
    call set_state_skiingwaiting
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
    cp SKIING_WAITING
    call z, plyr_upd_skiingwaiting_l2
    cp SKIING
    call z, plyr_upd_skiing_l2
    ld a,(player_state)
    cp PLAYER_DEAD
    call z, plyr_upd_dead_l2
    ret
;


plyr_upd_skiingwaiting_l2:
    ld a,(keypressed_S)
    cp TRUE
    call z,set_state_skiing
    ret
;





plyr_upd_skiing_l2:
    ld ix,flag_y_positions
    ld b,NUM_FLAGS
    call move_flags
    ld ix,tree_y_positions
    ld b,NUM_TREES
    call move_trees

    ld a,(keypressed_A)
    cp 1
    call z,turn_left_l2

    ld a,(keypressed_D)
    cp 1
    call z,turn_right_l2

    ld a,(player_direction)
    cp LEFT
    call z,player_move_left_l2

    ld a,(player_direction)
    cp DIAG_LEFT
    call z,player_move_diagleft_l2

    ld a,(player_direction)
    cp RIGHT
    call z,player_move_right_l2

    ld a,(player_direction)
    cp DIAG_RIGHT
    call z,player_move_diagright_l2
    
    ret
;

;IX=flags
;B=num flags
move_flags:
    ;switch between move speeds:
    ld a,(player_direction)
    cp DOWN
    jp z, pmf_fast
    cp DIAG_LEFT
    jp z, pmf_medium
    cp DIAG_RIGHT
    jp z, pmf_medium
    jp pmf_slow
pmf_slow:
    ld l,(ix)
    ld h,(ix+1)
    call move_flag_slow
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_flags
    ret
pmf_medium:
    ld l,(ix)
    ld h,(ix+1)
    call move_flag_medium
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_flags
    ret
pmf_fast:
    ld l,(ix)
    ld h,(ix+1)
    call move_flag_fast
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_flags
    ret
;


;IX=trees
;B=num trees
move_trees:
    ;switch between move speeds:
    ld a,(player_direction)
    cp DOWN
    jp z, pmt_fast
    cp DIAG_LEFT
    jp z, pmt_medium
    cp DIAG_RIGHT
    jp z, pmt_medium
    jp pmt_slow
pmt_slow:
    ld l,(ix)
    ld h,(ix+1)
    call move_tree_slow
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_trees
    ret
pmt_medium:
    ld l,(ix)
    ld h,(ix+1)
    call move_tree_medium
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_trees
    ret
pmt_fast:
    ld l,(ix)
    ld h,(ix+1)
    call move_tree_fast
    ld (ix),l
    ld (ix+1),h
    inc ix
    inc ix
    djnz move_trees
    ret
;



;keyboard input will call the 'turn' functions, which sets the player direction.
;movement is based upon the direction and handled later
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
turn_right_l2:
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


;player moves in the direction he faces automatically
;depending what way he faces, the speed differs
player_move_left_l2:
    ld a,(playerx)
    cp PLAYER_MIN_X+1
    ret c
    sub PLAYER_SPEED_X
    ld (playerx),a
    ret

player_move_diagleft_l2:
    ld a,(playerx)
    cp PLAYER_MIN_X+1
    ret c
    sub PLAYER_SPEED_X*2
    ld (playerx),a
    ret

player_move_right_l2:
    ld a,(playerx)
    cp PLAYER_MAX_X-1
    ret nc
    add a,PLAYER_SPEED_X
    ld (playerx),a
    ret

player_move_diagright_l2:
    ld a,(playerx)
    cp PLAYER_MAX_X-1
    ret nc
    add a,PLAYER_SPEED_X*2
    ld (playerx),a
    
    ret













;draws the correct animation frame for the player
;depending on direction (the ski level is not animated in any cycle)
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












