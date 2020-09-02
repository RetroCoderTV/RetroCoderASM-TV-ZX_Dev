;vehicle types:
VEH_DEAD equ 0
VEH_BIKE equ 1
VEH_SALOON equ 2
VEH_TRUCK equ 3

;vehicle constants:
VEH_BIKE_WIDTH equ 2
VEH_BIKE_HEIGHT equ 2
VEH_BIKE_SPEED equ 2
VEH_SALOON_WIDTH equ 4
VEH_SALOON_HEIGHT equ 2
VEH_SALOON_SPEED equ 1

VEH_DATA_LENGTH equ 6
;isAlive,x,y,w,h,speed
vehicles_r:
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db VEH_DEAD,0,0,0,0,0
    db 255


; ASM data file from a ZX-Paintbrush picture with 16 x 16 pixels (= 2 x 2 characters)
; line based output of pixel data:
sprite_bike:
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
sprite_saloon:
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
sprite_truck:
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


spawn_vehicle_right:
    ld ix,vehicles_r
    call spwn_veh_r
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
    call getrandom
    cp FIFTY50
    push af
    call c,spwn_saloon
    pop af
    call nc,spwn_bike
    ret


spwn_bike:
    ld a,VEH_BIKE
    ld (ix),a
    xor a
    ld (ix+1),a
    call getrandom
    and %00011111
    ld b,a
    call getrandom
    and %00001111
    add a,b
    ld b,a
    ld a, LANE_1_Y
    add a,b
    ld (ix+2),a
    ld a,VEH_BIKE_WIDTH
    ld (ix+3),a
    ld a,VEH_BIKE_HEIGHT
    ld (ix+4),a
    ld a,VEH_BIKE_SPEED
    ld (ix+5),a
    ret

spwn_saloon:
    ld a,VEH_SALOON
    ld (ix),a
    xor a
    ld (ix+1),a
    call getrandom
    and %00011111
    ld b,a
    call getrandom
    and %00001111
    add a,b
    ld b,a
    ld a, LANE_1_Y
    add a,b
    ld (ix+2),a
    ld a,VEH_SALOON_WIDTH
    ld (ix+3),a
    ld a,VEH_SALOON_HEIGHT
    ld (ix+4),a
    ld a,VEH_SALOON_SPEED
    ld (ix+5),a
    ret

spwn_truck:
    ret





vehicles_update:
    
    ld ix,vehicles_r
    call veh_move_cars

    ld iy,vehicles_r
    call vehicle_check_collisions
    ret

vehicles_draw:
    ld ix,vehicles_r
    call veh_draw
    ret



veh_move_cars:
    ld a,(ix)
    cp 255
    ret z
    ld a,(ix)
    cp VEH_DEAD
    jp z,vm_next
    ld a,(ix+1)
    cp MAX_X
    jp nc,vm_kill
    ld b,a
    ld a,(ix+5)
    add a,b
    ld (ix+1),a
    ;check for collisions

vm_next:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_move_cars
vm_kill:
    ld a,VEH_DEAD
    ld (ix),a
    jp vm_next

;IY=vehicles
vehicle_check_collisions:
    ld a,(iy)
    cp 255
    ret z
    ld a,(iy)
    cp VEH_DEAD
    jp z,vc_next
    ld ix,vehicles_r
    ld a,(iy)
    push af
    ld a,VEH_DEAD
    ld (iy),a
    call veh_check_collisions
    pop af
    ld (iy),a
vc_next:
    ld de,VEH_DATA_LENGTH
    add iy,de
    jp vehicle_check_collisions
    

;IX=cars
;DE= car xy
veh_check_collisions:  
    ld a,(ix)
    cp 255
    ret z

    ld a,(ix)
    cp VEH_DEAD
    jp z, veh_chk_coll_next


    ld a,(iy+1)
    add a,(iy+3)
    ld b,a
    ld a,(ix+1)
    add a,(ix+3)
    cp b
    jp c, veh_chk_coll_next
    
    ld a,(ix+2)
    ld b,a
    ld a,(iy+2)
    add a,(iy+4)
    cp b
    jp c, veh_chk_coll_next

    ld a,(ix+2)
    add a,(ix+4)
    ld b,a
    ld a,(iy+2)
    add a,(iy+4)
    cp b
    jp nc, veh_chk_coll_next

    ; ;else, we collided....
    call setborderpink
    ret
veh_chk_coll_next:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_check_collisions

;ix=vehs
veh_draw:
    ld a,(ix)
    cp 255
    jp z,vd_end
    cp VEH_DEAD
    jp z,vd_next
    cp VEH_BIKE
    jp z,vd_bike
    cp VEH_SALOON
    jp z,vd_saloon
    cp VEH_TRUCK
    jp z,vd_truck
vd_bike:
    ld bc,sprite_bike
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call drawsprite16_16
    jp vd_next
vd_saloon:
    ld bc,sprite_saloon
    ld a,(ix+1)
    ld d,a
    ld a,(ix+2)
    ld e,a
    call drawsprite32_16
    jp vd_next
vd_truck:
    ; ld bc,sprite_truck
    ; ld a,(ix+1)
    ; ld d,a
    ; ld a,(ix+2)
    ; ld e,a
    ; todo: make drawsprite56_24    
    jp vd_next
vd_next:
    ld de,VEH_DATA_LENGTH
    add ix,de
    jp veh_draw
vd_end:
    ret
