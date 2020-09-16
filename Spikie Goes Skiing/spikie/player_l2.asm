player_distance_travelled_l2 dw 0




player_init_l2:
    xor a
    ld hl,player_distance_travelled_l2
    ld (hl),a
    inc hl
    ld (hl),a
    ld a,L2_PLAYER_START_X
    ld (playerx),a
    ld a,L2_PLAYER_START_Y
    ld (playery),a
    ld a,L2_PLAYER_START_FACING
    ld (player_direction),a
    call set_state_skiingwaiting
    ret
;



plyr_upd_dead_l2:  
    ld a,(keypressed_F)
    cp TRUE
    jp z,begin_level_1_noski
    
    ret
;

player_update_l2:
    call check_keys
   
    ld a,(player_state)
    cp SKIING_WAITING
    jp z, plyr_upd_skiingwaiting_l2
    cp SKIING
    jp z, plyr_upd_skiing_l2
    ld a,(player_state)
    cp PLAYER_DEAD
    jp z, plyr_upd_dead_l2
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
    ld a,(player_direction)
    cp LEFT
    call z,increment_distance_slow

    ld a,(player_direction)
    cp DIAG_LEFT
    call z,increment_distance_medium

    ld a,(player_direction)
    cp RIGHT
    call z,increment_distance_slow

    ld a,(player_direction)
    cp DIAG_RIGHT
    call z,increment_distance_medium

    ld a,(player_direction)
    cp DOWN
    call z,increment_distance_fast

    ld de,(player_distance_travelled_l2)      ;a is high byte???
    ld a,d
    cp 4 ;end of level is 1024                ;is high byte >= 4? if so its higher than endflag
    call nc, do_finish_line
  
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

    di
    ld b,NUM_TREES
    ld hl,tree_y_positions
    ld de,tree_x_positions
    call player_check_collision_trees 
    
    ld b,NUM_FLAGS
    ld hl,flag_y_positions
    ld de,flag_x_positions
    call player_check_collision_flaggate
    ei

    ret
;

increment_distance_slow:
    ld hl,(player_distance_travelled_l2)
    ld bc,PLAYER_SKI_SPEED_SLOW
    add hl,bc
    ld (player_distance_travelled_l2),hl
    ret
increment_distance_medium:
    ld hl,(player_distance_travelled_l2)
    ld bc,PLAYER_SKI_SPEED_MEDIUM
    add hl,bc
    ld (player_distance_travelled_l2),hl
    ret
increment_distance_fast:
    ld hl,(player_distance_travelled_l2)
    ld bc,PLAYER_SKI_SPEED_FAST
    add hl,bc
    ld (player_distance_travelled_l2),hl
    ret

do_finish_line:
    ld bc,endflagsprite
    ld d,L2_END_FLAG_X
    ld e,L2_END_FLAG_Y
    call drawsprite40_8

    ld d,L2_END_FLAG_X
    ld e,L2_END_FLAG_Y+8
    call draw_endpole_l_8_16

    ld d,L2_END_FLAG_X+4
    ld e,L2_END_FLAG_Y+8
    call draw_endpole_r_8_16

    call player_reachs_end
    call player_move_at_end


    ret



player_move_at_end:
    ld a,(playery)
    cp PLAYER_MAX_Y
    ret nc
    ;switch between move speeds:
    ld a,(player_direction)
    cp DOWN
    jp z, pme_fast
    cp DIAG_LEFT
    jp z, pme_medium
    cp DIAG_RIGHT
    jp z, pme_medium
    jp pme_slow
pme_slow:
    ld a,(playery)
    add a,PLAYER_SKI_SPEED_SLOW
    ld (playery),a
    ret
pme_medium:
    ld a,(playery)
    add a,PLAYER_SKI_SPEED_MEDIUM
    ld (playery),a
    ret
pme_fast:
    ld a,(playery)
    add a,PLAYER_SKI_SPEED_FAST
    ld (playery),a
    ret



player_reachs_end:
    ld a,L2_END_FLAG_Y+8
    ld b,a
    ld a,(playery)
    cp b
    jp nc, check_endgate_hit
    
    ret


check_endgate_hit:
    ld a,L2_END_FLAG_X
    ld b,a
    ld a,(playerx)
    cp b
    jp c,kill_player
    
    ld a,(playerx)
    ld b,a
    ld a, L2_END_FLAG_X
    add a,L2_END_FLAG_W-PLAYER_WIDTH
    cp b
    jp c,kill_player

    

    ;player is inside the finish gate
    jp skilevel_completed

    ret


