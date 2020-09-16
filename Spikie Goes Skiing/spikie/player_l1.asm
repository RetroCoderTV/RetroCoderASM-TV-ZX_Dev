player_init_l1:
    ld a,L1_PLAYER_START_X
    ld (playerx),a
    ld a,L1_PLAYER_START_Y
    ld (playery),a
    ld a,L1_PLAYER_START_FACING
    ld (player_direction),a
    ret

player_start_l1_withski:
    ld a,L1_PLAYER_START_X_WITHSKI
    ld (playerx),a
    ld a,L1_PLAYER_START_Y_WITHSKI
    ld (playery),a
    ld a,L1_PLAYER_START_FACING_WITHSKI
    ld (player_direction),a
    ld a,L1_PLAYER_START_STATE_WITHSKI
    ld (player_state),a
    ret

player_start_l1_noski:
    xor a
    ld (has_ski),a
    ld a,L1_PLAYER_START_X
    ld (playerx),a
    ld a,L1_PLAYER_START_Y
    ld (playery),a
    ld a,L1_PLAYER_START_FACING
    ld (player_direction),a
    ld a,L1_PLAYER_START_STATE
    ld (player_state),a
    ret


;victory
player_check_level_complete_l1:
    ld a,(has_ski)
    cp TRUE
    ret nz
    ld a,(playery)
    cp PLAYER_MIN_Y+4
    ret nc
    call increment_score100
    jp begin_level_2
    ret

player_update_l1:
    

    call player_check_level_complete_l1
    call check_keys
    
    
    ld a,(player_state)
    cp NO_SKI
    call z, plyr_upd_noski_l1
    ld a,(player_state)
    cp WITH_SKI
    call z, plyr_upd_withski_l1
    ld a,(player_state)
    cp PLAYER_DEAD
    call z, plyr_upd_dead_l1


    call player_check_collision_shop

    ld ix,vehicles_r_1
    call player_check_collision_cars_r
    ld ix,vehicles_r_2
    call player_check_collision_cars_r
    ld ix,vehicles_r_3
    call player_check_collision_cars_r

    ld ix,vehicles_l_1
    call player_check_collision_cars_l
    ld ix,vehicles_l_2
    call player_check_collision_cars_l
    ld ix,vehicles_l_3
    call player_check_collision_cars_l

    ld a,(has_ski)
    cp TRUE
    ret z
    ld a,(cash_10)
    or a
    jp z, begin_gameover
    ret

plyr_upd_dead_l1:  
    ld a,FALSE
    ld (has_ski),a


    ld a,(keypressed_F)
    cp TRUE
    call z, plyr_newlife_l1
    
    ret

plyr_newlife_l1:
    ld a,FALSE
    ld (collision_detected_player_car),a 

    call decrease_cash
   

    ld a,4
    ld (playerx),a
    xor a
    ld (playery),a
    call set_state_noski
    call set_direction_down

    call sound_G_0_25
    call sound_G_0_125
    call sound_G_0_25

    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ret


plyr_upd_noski_l1:
    ld a,(keypressed_W)
    cp 1
    call z,try_move_up_l1

    ld a,(keypressed_S)
    cp 1
    call z,try_move_down_l1

    ld a,(keypressed_A)
    cp 1
    call z,try_move_left_l1

    ld a,(keypressed_D)
    cp 1
    call z,try_move_right_l1
    ret

plyr_upd_withski_l1:
    ld a,(keypressed_W)
    cp 1
    call z,try_move_up_l1

    ld a,(keypressed_S)
    cp 1
    call z,try_move_down_l1

    ld a,(keypressed_A)
    cp 1
    call z,try_move_left_l1

    ld a,(keypressed_D)
    cp 1
    call z,try_move_right_l1

    ld a,(collision_detected_player_shop)
    cp TRUE
    ret z

    ld bc,playersprite_ski_icon
    ld a,(playerx)
    sub PLAYER_SKI_ICON_OFFSET_X
    ld d,a
    ld a,(playery)
    ld e,a
    push de
    call drawsprite8_16
    pop de
    ld b,FLAG_COLOUR_L
    call paint_sprite_1_2

    ret



;these move the targetpos. call them on keypress for example
try_move_left_l1:
    ld a,LEFT
    ld (player_direction),a
    ld a,(playerx)
    cp PLAYER_MIN_X
    ret c
    ld a,(playerx)
    sub PLAYER_SPEED_X
    ld (playerx),a
    ret

try_move_right_l1:
    ld a,(collision_detected_player_shop)
    cp TRUE
    ret z
    ld a,RIGHT
    ld (player_direction),a
    ld a,(playerx)
    cp PLAYER_MAX_X
    ret nc
    ld a,(playerx)
    add a,PLAYER_SPEED_X
    ld (playerx),a
    ret

try_move_up_l1:
    ld a,(collision_detected_player_shop)
    cp TRUE
    ret z
    ld a,UP
    ld (player_direction),a
    ld a,(playery)
    cp PLAYER_MIN_Y
    ret c
    ld a,(playery)
    sub PLAYER_SPEED_Y
    ld (playery),a

    call increment_score1
    
    ret

try_move_down_l1:
    ld a,DOWN
    ld (player_direction),a
    ld a,(playery)
    cp PLAYER_MAX_Y
    ret nc
    ld a,(playery)
    add a,PLAYER_SPEED_Y
    ld (playery),a

    call increment_score1

    ret
;




