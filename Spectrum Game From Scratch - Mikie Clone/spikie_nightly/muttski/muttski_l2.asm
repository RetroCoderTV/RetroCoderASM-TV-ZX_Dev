
muttski_update_l2:
    call muttski_reset_collisions_check
    
    ld a,(muttski_state)
    cp TURNING
    ret z
    cp PATROL
    call z, muttski_update_patrol_l2


    ret




muttski_update_patrol_l2:
    ld a,(muttski_desired_direction)
    cp BOB_GO_UP
    call z, muttski_try_move_up_l2
    ld a,(muttski_desired_direction)
    cp BOB_GO_DOWN
    call z, muttski_try_move_down_l2
    ld a,(muttski_desired_direction)
    cp BOB_GO_LEFT
    call z, muttski_try_move_left_l2
    ld a,(muttski_desired_direction)
    cp BOB_GO_RIGHT
    call z, muttski_try_move_right_l2


    ret



;these move the targetpos. call them on keypress for example
muttski_try_move_left_l2:
    ld a,LEFT
    ld (muttski_direction),a
    ld a,(muttski_targetpos_x)
    sub MUTTSKI_SPEED_X
    ld (muttski_targetpos_x),a
    ld ix,l2_lockers
    call check_collisions_muttski_locker
    call muttski_safemovetotargetpos
    call muttski_do_anim_timer
    jp muttskichecknodesjump
    ;ret

muttski_try_move_right_l2:
    ld a,RIGHT
    ld (muttski_direction),a
    ld a,(muttski_targetpos_x)
    add a,MUTTSKI_SPEED_X
    ld (muttski_targetpos_x),a
    ld ix,l2_lockers
    call check_collisions_muttski_locker
    call muttski_safemovetotargetpos
    call muttski_do_anim_timer
    ld ix,l2_nodes
    jp muttskichecknodesjump
    ;ret

muttski_try_move_up_l2:
    ld a,UP
    ld (muttski_direction),a
    ld a,(muttski_targetpos_y)
    sub MUTTSKI_SPEED_Y
    ld (muttski_targetpos_y),a
    ld ix,l2_lockers
    call check_collisions_muttski_locker
    call muttski_safemovetotargetpos
    call muttski_do_anim_timer
    ld ix,l2_nodes
    jp muttskichecknodesjump
    ;ret

muttski_try_move_down_l2:
    ld a,DOWN
    ld (muttski_direction),a
    ld a,(muttski_targetpos_y)
    add a,MUTTSKI_SPEED_Y
    ld (muttski_targetpos_y),a
    ld ix,l2_lockers
    call check_collisions_muttski_locker
    call muttski_safemovetotargetpos
    call muttski_do_anim_timer
    ld ix,l2_nodes
    jp muttskichecknodesjump
    ;ret

muttskichecknodesjump:
    ld ix,l2_nodes
    call muttski_check_nodes
    ret


;

muttski_set_desired_direction_up:
    ld a,BOB_GO_UP
    ld (muttski_desired_direction),a
    ret
muttski_set_desired_direction_down:
    ld a,BOB_GO_DOWN
    ld (muttski_desired_direction),a
    ret
muttski_set_desired_direction_left:
    ld a,BOB_GO_LEFT
    ld (muttski_desired_direction),a
    ret
muttski_set_desired_direction_right:
    ld a,BOB_GO_RIGHT
    ld (muttski_desired_direction),a
    ret

muttski_set_state_patrol:
    ld a,PATROL
    ld (muttski_state),a
    ret



;routines for top,bottom,left,right. They jump to corners ;Jump to corner cases 
;ix=node
muttski_check_nodes:
    ld a,(muttskix)
    cp (ix+1)
    jp nz, muttski_check_nodes_gonext
    ld a,(muttskiy)
    cp (ix+2)
    jp nz, muttski_check_nodes_gonext  
    jp muttski_hit_node