skilevel_completed: 
    ld a,(current_spawn_chance)
    cp MAX_SPAWN_CHANCE
    jp nc, begin_level_1_withski
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a ; added 10 to currentspawnchance
    ld (current_spawn_chance),a

    ld a,(flag_current_gap)
    cp FLAG_MIN_GAP+1
    jp c, begin_level_1_withski
    dec a
    ld (flag_current_gap),a ;flag gap -= 1

    jp begin_level_1_withski


;IX=flags
;B=num flags
move_flags:
    push bc
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
    pop bc
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
    pop bc 
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
    call increment_score1
    pop bc
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
    ld a,(player_state)
    cp PLAYER_DEAD
    jp z,dp_dead_l2    
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
dp_dead_l2:
    ld bc,playersprite_dead_ski
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
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






;Moz once again found the solution!!
;B=num trees
;hl=trees y
;de=trees x
player_check_collision_trees:
    ld a,(player_state)
    cp SKIING
    ret nz 

    ld a,(hl)
    inc hl
    or (hl)
    dec hl
    jp z,pcct_gonext ;if High AND low bytes=00 , go next

    inc hl ;move to high byte
    ld a,(hl) ;take its value
    dec hl ;move back
    cp 0 ;is high byte == 0 ? ;or a is quicker than cp 0
    jp nz,pcct_gonext; return if high byte != 0

    push bc   
    ld a,(playerx) ;player x
    ld b,a ;B=player x
    ld a,(de) ;A=tree X
    add a,TREE_WIDTH ;+=tree width
    cp b ; tree right side < player left side ?
    pop bc
    jp c, pcct_gonext ;if a < b gonext

    push bc
    ld a,(de) ;tree x
    ld b,a ;B=tree x
    ld a,(playerx) ;p x
    add a,PLAYER_WIDTH ;+= width
    cp b ; if player right side < tree left, 
    pop bc
    jp c, pcct_gonext ; then go next

    push bc   
    ld a,(playery) 
    ld b,a 
    ld a,(hl) 
    add a,TREE_HEIGHT
    cp b 
    pop bc
    jp c, pcct_gonext 

    push bc
    ld a,(hl) 
    ld b,a 
    ld a,(playery) 
    add a,PLAYER_HEIGHT 
    cp b 
    pop bc
    jp c, pcct_gonext 
    

    ;if here, we collided with a tree....
    call kill_player
    
    ret
pcct_gonext:
    inc de ;inc once for 8bit value
    inc hl 
    inc hl ;twice for 16bit
    djnz player_check_collision_trees ;jump to next tree
    ret






;B=num trees
;hl=flags y
;de=flags x
player_check_collision_flaggate:
    ld a,(player_state)
    cp SKIING
    ret nz 
    
    ld a,(hl)
    inc hl
    or (hl)
    dec hl
    jp z,pccf_gonext ;if High AND low bytes=00 , go next

    inc hl ;move to high byte
    ld a,(hl) ;take its value
    dec hl ;move back
    cp 0 ;is high byte == 0 ? ;or a is quicker than cp 0
    jp nz,pccf_gonext ; return if high byte != 0   


    push bc   
    ld a,(playery) 
    ld b,a 
    ld a,(hl) 
    add a,FLAG_HEIGHT
    cp b 
    pop bc
    jp c, pccf_gonext 

    push bc
    ld a,(hl) 
    ld b,a 
    ld a,(playery) 
    add a,PLAYER_HEIGHT 
    cp b 
    pop bc
    jp c, pccf_gonext 

    push bc   
    ld a,(playerx) ;player x
    ld b,a ;B=player x
    ld a,(flag_current_gap)
    ld c,a
    ld a,(de) ;A=f X
    add a,c;+=gap width
    cp b ; tree right side < player left side ?
    pop bc
    jp c, pccf_gonext ;if a < b gonext

    push bc
    ld a,(de) ;flag x
    ld b,a 
    ld a,(playerx) ;p x
    cp b ; if player right side < tree left, 
    pop bc
    jp c, pccf_gonext ; then go next

   
    
    ;if here, we collided with a tree....
    call increment_score100
    ret
pccf_gonext:
    inc de ;inc once for 8bit value
    inc hl 
    inc hl ;twice for 16bit
    djnz player_check_collision_flaggate ;jump to next tree
    ret










