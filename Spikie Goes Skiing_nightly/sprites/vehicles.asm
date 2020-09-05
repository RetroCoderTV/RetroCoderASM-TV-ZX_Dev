;vehicle types:
VEH_DEAD equ 0
VEH_BIKE equ 1
VEH_SALOON equ 2
VEH_TRUCK equ 3


VEH_COLOUR equ %01000110

;vehicle constants:
VEH_BIKE_WIDTH equ 2
VEH_BIKE_HEIGHT equ 2
VEH_SALOON_WIDTH equ 4
VEH_SALOON_HEIGHT equ 2

VEH_FAST_SPEED equ 248
VEH_MEDIUM_SPEED equ 124
VEH_SLOW_SPEED equ 62

VEH_SPEED_CLOCK_MAX equ 248

VEH_MAX_SPEED equ 3


VEH_LANE_R_1 equ 32
VEH_LANE_R_2 equ 56
VEH_LANE_R_3 equ 72
VEH_LANE_L_1 equ 112
VEH_LANE_L_2 equ 128
VEH_LANE_L_3 equ 144

VEH_DATA_LENGTH equ 8
;isAlive,x,y,w,h,speed,speedcounter,colour
vehicles_r_1:
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db 255

vehicles_r_2:
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db 255

vehicles_r_3:
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db 255

vehicles_l_1:
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db 255

vehicles_l_2:
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db 255

vehicles_l_3:
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0,0,0
    db 255




; ASM data file from a ZX-Paintbrush picture with 16 x 16 pixels (= 2 x 2 characters)
; line based output of pixel data:
sprite_bike_r:
    db %00000000, %01110000
    db %00000000, %11111000
    db %00000000, %11001000
    db %00000000, %11000000
    db %00000010, %00000000
    db %00001111, %00110011
    db %00011100, %00011111
    db %01111101, %10010010
    db %01111100, %01110010
    db %01000111, %10111110
    db %01111111, %00110110
    db %01011111, %01110011
    db %11010111, %01011001
    db %11000100, %01100001
    db %01101100, %00110011
    db %00111000, %00011110
;

; ASM data file from a ZX-Paintbrush picture with 32 x 16 pixels (= 4 x 2 characters)
; line based output of pixel data:
sprite_saloon_r:
    db %00000001, %11111111, %11111100, %00000000
    db %00000011, %11111111, %11111110, %00000000
    db %00001111, %11111111, %11110010, %00000000
    db %00011111, %11111111, %11000011, %00000000
    db %00011111, %11111111, %00000001, %10000000
    db %00110001, %00000110, %00000001, %10000000
    db %00110001, %00000011, %00000011, %11111100
    db %00110001, %00000011, %00001111, %11111110
    db %01100001, %00000001, %00111111, %11111111
    db %01111111, %11111111, %11111111, %11111111
    db %01111111, %11111111, %11111111, %11111110
    db %11111111, %11111111, %11111111, %11111100
    db %11100111, %11111111, %11110011, %11110000
    db %11011011, %11111111, %11101101, %11000000
    db %00111100, %00000000, %00011110, %00000000
    db %00011000, %00000000, %00001100, %00000000
;

; ASM data file from a ZX-Paintbrush picture with 56 x 24 pixels (= 7 x 3 characters)
; line based output of pixel data:
sprite_truck_r:
    db %00000000, %00000111, %11111111, %11111111, %11111111, %11111110, %00000000
    db %00000000, %00011000, %00000000, %00000000, %00000000, %00001110, %00000000
    db %00000000, %01100111, %10111111, %00001110, %00000111, %00110010, %00000000
    db %00000001, %10011101, %11001110, %00111111, %11111100, %11000010, %00000000
    db %00000110, %01110000, %00111000, %11100000, %01110011, %00000000, %00000000
    db %00011001, %11000000, %11100011, %10000001, %11001100, %00000111, %11000000
    db %01100000, %00000000, %00000000, %00000000, %00110000, %00011111, %11110000
    db %11111111, %11111111, %11111111, %11111111, %11000000, %01111111, %11110000
    db %10000000, %00000000, %00000000, %00000000, %01000001, %11111111, %11111000
    db %10100100, %11001110, %01110000, %00000000, %01000111, %11111111, %10011000
    db %10100101, %00101001, %01001000, %00000000, %01011111, %11111110, %00011000
    db %10111101, %11101110, %01001000, %00000000, %01011111, %11111110, %00011000
    db %10100101, %00101011, %01110000, %00000000, %01011111, %10011110, %00011100
    db %10000000, %00000100, %00001100, %11100111, %01011111, %10001110, %00111100
    db %10000000, %00000100, %01010010, %10010100, %01011111, %10001111, %11111110
    db %10000000, %00000101, %01011110, %11100110, %01011111, %10001111, %11111111
    db %10000000, %00000010, %10010010, %10110111, %01011111, %11111111, %11111011
    db %10000000, %00000000, %00000000, %00000000, %01011111, %11111111, %11110001
    db %11111111, %11111111, %11111111, %11000000, %01111111, %11111111, %10111011
    db %00010000, %00000000, %00000000, %00111111, %11011011, %10011111, %00011110
    db %00110110, %00110000, %00000000, %00011000, %00011110, %01100111, %10111100
    db %01101111, %01111000, %00000000, %00111100, %00011110, %11110111, %11110000
    db %01001111, %01111000, %00000000, %00111100, %00011110, %11110111, %11000000
    db %00000110, %00110000, %00000000, %00011000, %00000000, %01100000, %00000000