muttski_check_nodes_gonext:
    ld a,(ix)
    cp TOTAL_NODES
    jp z, muttski_check_node_finish
    ld de,NODE_DATA_LENGTH
    add ix,de
    jp muttski_check_nodes
muttski_hit_node:
    ld a,TURNING
    ld (muttski_state),a
    ld a,(ix) ;get node id
    cp 1
    jp z,muttski_hitnode1
    cp 2
    jp z,muttski_hitnode2
    cp 3
    jp z,muttski_hitnode3
    cp 4
    jp z,muttski_hitnode4
    cp 5
    jp z,muttski_hitnode5
    cp 6
    jp z,muttski_hitnode6
    cp 7
    jp z,muttski_hitnode7
    cp 8
    jp z,muttski_hitnode8
    cp 9
    jp z,muttski_hitnode9
    cp 10
    jp z,muttski_hitnode10
    cp 11
    jp z,muttski_hitnode11
    cp 12
    jp z,muttski_hitnode12
muttski_hitnode1:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode2:
    ld a,(muttski_direction)
    cp RIGHT
    jp z,muttski_hitnode2r
    jp nz,muttski_hitnode2l
muttski_hitnode2l:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode2r:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode3:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode4:
    ld a,(muttski_direction)
    cp LEFT
    jp z,muttski_hitnode4l
    cp UP
    jp z,muttski_hitnode4u
    jp nz,muttski_hitnode4d
muttski_hitnode4l:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_down
    jp muttski_check_node_finish
muttski_hitnode4u:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode4d:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode5:
    ld a,(muttski_direction)
    cp UP
    jp z,muttski_hitnode5u
    cp DOWN
    jp z,muttski_hitnode5d
    cp LEFT
    jp z,muttski_hitnode5l
    cp RIGHT
    jp z,muttski_hitnode5r
muttski_hitnode5u:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_up
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_left
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode5d:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_down
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_left
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode5l:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_down
    jp muttski_check_node_finish
muttski_hitnode5r:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_down
    jp muttski_check_node_finish
muttski_hitnode6:
    ld a,(muttski_direction)
    cp UP
    jp z,muttski_hitnode6u
    jp nz,muttski_hitnode6d
muttski_hitnode6u:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode6d:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode7:
    ld a,(muttski_direction)
    cp UP
    jp z,muttski_hitnode7u
    jp nz,muttski_hitnode7d
muttski_hitnode7u:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode7d:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode8:
    ld a,(muttski_direction)
    cp UP
    jp z,muttski_hitnode8u
    cp DOWN
    jp z,muttski_hitnode8d
    cp LEFT
    jp z,muttski_hitnode8l
    cp RIGHT
    jp z,muttski_hitnode8r
muttski_hitnode8u:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_up
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_left
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode8d:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_down
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_left
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode8l:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_down
    jp muttski_check_node_finish
muttski_hitnode8r:
    call getrandom
    cp 255/3
    call c, muttski_set_desired_direction_left
    call getrandom
    cp 255/2
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_down
    jp muttski_check_node_finish
muttski_hitnode9:
    ld a,(muttski_direction)
    cp UP
    jp z,muttski_hitnode9u
    jp nz,muttski_hitnode9d
muttski_hitnode9u:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode9d:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_down
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode10:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode11:
    ld a,(muttski_direction)
    cp DOWN
    jp z,muttski_hitnode11d
    cp RIGHT
    jp z,muttski_hitnode11r
    jp nz,muttski_hitnode11l
muttski_hitnode11d:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_right
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode11l:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_hitnode11r:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_right
    jp muttski_check_node_finish
muttski_hitnode12:
    call getrandom
    cp 128
    call c, muttski_set_desired_direction_up
    call nc, muttski_set_desired_direction_left
    jp muttski_check_node_finish
muttski_check_node_finish:
    ld a,PATROL
    ld (muttski_state),a ;restore muttskistate
    ret










    



