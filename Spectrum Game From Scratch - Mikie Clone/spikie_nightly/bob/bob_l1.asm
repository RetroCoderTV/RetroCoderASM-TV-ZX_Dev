
bob_update_l1:
    call bob_reset_collisions_check
    
    ld a,(bob_state)
    cp TURNING
    ret z
    cp PATROL
    call z, bob_update_patrol_l1
    cp HUNTING
    call z, bob_update_hunting_l1
    cp WAITING
    call z, bob_update_waiting_l1


    ret




bob_update_patrol_l1:
    ld a,(bob_desired_direction)
    cp BOB_GO_UP
    call z, bob_try_move_up_l1
    ld a,(bob_desired_direction)
    cp BOB_GO_DOWN
    call z, bob_try_move_down_l1
    ld a,(bob_desired_direction)
    cp BOB_GO_LEFT
    call z, bob_try_move_left_l1
    ld a,(bob_desired_direction)
    cp BOB_GO_RIGHT
    call z, bob_try_move_right_l1


    ret

bob_update_hunting_l1:
    ret

bob_update_waiting_l1:
    call getrandom
    cp BOB_RESUME_PATROL_CHANCE
    ret c
    call getrandom
    cp FIFTY50;BOB_TEETH_CHANCE_1
    jp nc,bob_resumepatrol
    jp c,bob_throwteeth
bob_resumepatrol:
    ld a,PATROL
    ld (bob_state),a
    ret
bob_throwteeth:
    call setborderpink
    ret


;these move the targetpos. call them on keypress for example
bob_try_move_left_l1:
    ld a,LEFT
    ld (bob_direction),a
    ld a,(bob_targetpos_x)
    sub BOB_SPEED_X
    ld (bob_targetpos_x),a
    ld ix,l1_desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    jp bobchecknodesjump
    ;ret

bob_try_move_right_l1:
    ld a,RIGHT
    ld (bob_direction),a
    ld a,(bob_targetpos_x)
    add a,BOB_SPEED_X
    ld (bob_targetpos_x),a
    ld ix,l1_desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ld ix,l1_nodes
    jp bobchecknodesjump
    ;ret

bob_try_move_up_l1:
    ld a,UP
    ld (bob_direction),a
    ld a,(bob_targetpos_y)
    sub BOB_SPEED_Y
    ld (bob_targetpos_y),a
    ld ix,l1_desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ld ix,l1_nodes
    jp bobchecknodesjump
    ;ret

bob_try_move_down_l1:
    ld a,DOWN
    ld (bob_direction),a
    ld a,(bob_targetpos_y)
    add a,BOB_SPEED_Y
    ld (bob_targetpos_y),a
    ld ix,l1_desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ld ix,l1_nodes
    jp bobchecknodesjump
    ;ret

bobchecknodesjump:
    ld ix,l1_nodes
    call bob_check_nodes
    ret


;

bob_set_desired_direction_up:
    ld a,BOB_GO_UP
    ld (bob_desired_direction),a
    ret
bob_set_desired_direction_down:
    ld a,BOB_GO_DOWN
    ld (bob_desired_direction),a
    ret
bob_set_desired_direction_left:
    ld a,BOB_GO_LEFT
    ld (bob_desired_direction),a
    ret
bob_set_desired_direction_right:
    ld a,BOB_GO_RIGHT
    ld (bob_desired_direction),a
    ret

bob_set_state_patrol:
    ld a,PATROL
    ld (bob_state),a
    ret
bob_set_state_waiting:
    ld a,WAITING
    ld (bob_state),a
    ld a,DOWN
    ld (bob_direction),a
    ld a,BOB_GO_DOWN
    ld (bob_desired_direction),a   
    ret




;routines for top,bottom,left,right. They jump to corners ;Jump to corner cases 
;ix=node
bob_check_nodes:
    ld a,(bobx)
    cp (ix+1)
    jp nz, bob_check_nodes_gonext
    ld a,(boby)
    cp (ix+2)
    jp nz, bob_check_nodes_gonext  
    jp bob_hit_node
