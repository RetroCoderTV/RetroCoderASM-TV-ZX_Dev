
bob_update_l1:
    
    call bob_reset_collisions_check
    
    ld a,(bob_state)
    cp STANDARD
    call z, bob_update_standard_l1
    cp ATTACK
    call z, bob_update_attack_l1


    ret




bob_update_standard_l1:
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
    call c, bob_hit_wall_l
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
    call nc, bob_hit_wall_r
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
    call c, bob_hit_wall_t
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
    call nc, bob_hit_wall_b
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
    ld a,(boby)
    cp MIN_Y-4
    ret nz
    call getrandom
    cp BOB_MIDDLE_CHANCE_TOP
    ret c
    ld a,(bobx)
    cp MID_X
    call z, bob_choose_random_direction_middle
    ret
bob_middle_changer_bottom:
    ld a,(boby)
    cp MAX_Y
    ret c
    call getrandom
    cp BOB_MIDDLE_CHANCE_BOTTOM
    ret c
    ld a,(bobx)
    cp MID_X
    call z, bob_choose_random_direction_middle
    ret

bob_choose_random_direction_middle:
    call getrandom
    and %00000011 
    ld (bob_desired_direction),a
    ret


;routines for top,bottom,left,right. They jump to corners ;Jump to corner cases 
bob_hit_wall_t:
    ld a,(bobx)
    cp MID_X
    jp c, bob_corner_tl
    jp nc, bob_corner_tr
bob_hit_wall_b:
    ld a,(bobx)
    cp MID_X
    jp c, bob_corner_bl
    jp nc, bob_corner_br
bob_hit_wall_l:
    ld a,(boby)
    cp MID_Y
    jp c, bob_corner_tl
    jp nc, bob_corner_bl
bob_hit_wall_r:
    ld a,(boby)
    cp MID_Y
    jp c, bob_corner_tr
    jp nc, bob_corner_br
;jmp labels: Corner cases   
bob_corner_bl:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_right
    ret
bob_corner_br:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_up
    call nc, bob_set_desired_direction_left
    ret
bob_corner_tl:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_right
    ret
bob_corner_tr:
    call getrandom
    cp 128
    call c, bob_set_desired_direction_down
    call nc, bob_set_desired_direction_left
    ret









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