;

; ASM data file from a ZX-Paintbrush picture with 32 x 16 pixels (= 4 x 2 characters)
; line based output of pixel data:


; ASM data file from a ZX-Paintbrush picture with 16 x 16 pixels (= 2 x 2 characters)
; line based output of pixel data:
sprite_bike_l:
    db %00001110, %00000000
    db %00011111, %00000000
    db %00010011, %00000000
    db %00000011, %00000000
    db %00000000, %01000000
    db %11001100, %11110000
    db %11111000, %00111000
    db %01001001, %10111110
    db %01001110, %00111110
    db %01111101, %11100010
    db %01101100, %11111110
    db %11001110, %11111010
    db %10011010, %11101011
    db %10000110, %00100011
    db %11001100, %00110110
    db %01111000, %00011100
;
sprite_saloon_l:
    db %00000000, %00111111, %11111111, %10000000
    db %00000000, %01111111, %11111111, %11000000
    db %00000000, %01001111, %11111111, %11110000
    db %00000000, %11000011, %11111111, %11111000
    db %00000001, %10000000, %11111111, %11111000
    db %00000001, %10000000, %01100000, %10001100
    db %00111111, %11000000, %11000000, %10001100
    db %01111111, %11110000, %11000000, %10001100
    db %11111111, %11111100, %10000000, %10000110
    db %11111111, %11111111, %11111111, %11111110
    db %01111111, %11111111, %11111111, %11111110
    db %00111111, %11111111, %11111111, %11111111
    db %00001111, %11001111, %11111111, %11100111
    db %00000011, %10110111, %11111111, %11011011
    db %00000000, %01111000, %00000000, %00111100
    db %00000000, %00110000, %00000000, %00011000
;

; ASM data file from a ZX-Paintbrush picture with 56 x 24 pixels (= 7 x 3 characters)
; line based output of pixel data:
sprite_truck_l:
    db %00000000, %01111111, %11111111, %11111111, %11111111, %11100000, %00000000
    db %00000110, %01110000, %00000000, %00000000, %00000000, %00011000, %00000000
    db %00000100, %01001100, %11100000, %01110000, %11111101, %11100110, %00000000
    db %00000100, %01000011, %00111111, %11111100, %01110011, %10111001, %10000000
    db %00000100, %00000000, %11001110, %00000111, %00011100, %00001110, %01100000
    db %00000111, %11100000, %00110011, %10000001, %11000111, %00000011, %10011000
    db %00001111, %11111000, %00001100, %00000000, %00000000, %00000000, %00000110
    db %00001111, %11111110, %00000011, %11111111, %11111111, %11111111, %11111111
    db %00011111, %11111111, %10000010, %00000000, %00000000, %00000000, %00000001
    db %00011001, %11111111, %11100010, %11001110, %11101100, %11100000, %11110101
    db %00011000, %01111111, %11111010, %10101100, %01001010, %10100000, %01010101
    db %00011000, %01111111, %11111010, %11001000, %01001100, %11100000, %01010101
    db %00111000, %01111001, %11111010, %10101110, %01001010, %00000000, %01001001
    db %00111100, %01110001, %11111010, %00000000, %00000000, %00011101, %10000001
    db %01111111, %11110001, %11111010, %00000001, %11011101, %10011001, %01000001
    db %11111111, %11110001, %11111010, %00000001, %00010101, %01010001, %10000001
    db %11011111, %11111111, %11111010, %00000001, %11011101, %10011101, %01000001
    db %10001111, %11111111, %11111010, %00000000, %00000000, %00000000, %00000001
    db %11011101, %11111111, %11111110, %00000011, %11111111, %11111111, %11111111
    db %01111000, %11111001, %11011011, %11111100, %00000000, %00000000, %00001000
    db %00111101, %11100110, %01111000, %00011000, %00000000, %00001100, %01101100
    db %00001111, %11101111, %01111000, %00111100, %00000000, %00011110, %11110110
    db %00000011, %11101111, %01111000, %00111100, %00000000, %00011110, %11110010
    db %00000000, %00000110, %00000000, %00011000, %00000000, %00001100, %01100000
