L1_WHITELINE_Y equ 96
L1_WHITELINE_X equ 2
SPAWN_CHANCE_1 equ 150
MAX_SPAWN_CHANCE equ 240 ;nearer to 255 means more likely to spawn
SHOP_X equ 11
SHOP_Y equ 192-24
SHOP_W equ 6
SHOP_H equ 24
SHOP_DOOR_OFFSET equ 1
L1_PLAYER_START_FACING equ DOWN
L1_PLAYER_START_STATE equ NO_SKI
L1_PLAYER_START_X equ 8
L1_PLAYER_START_Y equ 0
L1_PLAYER_START_X_WITHSKI equ 4
L1_PLAYER_START_Y_WITHSKI equ 168
L1_PLAYER_START_FACING_WITHSKI equ UP
L1_PLAYER_START_STATE_WITHSKI equ WITH_SKI

current_spawn_chance db 50 ;255 is highest amount of spawns.

roadline_sprite:
    db %00000000
    db %00000000
    db %11111111
    db %11111111
    db %11111111
    db %11111111
    db %00000000
    db %00000000
;

; ASM data file from a ZX-Paintbrush picture with 48 x 24 pixels (= 6 x 3 characters)
; line based output of pixel data:
shop_sprite:
    db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
    db %00000000, %11111111, %11111111, %11111111, %11111111, %00000000
    db %00000001, %00001111, %11111111, %11111110, %11111111, %10000000
    db %00000010, %11110111, %11111111, %11111101, %11111111, %10000000
    db %00000101, %11111011, %11111111, %11111101, %11111111, %11000000
    db %00001011, %11111101, %11100000, %00000000, %00000011, %11100000
    db %00010111, %11111110, %11110000, %00000000, %00000011, %11100000
    db %00101111, %11111111, %01111111, %11110111, %11111111, %11110000
    db %01011111, %11111111, %10111111, %11110111, %11111111, %11111000
    db %10111111, %11111111, %11011111, %10000011, %11111111, %11111100
    db %01111111, %00000111, %11101111, %11111111, %11111111, %11111110
    db %11111110, %00000011, %11000000, %00000000, %00000000, %00000011
    db %11011110, %00000011, %11011111, %11111111, %11111111, %11111111
    db %00011110, %00000011, %11011111, %11000000, %11011101, %10111100
    db %00011110, %00000011, %11011111, %11011111, %11011011, %10111100
    db %00011110, %00000011, %11011111, %11011111, %11010111, %10111100
    db %00011110, %00000011, %11011111, %11000000, %11001111, %10111100
    db %00011110, %00000011, %11011111, %11111110, %11001111, %10111100
    db %00011110, %00000011, %11011111, %11111110, %11010111, %10111100
    db %00011110, %00000011, %11011111, %11111110, %11011011, %10111100
    db %00011110, %00000011, %11011111, %11000000, %11011101, %10111100
    db %00011110, %00000011, %11011111, %11111111, %11111111, %11111100
    db %00011110, %00000011, %11011111, %11111111, %11111111, %11111100
    db %00011110, %00000011, %11011111, %11111111, %11111111, %11111100
;

l1_start:
    ld a,RING_WALK
    ld (player_state),a

    ld a,3 ;player starting lives
    ld (cash_10),a
    xor a
    ld (score_1),a
    ld (score_10),a
    ld (score_100),a
    ld (score_1000),a
    ld (score_10000),a
    ld (score_100000),a

    call 0xDAF
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ld b,DEFAULT_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes
    call init_ui_labels
    call init_ui_numbers
    
    call randomise_all_car_timers
    
    call paint_background_l1
    
    
    call player_init_l1

    

    ; call sound_GSharp_0_25
    ; call sound_G_0_5
    ; call sound_G_0_375

    ret

l1_start_withski:
    call 0xDAF
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ld b,DEFAULT_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes
    call init_ui_labels
    call init_ui_numbers

    call paint_background_l1
    call player_start_l1_withski

    ; call sound_GSharp_0_25
    ; call sound_G_0_5
    ; call sound_G_0_375
    ret

