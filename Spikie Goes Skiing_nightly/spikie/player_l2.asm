PLAYER_START_X_L2 equ 12
PLAYER_START_Y_L2 equ 8


player_init_l2:
    ld a,PLAYER_START_X_L2
    ld (playerx),a
    ld de,PLAYER_START_Y_L2
    ld (player_ski_y),de
    ld a,PLAYER_START_FACING
    ld (player_direction),a



    ret

player_update_l2:
    
    ret