;


spawn_vehicle_right_1:
    call rand
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_r_1
    ld b,VEH_LANE_R_1
    call spwn_veh_r
    ret

spawn_vehicle_right_2:
    call rand
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_r_2
    ld b,VEH_LANE_R_2
    call spwn_veh_r
    ret

spawn_vehicle_right_3:
    call rand
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_r_3
    ld b,VEH_LANE_R_3
    call spwn_veh_r
    ret


spawn_vehicle_left_1:
    call rand
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_l_1
    ld b,VEH_LANE_L_1
    call spwn_veh_l
    ret

spawn_vehicle_left_2:
    call rand
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_l_2
    ld b,VEH_LANE_L_2
    call spwn_veh_l
    ret

spawn_vehicle_left_3:
    call rand
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_l_3
    ld b,VEH_LANE_L_3
    call spwn_veh_l
    ret






spwn_veh_r:
    ld a,(ix)
    cp 255
    ret z
    cp VEH_DEAD
    jp z,spwn_veh_r_do_spawn
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp spwn_veh_r
spwn_veh_r_do_spawn:
    ld a,r
    and %00000111
    cp 0
    jp z, spwn_veh_r_do_spawn
    cp 7
    jp z, spwn_veh_r_do_spawn
    ld (ix+7),a
    call rand
    cp FIFTY50
    jp c, spwn_veh_now
    ld a,(ix+7)
    add a,64 ;add bright bit
    ld (ix+7),a
spwn_veh_now:
    ld a,r
    cp FIFTY50
    push af
    call c,spwn_saloon_r
    pop af
    call nc,spwn_bike_r
    ret

spwn_bike_r:
    ld a,VEH_BIKE
    ld (ix),a
    xor a
    ld (ix+1),a
    ;
    ld (ix+2),b
    ld a,VEH_BIKE_WIDTH
    ld (ix+3),a
    ld a,VEH_BIKE_HEIGHT
    ld (ix+4),a
    ld a,r
    cp FIFTY50
    call c, spwn_set_bike_speed_half
    call nc, spwn_set_bike_speed_full
    xor a
    ld (ix+6),a
    ret



spwn_saloon_r:
    ld a,VEH_SALOON
    ld (ix),a
    xor a
    ld (ix+1),a
    ld (ix+2),b
    ld a,VEH_SALOON_WIDTH
    ld (ix+3),a
    ld a,VEH_SALOON_HEIGHT
    ld (ix+4),a
    call rand
    cp FIFTY50
    call c, spwn_set_saloon_speed_half
    call nc, spwn_set_saloon_speed_full
    xor a
    ld (ix+6),a
    ret



spwn_truck_r:
    ret



spawn_vehicle_left:
    ld a,r
    cp SPAWN_CHANCE_1
    ret c
    ld ix,vehicles_l_1
    call spwn_veh_l
    ret

spwn_veh_l:
    ld a,(ix)
    cp 255
    ret z
    cp VEH_DEAD
    jp z,spwn_veh_l_do_spawn
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp spwn_veh_l
spwn_veh_l_do_spawn:
    call rand
    and %00000111
    cp 0
    jp z, spwn_veh_l_do_spawn
    cp 7
    jp z, spwn_veh_l_do_spawn
    ld (ix+7),a
    call rand
    cp FIFTY50
    jp c, spwn_veh_now
    ld a,(ix+7)
    add a,64 ;add bright bit
    ld (ix+7),a
    ld a,r
    cp FIFTY50
    push af
    call c,spwn_saloon_l
    pop af
    call nc,spwn_bike_l
    ret

spwn_bike_l:
    ld a,VEH_BIKE
    ld (ix),a
    ld a,MAX_X-1
    ld (ix+1),a
    ld (ix+2),b
    ld a,VEH_BIKE_WIDTH
    ld (ix+3),a
    ld a,VEH_BIKE_HEIGHT
    ld (ix+4),a
    ld a,r
    cp FIFTY50
    call c, spwn_set_bike_speed_half
    call nc, spwn_set_bike_speed_full
    xor a
    ld (ix+6),a
    ret

spwn_saloon_l:
    ld a,VEH_SALOON
    ld (ix),a
    ld a,MAX_X
    ld (ix+1),a
    ld (ix+2),b
    ld a,VEH_SALOON_WIDTH
    ld (ix+3),a
    ld a,VEH_SALOON_HEIGHT
    ld (ix+4),a
    ld a,r
    cp FIFTY50
    call c, spwn_set_saloon_speed_half
    call nc, spwn_set_saloon_speed_full
    xor a
    ld (ix+6),a
    ret


