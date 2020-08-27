
bob_update_l1:
    
    call bob_reset_collisions_check
    
    ld a,(bob_state)
    cp STANDARD
    call z, bob_update_standard_l1
    cp ATTACK
    call z, bob_update_attack_l1


    ret




bob_update_standard_l1:
    ld a,(bob_action_state)
    cp BOB_GO_UP
    call z, bob_try_move_up_l1
    ld a,(bob_action_state)
    cp BOB_GO_DOWN
    call z, bob_try_move_down_l1
    ld a,(bob_action_state)
    cp BOB_GO_LEFT
    call z, bob_try_move_left_l1
    ld a,(bob_action_state)
    cp BOB_GO_RIGHT
    call z, bob_try_move_right_l1


    call bob_middle_changer_top
    call bob_middle_changer_bottom



    ret

bob_update_attack_l1:

    ret



;these move the targetpos. call them on keypress for example
bob_try_move_left_l1:
    ld a,LEFT
    ld (bob_direction),a
    ld a,(bobx)
    cp MIN_X
    push af
    call c, bob_choose_random_direction
    pop af
    ret c
    ld a,(bob_targetpos_x)
    sub BOB_SPEED_X
    ld (bob_targetpos_x),a
    ld ix,desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ret

bob_try_move_right_l1:
    ld a,RIGHT
    ld (bob_direction),a
    ld a,(bobx)
    cp MAX_X
    push af
    call nc, bob_choose_random_direction
    pop af
    ret nc
    ld a,(bob_targetpos_x)
    add a,BOB_SPEED_X
    ld (bob_targetpos_x),a
    ld ix,desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ret

bob_try_move_up_l1:
    ld a,UP
    ld (bob_direction),a
    ld a,(boby)
    cp MIN_Y
    push af
    call c, bob_choose_random_direction
    pop af
    ret c
    ld a,(bob_targetpos_y)
    sub BOB_SPEED_Y
    ld (bob_targetpos_y),a
    ld ix,desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ret

bob_try_move_down_l1:
    ld a,DOWN
    ld (bob_direction),a
    ld a,(boby)
    cp MAX_Y
    push af
    call nc, bob_choose_random_direction
    pop af
    ret nc
    ld a,(bob_targetpos_y)
    add a,BOB_SPEED_Y
    ld (bob_targetpos_y),a
    ld ix,desksdata
    call check_collisions_bob_desk
    call bob_safemovetotargetpos
    call bob_do_anim_timer
    ret
;



bob_middle_changer_top:
    call getrandom
    cp BOB_MIDDLE_CHANCE
    ret c
    ld a,(boby)
    cp MIN_Y+8
    ret nc
    ld a,(bobx)
    cp MID_X
    call bob_choose_random_direction
    ret
bob_middle_changer_bottom:
    call getrandom
    cp BOB_MIDDLE_CHANCE
    ret c
    ld a,(boby)
    cp MAX_Y-8
    ret c
    ld a,(bobx)
    cp MID_X
    call bob_choose_random_direction
    ret


bob_choose_random_direction:
    call getrandom
    and %00000011 ; is 4-255 always be 3?
    ld (bob_action_state),a
    ret