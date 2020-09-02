


player_update_l1:
    call check_keys

    call player_check_collision_shop
    
    ld ix,vehicles_r
    call player_check_collision_cars

    ld ix,vehicles_l
    call player_check_collision_cars

    call plyr_upd_noski_l1
    ; ld a,(player_state)
    ; cp NO_SKI
    ; call z, plyr_upd_noski_l1
    ; cp WITH_SKI
    ; call z, plyr_upd_withski_l1


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
    ret



;these move the targetpos. call them on keypress for example
try_move_left_l1:
    ld a,LEFT
    ld (player_direction),a
    ld a,(playerx)
    cp MIN_X
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
    cp MAX_X
    ret nc
    ld a,(playerx)
    add a,PLAYER_SPEED_X
    ld (playerx),a
    ret

try_move_up_l1:
    ld a,UP
    ld (player_direction),a
    ld a,(playery)
    cp MIN_Y
    ret c
    ld a,(playery)
    sub PLAYER_SPEED_Y
    ld (playery),a

    
    ret

try_move_down_l1:
    ld a,DOWN
    ld (player_direction),a
    ld a,(playery)
    cp MAX_Y
    ret nc
    ld a,(playery)
    add a,PLAYER_SPEED_Y
    ld (playery),a

    ret
;




;INPUT:
;IX=cars
player_check_collision_cars:
    ld a,(ix)
    cp 255
    ret z
    cp VEH_DEAD
    jp z, plyr_chk_coll_cars_next


    ld a,(playerx)
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, plyr_chk_coll_cars_next

    ld a,(ix+1)
    ld b,a
    ld a,(playerx)
    add a,PLAYER_WIDTH
    cp b
    jp c, plyr_chk_coll_cars_next


    ld a,(playery)
    ld b,a
    ld a,(ix+2)
    add a,(ix+4)
    cp b
    jp c, plyr_chk_coll_cars_next
    
    ld a,(ix+2)
    ld b,a
    ld a,(playery)
    add a,PLAYER_HEIGHT
    cp b
    jp c, plyr_chk_coll_cars_next

    ; ;else, we collided....
    ; call setborderpink
    
    ret
plyr_chk_coll_cars_next:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp player_check_collision_cars



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

    ret