;INPUT:
;IX=cars
player_check_collision_cars_l:
    ld a,(ix)
    cp 255
    ret z
    cp VEH_DEAD
    jp z, plyr_chk_coll_cars_next_l


    ld a,(playerx)
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    sub 1
    cp b
    jp c, plyr_chk_coll_cars_next_l

    ld a,(ix+1)
    ld b,a
    ld a,(playerx)
    add a,PLAYER_WIDTH
    cp b
    jp c, plyr_chk_coll_cars_next_l


    ld a,(playery)
    add a,8
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, plyr_chk_coll_cars_next_l
    
    ld a,(ix+2)
    ld b,a
    ld a,(playery)
    add a,18
    cp b
    jp c, plyr_chk_coll_cars_next_l

    ; ;else, we collided....
    ld a,(collision_detected_player_car)
    cp TRUE
    ret z

    ld a,TRUE
    ld (collision_detected_player_car),a 

    call kill_player
    
    ret
plyr_chk_coll_cars_next_l:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp player_check_collision_cars_l





;INPUT:
;IX=cars
player_check_collision_cars_r:
    ld a,(ix)
    cp 255
    ret z
    cp VEH_DEAD
    jp z, plyr_chk_coll_cars_next_r


    ld a,(playerx)
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    sub 1
    cp b
    jp c, plyr_chk_coll_cars_next_r

    ld a,(ix+1)
    ld b,a
    ld a,(playerx)
    add a,PLAYER_WIDTH
    cp b
    jp c, plyr_chk_coll_cars_next_r


    ld a,(playery)
    add a,8
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, plyr_chk_coll_cars_next_r
    
    ld a,(ix+2)
    ld b,a
    ld a,(playery)
    add a,18
    cp b
    jp c, plyr_chk_coll_cars_next_r

    ; ;else, we collided....
    ld a,(collision_detected_player_car)
    cp TRUE
    ret z

    ld a,TRUE
    ld (collision_detected_player_car),a 
    call kill_player
    
    ret
plyr_chk_coll_cars_next_r:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp player_check_collision_cars_r




player_check_collision_shop:
    ld a,FALSE
    ld (collision_detected_player_shop),a
    ld a,(playerx)
    add a,PLAYER_WIDTH
    ld b,a
    ld a,SHOP_X
    add a,SHOP_W
    cp b
    ret c

    ld a,SHOP_X
    add a,SHOP_DOOR_OFFSET
    ld b,a
    ld a,(playerx)
    cp b
    ret c

    ld a,(playery)
    ld b,a
    ld a,SHOP_Y
    cp b
    ret nz
    
    ld a,TRUE
    ld (collision_detected_player_shop),a
    

    ld a,(has_ski)
    cp TRUE
    ret z
    
    ld a,TRUE
    ld (has_ski),a
    ld a,WITH_SKI ;todo (try remove bool hasski)
    ld (player_state),a
    call decrease_cash
    call increment_score1000



    call sound_A_0_25
    call sound_B_0_25
    call sound_F_0_25

    ret




















drawplayer_l1:    
    ld a,(player_state)
    cp PLAYER_DEAD
    jp z,dp_dead_l1
    ld a,(collision_detected_player_shop)
    cp TRUE
    ret z
    ld a,(player_direction)
    cp UP
    jp z, drawplayer_l1_up
    cp DOWN
    jp z, drawplayer_l1_down
    cp LEFT
    jp z, drawplayer_l1_left
    cp RIGHT
    jp z, drawplayer_l1_right
dp_dead_l1:
    ld bc,playersprite_dead_road
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l2_end
drawplayer_l1_up:
    ld a,(player_current_frame)
    cp 0
    jp z,dpu0_l1
    cp 1
    jp z,dpu1_l1
    cp 2
    jp z,dpu2_l1
    cp 3
    jp z,dpu3_l1
dpu0_l1:
    ld bc,playersprite_up
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpu1_l1:
    ld bc,playersprite_up+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpu2_l1:
    ld bc,playersprite_up
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpu3_l1:
    ld bc,playersprite_up+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
drawplayer_l1_down:
    ld a,(player_current_frame)
    cp 0
    jp z,dpd0_l1
    cp 1
    jp z,dpd1_l1
    cp 2
    jp z,dpd2_l1
    cp 3
    jp z,dpd3_l1
dpd0_l1:
    ld bc,playersprite_down
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpd1_l1:
    ld bc,playersprite_down+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpd2_l1:
    ld bc,playersprite_down
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpd3_l1:
    ld bc,playersprite_down+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
drawplayer_l1_left:
    ld a,(player_current_frame)
    cp 0
    jp z,dpl0_l1
    cp 1
    jp z,dpl1_l1
    cp 2
    jp z,dpl2_l1
    cp 3
    jp z,dpl3_l1
dpl0_l1:
    ld bc,playersprite_left
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpl1_l1:
    ld bc,playersprite_left+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpl2_l1:
    ld bc,playersprite_left
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpl3_l1:
    ld bc,playersprite_left+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
drawplayer_l1_right:
    ld a,(player_current_frame)
    cp 0
    jp z,dpr0_l1
    cp 1
    jp z,dpr1_l1
    cp 2
    jp z,dpr2_l1
    cp 3
    jp z,dpr3_l1
dpr0_l1:
    ld bc,playersprite_right
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpr1_l1:
    ld bc,playersprite_right+48
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpr2_l1:
    ld bc,playersprite_right
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
dpr3_l1:
    ld bc,playersprite_right+96
    ld de,(playery)
    call drawplayer16_24
    jp drawplayer_l1_end
drawplayer_l1_end:
    call skip_to_next_frame
    ret