bob_check_nodes_gonext:
    ld a,(ix)
    cp TOTAL_NODES
    jp z, bob_check_node_finish
    ld de,NODE_DATA_LENGTH
    add ix,de
    jp bob_check_nodes
bob_hit_node:
    ld a,(ix)
    cp 10
    jp nc, bob_whichnode
    call getrandom
    cp BOB_WAITING_CHANCE
    jp nc, bob_set_state_waiting
    ld a,TURNING
    ld (bob_state),a
bob_whichnode:
    ld a,(ix) ;get node id
    cp 1
    jp z,bob_hitnode1
    cp 2
    jp z,bob_hitnode2
    cp 3
    jp z,bob_hitnode3
    cp 4
    jp z,bob_hitnode4
    cp 5
    jp z,bob_hitnode5
    cp 6
    jp z,bob_hitnode6
    cp 7
    jp z,bob_hitnode7
    cp 8
    jp z,bob_hitnode8
    cp 9
    jp z,bob_hitnode9
    cp 10
    jp z,bob_hitnode10
    cp 11
    jp z,bob_hitnode11
    cp 12
    jp z,bob_hitnode12
bob_hitnode1:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode2:
    ld a,(bob_direction)
    cp RIGHT
    jp z,bob_hitnode2r
    jp nz,bob_hitnode2l
bob_hitnode2l:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode2r:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode3:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode4:
    ld a,(bob_direction)
    cp LEFT
    jp z,bob_hitnode4l
    cp UP
    jp z,bob_hitnode4u
    jp nz,bob_hitnode4d
bob_hitnode4l:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_down
    jp bob_check_node_finish
bob_hitnode4u:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode4d:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode5:
    ld a,(bob_direction)
    cp UP
    jp z,bob_hitnode5u
    cp DOWN
    jp z,bob_hitnode5d
    cp LEFT
    jp z,bob_hitnode5l
    cp RIGHT
    jp z,bob_hitnode5r
bob_hitnode5u:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_up
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_left
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode5d:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_down
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_left
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode5l:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_down
    jp bob_check_node_finish
bob_hitnode5r:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_down
    jp bob_check_node_finish
bob_hitnode6:
    ld a,(bob_direction)
    cp UP
    jp z,bob_hitnode6u
    jp nz,bob_hitnode6d
bob_hitnode6u:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode6d:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode7:
    ld a,(bob_direction)
    cp UP
    jp z,bob_hitnode7u
    jp nz,bob_hitnode7d
bob_hitnode7u:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode7d:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode8:
    ld a,(bob_direction)
    cp UP
    jp z,bob_hitnode8u
    cp DOWN
    jp z,bob_hitnode8d
    cp LEFT
    jp z,bob_hitnode8l
    cp RIGHT
    jp z,bob_hitnode8r
bob_hitnode8u:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_up
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_left
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode8d:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_down
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_left
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode8l:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_down
    jp bob_check_node_finish
bob_hitnode8r:
    call getrandom
    cp 255/3
    call c, bob_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_down
    jp bob_check_node_finish
bob_hitnode9:
    ld a,(bob_direction)
    cp UP
    jp z,bob_hitnode9u
    jp nz,bob_hitnode9d
bob_hitnode9u:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode9d:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode10:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode11:
    ld a,(bob_direction)
    cp DOWN
    jp z,bob_hitnode11d
    cp RIGHT
    jp z,bob_hitnode11r
    jp nz,bob_hitnode11l
bob_hitnode11d:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_right
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode11l:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_hitnode11r:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_right
    jp bob_check_node_finish
bob_hitnode12:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_left
    jp bob_check_node_finish
bob_check_node_finish:
    ld a,PATROL
    ld (bob_state),a ;restore bobstate
    ret










    