l1_start_noski:
    call 0xDAF
    ld a,GAME_BORDER_COLOUR
    call 0x229B
    ld b,DEFAULT_SCREEN_COLOURS
    ld hl,ATTRIBUTE_MEMORY_START
    call paint_base_attributes
    call init_ui_labels
    call init_ui_numbers

    call paint_background_l1
    call player_start_l1_noski

    ; call sound_GSharp_0_25
    ; call sound_G_0_5
    ; call sound_G_0_375
    ret


l1_update:
    ld a,(veh_spawn_timer_l1)
    dec a
    ld (veh_spawn_timer_l1),a
    ld a,(veh_spawn_timer_l2)
    dec a
    ld (veh_spawn_timer_l2),a
    ld a,(veh_spawn_timer_l3)
    dec a
    ld (veh_spawn_timer_l3),a

    ld a,(veh_spawn_timer_r1)
    dec a
    ld (veh_spawn_timer_r1),a
    ld a,(veh_spawn_timer_r2)
    dec a
    ld (veh_spawn_timer_r2),a
    ld a,(veh_spawn_timer_r3)
    dec a
    ld (veh_spawn_timer_r3),a

    ld a,(veh_spawn_timer_l1)
    cp 0
    call z, spawn_vehicle_left_1

    ld a,(veh_spawn_timer_l2)
    cp 0
    call z, spawn_vehicle_left_2

    ld a,(veh_spawn_timer_l3)
    cp 0
    call z, spawn_vehicle_left_3

    ld a,(veh_spawn_timer_r1)
    cp 0
    call z, spawn_vehicle_right_1
    
    ld a,(veh_spawn_timer_r2)
    cp 0
    call z, spawn_vehicle_right_2

    ld a,(veh_spawn_timer_r3)
    cp 0
    call z, spawn_vehicle_right_3





    call vehicles_update

    call player_update


    call l1_draw
    ret








l1_draw:
  

    call vehicles_draw
    call l1_draw_whitelines

    call player_draw
    call l1_draw_shop


    ret


l1_draw_whitelines: 
    ld a,L1_WHITELINE_X
    ld d,a
    ld a,L1_WHITELINE_Y
    ld e,a
    call l1_drw_wl
    ret

l1_drw_wl:
    push de
    ld bc,roadline_sprite
    call drawsprite8_8
    pop de
    push de
    ld b,%01000111 ; white lines, black paper
    call paint_sprite_1_1
    pop de
    inc d
    inc d
    ld a,d
    cp GAME_WINDOW_WIDTH+BUFFER_SIDE_EXTRA
    jp c, l1_drw_wl
    ret

l1_draw_shop:
    ld bc, shop_sprite
    ld a,SHOP_X
    ld d,a
    ld a,SHOP_Y
    ld e,a
    call drawsprite48_24
    ld b,L1_SHOP_COLOUR
    ld d,SHOP_X
    ld e,SHOP_Y
    call paint_sprite_6_3
    ret






paint_background_l1:
    ld hl,ATTRIBUTE_MEMORY_START
    xor a
    ld c,a
    ld iyl,L1_PAVEMENT_COLOUR
    call pnt_bg_l1
    ret

;HL=0x5800
;iyl=first colour
pnt_bg_l1:
    ld a,h
    cp ATTRIBUTE_MEMORY_END_UB
    ret z
    ld a,c
    cp ROAD_START_LINE
    call nc,pnt_bg_setroadcolour
    cp ROAD_END_LINE
    call nc,pnt_bg_setpavementcolour
    ld b,GAME_WINDOW_WIDTH
    call paint_line
    ld de,SCREEN_WIDTH-GAME_WINDOW_WIDTH
    add hl,de
    inc c
    jp pnt_bg_l1
    ret

pnt_bg_setpavementcolour:
    ld iyl,L1_PAVEMENT_COLOUR
    ret
pnt_bg_setroadcolour:
    ld iyl,L1_ROAD_COLOUR
    ret