spwn_set_bike_speed_full:
    ld a,VEH_FAST_SPEED
    ld (ix+5),a
    ret
spwn_set_bike_speed_half:
    ld a,VEH_MEDIUM_SPEED
    ld (ix+5),a
    ret
spwn_set_saloon_speed_full:
    ld a,VEH_MEDIUM_SPEED
    ld (ix+5),a
    ret
spwn_set_saloon_speed_half:
    ld a,VEH_SLOW_SPEED
    ld (ix+5),a
    ret

spwn_truck_l:
    ret



vehicles_update:
    
    ld ix,vehicles_r_1
    call veh_move_cars_r
    ld ix,vehicles_r_2
    call veh_move_cars_r
    ld ix,vehicles_r_3
    call veh_move_cars_r

    ld ix,vehicles_l_1
    call veh_move_cars_l
    ld ix,vehicles_l_2
    call veh_move_cars_l
    ld ix,vehicles_l_3
    call veh_move_cars_l

    ret

vehicles_draw:
    ld ix,vehicles_r_1
    call veh_draw_r
    ld ix,vehicles_r_2
    call veh_draw_r
    ld ix,vehicles_r_3
    call veh_draw_r

    ld ix,vehicles_l_1
    call veh_draw_l
    ld ix,vehicles_l_2
    call veh_draw_l
    ld ix,vehicles_l_3
    call veh_draw_l
    ret



veh_move_cars_r:
    ld a,(ix)
    cp 255
    ret z
    ld a,(ix)
    cp VEH_DEAD
    jp z,vm_next_r
    ld a,(ix+1)
    cp MAX_X
    jp nc,vm_kill_r
    ld a,(ix+6)
    add a,(ix+5)
    ld (ix+6),a
    cp VEH_SPEED_CLOCK_MAX
    jp c,vm_next_r
    ld a,(ix+1)
    add a,VEH_MAX_SPEED
    ld (ix+1),a
    xor a
    ld (ix+6),a
vm_next_r:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_move_cars_r
vm_kill_r:
    ld a,VEH_DEAD
    ld (ix),a
    jp vm_next_r
veh_move_cars_l:
    ld a,(ix)
    cp 255
    ret z
    ld a,(ix)
    cp VEH_DEAD
    jp z,vm_next_l
    ld a,(ix+1)
    cp MIN_X+1
    jp c,vm_kill_l
    ld a,(ix+6)
    add a,(ix+5)
    ld (ix+6),a
    cp VEH_SPEED_CLOCK_MAX
    jp c,vm_next_l
    ld a,(ix+1)
    add a,-VEH_MAX_SPEED
    ld (ix+1),a
    xor a
    ld (ix+6),a
vm_next_l:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_move_cars_l
vm_kill_l:
    ld a,VEH_DEAD
    ld (ix),a
    jp vm_next_l


;ix=vehs
veh_draw_r:
    ld a,(ix)
    cp 255
    jp z,vd_end
    cp VEH_DEAD
    jp z,vd_next_r
    cp VEH_BIKE
    jp z,vd_bike_r
    cp VEH_SALOON
    jp z,vd_saloon_r
    cp VEH_TRUCK
    jp z,vd_truck_r
vd_bike_r:
    ld bc,sprite_bike_r
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call drawsprite16_16
    ld b,(ix+7)
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call paint_sprite_2_2

    jp vd_next_r
vd_saloon_r:
    ld bc,sprite_saloon_r
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call drawsprite32_16
    ld b,(ix+7)
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call paint_sprite_4_2
    jp vd_next_r
vd_truck_r:
    ; ld bc,sprite_truck
    ; ld a,(ix+1)
    ; ld d,a
    ; ld a,(ix+2)
    ; ld e,a
    ; todo: make drawsprite56_24    
    jp vd_next_r
vd_next_r:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_draw_r
veh_draw_l:
    ld a,(ix)
    cp 255
    jp z,vd_end
    cp VEH_DEAD
    jp z,vd_next_l
    cp VEH_BIKE
    jp z,vd_bike_l
    cp VEH_SALOON
    jp z,vd_saloon_l
    cp VEH_TRUCK
    jp z,vd_truck_l
vd_bike_l:
    ld bc,sprite_bike_l
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call drawsprite16_16
    ld b,(ix+7)
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call paint_sprite_2_2
    jp vd_next_l
vd_saloon_l:
    ld bc,sprite_saloon_l
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call drawsprite32_16
    ld b,(ix+7)
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call paint_sprite_4_2
    jp vd_next_l
vd_truck_l:
    ; ld bc,sprite_truck
    ; ld a,(ix+1)
    ; ld d,a
    ; ld a,(ix+2)
    ; ld e,a
    ; todo: make drawsprite56_24    
    jp vd_next_l
vd_next_l:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_draw_l
vd_end:
    ret



