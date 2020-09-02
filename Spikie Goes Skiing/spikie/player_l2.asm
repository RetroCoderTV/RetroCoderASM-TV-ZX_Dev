

; player_update_l2:
;     call reset_collisions_check
;     ld ix,l2_lockers
;     call check_collisions_lockers
;     ld ix,l2_lockers
;     call checkcollisions_lockertrigger

;     call check_collision_player_door

;     ; ld a,(player_state)
;     ; cp STANDARD
;     ; call z, check_attack_keypress
;     ; ld a,(player_state)
;     ; cp ATTACK
;     ; call z, check_attack_keypress

;     ld a,(player_state)
;     cp STANDARD
;     call z, plyr_update_standard_l2
;     ; cp ATTACK
;     ; call z, plyr_update_attack
;     ; cp SIT
;     ; call z,plyr_update_sit
;     ret


; plyr_update_standard_l2:
;     ld a,(keypressed_W)
;     cp 1
;     call z,try_move_up_l2

;     ld a,(keypressed_S)
;     cp 1
;     call z,try_move_down_l2

;     ld a,(keypressed_A)
;     cp 1
;     call z,try_move_left_l2

;     ld a,(keypressed_D)
;     cp 1
;     call z,try_move_right_l2
;     ret

; ;these move the targetpos. call them on keypress for example
; try_move_left_l2:
;     ld a,LEFT
;     ld (player_direction),a
;     ld a,(playerx)
;     cp MIN_X
;     ret c
;     ld a,(player_targetpos_x)
;     sub PLAYER_SPEED_X
;     ld (player_targetpos_x),a
;     ld ix,l2_lockers
;     call check_collisions_lockers
;     ld ix,l2_baskets
;     call check_collisions_basket
;     call safemovetotargetpos
;     call anim_timer
;     ret

; try_move_right_l2:
;     ld a,RIGHT
;     ld (player_direction),a
;     ld a,(playerx)
;     cp MAX_X
;     ret nc
;     ld a,(player_targetpos_x)
;     add a,PLAYER_SPEED_X
;     ld (player_targetpos_x),a
;     ld ix,l2_lockers
;     call check_collisions_lockers
;     ld ix,l2_baskets
;     call check_collisions_basket
;     call safemovetotargetpos
;     call anim_timer
;     ret

; try_move_up_l2:
;     ld a,UP
;     ld (player_direction),a
;     ld a,(playery)
;     cp MIN_Y
;     ret c
;     ld a,(player_targetpos_y)
;     sub PLAYER_SPEED_Y
;     ld (player_targetpos_y),a
;     ld ix,l2_lockers
;     call check_collisions_lockers
;     ld ix,l2_baskets
;     call check_collisions_basket
;     call safemovetotargetpos
;     call anim_timer
;     ret

; try_move_down_l2:
;     ld a,DOWN
;     ld (player_direction),a
;     ld a,(playery)
;     cp MAX_Y
;     ret nc
;     ld a,(player_targetpos_y)
;     add a,PLAYER_SPEED_Y
;     ld (player_targetpos_y),a
;     ld ix,l2_lockers
;     call check_collisions_lockers
;     ld ix,l2_baskets
;     call check_collisions_basket
;     call safemovetotargetpos
;     call anim_timer
;     ret
; ;
