ENTRY_POINT &6000

    org ENTRY_POINT

;constants:
YELLOW equ %00110001 ;yellow attribute
YELLOB equ %01110001 ;yellow + bright bit set

;main game code:

;cls to give green around edges
    ld hl,23693 ; system variable for attributes.
    ld (hl),36 ; want green background.
waitk: 
    ld a,(23560) ; read keyboard.
    cp 32 ; is SPACE pressed?
    jr nz,waitk ; no, wait.
    call nexlev ; play the game.
    jr waitk ; SPACE to restart game.

; Clear down level data.
nexlev 
    call 3503 ; clear the screen.
    ld hl,rmdat ; room data.
    ld de,rmdat+1
    ld (hl),1 ; set up a shadow block.
    ld bc,16 ; length of room minus first byte.
    ldir ; copy to rest of first row.
    ld bc,160 ; length of room minus first row.
    ld (hl),b ; clear first byte.
    ldir ; clear room data.
    ; Set up the default blocks.
    ld c,15 ; last block position.
popbl0 
    ld b,9 ; last row.
popbl1 
    call filblk ; fill the block.
    dec b ; one column up.
    jr z,popbl2 ; done column, move on.
    dec b ; and again.
    jr popbl1
popbl2 
    dec c ; move on row.
    jr z,popbl3 ; done column, move on.
    dec c ; next row.
    jr popbl0
    ; Now draw the bits unique to this level.
popbl3 
    ld b,7 ; number of blocks to insert.
popbl5 
    push bc ; store counter.
    call random ; get a random number.
    and 6 ; even numbers in range 0-6 please.
    add a,2 ; make it 2-8.
    ld b,a ; that's the column.
popbl4 
    call random ; another number.
    and 14 ; even numbers 0-12 wanted.
    cp 14 ; higher than we want?
    jr nc,popbl4 ; yes, try again.
    inc a ; place it in range 1-13.
    ld c,a ; that's the row.
    call filblk ; fill block.
popbl6 
    call random ; another random number.
    and 14 ; only want 0-8.
    cp 9 ; above number we want?
    jr nc,popbl6 ; try again.
    inc a ; make it 1-9.
    ld b,a ; vertical coordinate.
    call random ; get horizontal block.
    and 14 ; even, 0-14.
    ld c,a ; y position.
    call filblk ; fill in that square.
    pop bc ; restore count.
    djnz popbl5 ; one less to do.
    xor a ; zero.
    ld hl,playi ; player's intended direction.
    ld (hl),a ; default direction.
    inc hl ; point to display direction.
    ld (hl),a ; default direction.
    inc hl ; player's next direction.
    ld (hl),a ; default direction.
    out (254),a ; set border colour while we're at it.
    call atroom ; show current level layout.
    ld hl,168+8*256 ; coordinates.
    ld (encar2+1),hl ; set up second car position.
    ld h,l ; y coord at right.
    ld (encar1+1),hl ; set up first car position.
    ld l,40 ; x at top of screen.
    ld (playx),hl ; start player off here.
    ld hl,encar1 ; first car.
    call scar ; show it.
    ld hl,encar2 ; second car.
    call scar ; show it.
    call dplayr ; show player sprite.
    call blkcar ; make player's car black.
; Two-second delay before we start.
    ld b,100 ; delay length.
waitt 
    halt ; wait for interrupt.
    djnz waitt ; repeat.
mloop 
    halt ; electron beam in top left.
    call dplayr ; delete player.
    ; Make attributes blue ink again.
    call gpatts ; get player attributes.
    defb 17,239,41 ; remove green paper, add blue paper + ink.
    call attblk ; set road colours.
    ; Move player's car.
    ld a,(playd) ; player direction.
    ld bc,(playx) ; player coordinates.
    call movc ; move coords.
    ld hl,(dispx) ; new coords.
    ld (playx),hl ; set new player position.
    ; Can we change direction?
    ld a,(playi) ; player's intended direction.
    ld bc,(playx) ; player coordinates.
    call movc ; move coords.
    call z,setpn ; set player's new direction.
    ; Change direction.
    ld a,(nplayd) ; new player direction.
    ld (playd),a ; set current direction.
    call dplayr ; redisplay at new position.
    ; Set attributes of car.
    call blkcar ; make player car black.
; Controls.
    ld a,239 ; keyboard row 6-0 = 61438.
    ld e,1 ; direction right.
    in a,(254) ; read keys.
    rra ; player moved right?
    call nc,setpd ; yes, set player direction.
    ld e,3 ; direction left.
    rra ; player moved left?
    call nc,setpd ; yes, set player direction.
    ld a,247 ; 63486 is port for row 1-5.
    ld e,0 ; direction up.
    in a,(254) ; read keys.
    and 2 ; check 2nd key in (2).
    call z,setpd ; set direction.
    ld a,251 ; 64510 is port for row Q-T.
    ld e,2 ; direction down.
    in a,(254) ; read keys.
    and e ; check 2nd key from edge (W)..
    call z,setpd ; set direction.
    ; Enemy cars.
    ld hl,encar1 ; enemy car 1.
    push hl ; store pointer.
    call procar ; process the car.
    pop hl ; restore car pointer.
    call coldet ; check for collisions.
    ld hl,encar2 ; enemy car 2.
    push hl ; store pointer.
    halt ; synchronise with display.
    call procar ; process the car.
    pop hl ; restore car pointer.
    call coldet ; check for collisions.
    ; Count remaining yellow spaces.
    ld hl,22560 ; address.
    ld bc,704 ; attributes to count.
    ld a,YELLOB ; attribute we're seeking.
    cpir ; count characters.
    ld a,b ; high byte of result.
    or c ; combine with low byte.
    jp z,nexlev ; none left, go to next level.
    ; End of main loop.
    jp mloop
    ; Black car on cyan paper.
blkcar call gpatts ; get player attributes.
    defb 17,232,40 ; remove red paper/blue ink, add blue paper.
    ; Set 16x16 pixel attribute block.
attblk call attlin ; paint horizontal line.
    call attlin ; paint another line.
    ld a,c ; vertical position.
    and 7 ; is it straddling cells?
    ret z ; no, so no third line.
attlin call setatt ; paint the road.
    call setatt ; and again.
    ld a,b ; horizontal position.
    and 7 ; straddling blocks?
    jr z,attln0 ; no, leave third cell as it is.
    call setatt ; set attribute.
    dec l ; back one cell again.
attln0 push de ; preserve colours.
    ld de,30 ; distance to next one.
    add hl,de ; point to next row down.
    pop de ; restore colour masks.
    ret
    ; Set single cell attribute.
setatt ld a,(hl) ; fetch attribute cell contents.
    and e ; remove colour elements in c register.
    or d ; add those in b to form new colour.
    ld (hl),a ; set colour.
    inc l ; next cell.
    ret
    ; Collision detection, based on coordinates.
coldet call getabc ; get coords.
    ld a,(playx) ; horizontal position.
    sub c ; compare against car x.
    jr nc,coldt0 ; result was positive.
    neg ; it was negative, reverse sign.
coldt0 cp 16 ; within 15 pixels?
    ret nc ; no collision.
    ld a,(playy) ; player y.
    sub b ; compare against car y.
    jr nc,coldt1 ; result was positive.
    neg ; it was negative, reverse sign.
coldt1 cp 16 ; within 15 pixels?
    ret nc ; no collision.
    pop de ; remove return address from stack.
    ret
setpd ex af,af'
    ld a,e ; direction.
    ld (playi),a ; set intended direction.
    ex af,af'
    ret
setpn ld a,(playi) ; new intended direction.
    ld (nplayd),a ; set next direction.
    ret
    ; Move coordinates of sprite in relevant direction.
movc ld (dispx),bc ; default position.
    and a ; direction zero.
    jr z,movcu ; move up.
    dec a ; direction 1.
    jr z,movcr ; move up.
    dec a ; direction 2.
    jr z,movcd ; move up.
movcl dec b ; left one pixel.
    dec b ; left again.
movc0 call chkpix ; check pixel attributes.
    ld (dispx),bc ; new coords.
    ret
movcu dec c ; up a pixel.
    dec c ; and again.
    jr movc0
movcr inc b ; right one pixel.
    inc b ; right again.
    jr movc0
movcd inc c ; down a pixel.
    inc c ; once more.
    jr movc0
    ; Check pixel attributes for collision.
    ; Any cells with green ink are solid.
chkpix 
    call ataddp ; get pixel attribute address.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    inc hl ; next square to the right.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    inc hl ; next square to the right.
    ld a,b ; horizontal position.
    and 7 ; straddling cells?
    jr z,chkpx1 ; no, look down next.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
chkpx1 ld de,30 ; distance to next cell down.
    add hl,de ; point there.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    inc hl ; next square to the right.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    inc hl ; next square to the right.
    ld a,b ; horizontal position.
    and 7 ; straddling cells?
    jr z,chkpx2 ; no, look down next.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
chkpx2 ld a,c ; distance from top of screen.
    and 7 ; are we straddling cells vertically?
    ret z ; no, move is therefore okay.
    add hl,de ; point there.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    inc hl ; next square to the right.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    inc hl ; next square to the right.
    ld a,b ; horizontal position.
    and 7 ; straddling cells?
    ret z ; no, move is fine.
    ld a,(hl) ; get attributes.
    and 4 ; check ink colours.
    jr nz,chkpx0 ; invalid, block the move.
    ret ; go ahead.
chkpx0 pop de ; remove return address from stack.
    ret
    ; Fill a block in the map.
    ; Get block address.
filblk ld a,b ; row number.
    rlca ; multiply by 16.
    rlca
    rlca
    rlca
    add a,c ; add to displacement total.
    ld e,a ; that's displacement low.
    ld d,0 ; no high byte required.
    ld hl,rmdat ; room data address.
    add hl,de ; add to block address.
    ; Block address is in hl, let's fill it.
    ld (hl),2 ; set block on.
    ld de,16 ; distance to next block down.
    add hl,de ; point there.
    ld a,(hl) ; check it.
    and a ; is it set yet?
    ret nz ; yes, don't overwrite.
    ld (hl),1 ; set the shadow.
    ret
    ; Draw a screen consisting entirely of attribute blocks.
atroom ld hl,rmdat ; room data.
    ld a,1 ; start at row 1.
    ld (dispx),a ; set up coordinate.
    ld b,11 ; row count.
atrm0 push bc ; store counter.
    ld b,15 ; column count.
    ld a,1 ; column number.
    ld (dispy),a ; set to left of screen.
atrm1 push bc ; store counter.
    ld a,(hl) ; get next block type.
    push hl ; store address of data.
    rlca ; double block number.
    rlca ; and again for multiple of 4.
    ld e,a ; displacement to block address.
    ld d,0 ; no high byte required.
    ld hl,blkatt ; block attributes.
    add hl,de ; point to block we want.
    call atadd ; get address for screen position.
    ldi ; transfer first block.
    ldi ; and the second.
    ld bc,30 ; distance to next row.
    ex de,hl ; switch cell and screen address.
    add hl,bc ; point to next row down.
    ex de,hl ; switch them back.
    ldi ; do third cell.
    ldi ; fourth attribute cell.
    ld hl,dispy ; column number.
    inc (hl) ; move across one cell.
    inc (hl) ; and another.
    pop hl ; restore room address.
    pop bc ; restore column counter.
    inc hl ; point to next block.
    djnz atrm1 ; do rest of row.
    inc hl ; skip one char so lines are round 16.
    ld a,(dispx) ; vertical position.
    add a,2 ; look 2 cells down.
    ld (dispx),a ; new row.
    pop bc ; restore column counter.
    djnz atrm0 ; do remaining rows.
    ret
    ; Background block attributes.
blkatt defb YELLOB,YELLOB ; space.
    defb YELLOB,YELLOB
    defb YELLOW,YELLOW ; shadow space.
    defb YELLOB,YELLOB
    defb 124,68 ; black/white chequered flag pattern.
    defb 68,124
    ; Calculate address of attribute for character at (dispx, dispy).
atadd push hl ; need to preserve hl pair.
    ld hl,(dispx) ; coords to check, in char coords.
    add hl,hl ; multiply x and y by 8.
    add hl,hl
    add hl,hl
    ld b,h ; copy y coord to b.
    ld c,l ; put x coord in c.
    call ataddp ; get pixel address.
    ex de,hl ; put address in de.
    pop hl ; restore hl.
    ret
    ; Get player attributes.
gpatts ld bc,(playx) ; player coordinates.
; Calculate address of attribute for pixel at (c, b).
ataddp ld a,c ; Look at the vertical first.
    rlca ; divide by 64.
    rlca ; quicker than 6 rrca operations.
    ld l,a ; store in l register for now.
    and 3 ; mask to find segment.
    add a,88 ; attributes start at 88*256=22528.
    ld h,a ; that's our high byte sorted.
    ld a,l ; vertical/64 - same as vertical*4.
    and 224 ; want a multiple of 32.
    ld l,a ; vertical element calculated.
    ld a,b ; get horizontal position.
    rra ; divide by 8.
    rra
    rra
    and 31 ; want result in range 0-31.
    add a,l ; add to existing low byte.
    ld l,a ; that's the low byte done.
    ld a,(hl) ; get cell contents.
    ret ; attribute address now in hl.
    ; Move car - change of direction required.
mcarcd ld a,(hl) ; current direction.
    inc a ; turn clockwise.
    and 3 ; only 4 directions.
    ld (hl),a ; new direction.
    ; Move an enemy car.
mcar push hl ; preserve pointer to car.
    call getabc ; fetch coordinates and direction.
    call movc ; move the car.
    pop hl ; refresh car pointer.
    jr nz,mcarcd ; can't move there, turn around.
    inc hl ; point to x.
    ld a,c ; store x pos in c.
    ld (hl),a ; x position.
    inc hl ; point to y.
    ld (hl),b ; new placing.
    or b ; combine the two.
    and 31 ; find position straddling cells.
    cp 8 ; are we at a valid turning point?
    ret nz ; no, can't change direction.
    ld a,r ; crap random number.
    cp 23 ; check it's below this value.
    ret nc ; it isn't, don't change.
    push hl ; store car pointer.
    call random ; get random number.
    pop hl ; restore car.
    dec hl ; back to x coordinate.
    dec hl ; back again to direction.
    and 3 ; direction is in range 0-3.
    ld (hl),a ; new direction.
    ret
    ; Fetch car coordinates and direction.
getabc ld a,(hl) ; get direction.
    inc hl ; point to x position.
    ld c,(hl) ; x coordinate.
    inc hl ; point to y.
    ld b,(hl) ; y position.
    ret
    ; Process car to which hl points.
procar push hl ; store pointer.
    push hl ; store pointer.
    call scar ; delete car.
    pop hl ; restore pointer to car.
    call mcar ; move car.
    pop hl ; restore pointer to car.
    ; Show enemy car.
scar call getabc ; get coords and direction.
    jr dplay0
    ; Display player sprite.
dplayr ld bc,(playx) ; player coords.
    ld a,(playd) ; player direction.
dplay0 rrca ; multiply by 32.
    rrca
    rrca
    ld e,a ; sprite * 32 in low byte.
    ld d,0 ; no high byte.
    ld hl,cargfx ; car graphics.
    add hl,de ; add displacement to sprite.
    jr sprite ; show the sprite.


    ; This is the sprite routine and expects coordinates in (c ,b) form,
    ; where c is the vertical coord from the top of the screen (0-176), and
    ; b is the horizontal coord from the left of the screen (0 to 240).
    ; Sprite data is stored as you'd expect in its unshifted form as this
    ; routine takes care of all the shifting itself. This means that sprite
    ; handling isn't particularly fast but the graphics only take 1/8th of the
    ; space they would require in pre-shifted form.
    ; On entry HL must point to the unshifted sprite data.
sprit7 xor 7 ; complement last 3 bits.
    inc a ; add one for luck!
sprit3 rl d ; rotate left...
    rl c ; ...into middle byte...
    rl e ; ...and finally into left character cell.
    dec a ; count shifts we've done.
    jr nz,sprit3 ; return until all shifts complete.
    ; Line of sprite image is now in e + c + d, we need it in form c + d + e.
    ld a,e ; left edge of image is currently in e.
    ld e,d ; put right edge there instead.
    ld d,c ; middle bit goes in d.
    ld c,a ; and the left edge back into c.
    jr sprit0 ; we've done the switch so transfer to screen.
sprite ld (dispx),bc ; store coords in dispx for now.
    call scadd ; calculate screen address.
    ld a,16 ; height of sprite in pixels.
sprit1 ex af,af' ; store loop counter.
    push de ; store screen address.
    ld c,(hl) ; first sprite graphic.
    inc hl ; increment poiinter to sprite data.
    ld d,(hl) ; next bit of sprite image.
    inc hl ; point to next row of sprite data.
    ld (sprtmp),hl ; store it for later.
    ld e,0 ; blank right byte for now.
    ld a,b ; b holds y position.
    and 7 ; how are we straddling character cells?
    jr z,sprit0 ; we're not straddling them, don't bother shifting.
    cp 5 ; 5 or more right shifts needed?
    jr nc,sprit7 ; yes, shift from left as it's quicker.
    and a ; oops, carry flag is set so clear it.
sprit2 rr c ; rotate left byte right...
    rr d ; ...through middle byte...
    rr e ; ...into right byte.
    dec a ; one less shift to do.
    jr nz,sprit2 ; return until all shifts complete.
sprit0 pop hl ; pop screen address from stack.
    ld a,(hl) ; what's there already.
    xor c ; merge in image data.
    ld (hl),a ; place onto screen.
    inc l ; next character cell to right please.
    ld a,(hl) ; what's there already.
    xor d ; merge with middle bit of image.
    ld (hl),a ; put back onto screen.
    inc l ; next bit of screen area.
    ld a,(hl) ; what's already there.
    xor e ; right edge of sprite image data.
    ld (hl),a ; plonk it on screen.
    ld a,(dispx) ; vertical coordinate.
    inc a ; next line down.
    ld (dispx),a ; store new position.
    and 63 ; are we moving to next third of screen?
    jr z,sprit4 ; yes so find next segment.
    and 7 ; moving into character cell below?
    jr z,sprit5 ; yes, find next row.
    dec l ; left 2 bytes.
    dec l ; not straddling 256-byte boundary here.
    inc h ; next row of this character cell.
sprit6 ex de,hl ; screen address in de.
    ld hl,(sprtmp) ; restore graphic address.
    ex af,af' ; restore loop counter.
    dec a ; decrement it.
    jp nz,sprit1 ; not reached bottom of sprite yet to repeat.
    ret ; job done.
sprit4 ld de,30 ; next segment is 30 bytes on.
    add hl,de ; add to screen address.
    jp sprit6 ; repeat.
sprit5 ld de,63774 ; minus 1762.
    add hl,de ; subtract 1762 from physical screen address.
    jp sprit6 ; rejoin loop.
    ; This routine returns a screen address for (c, b) in de.
scadd ld a,c ; get vertical position.
    and 7 ; line 0-7 within character square.
    add a,64 ; 64 * 256 = 16384 (Start of screen display)
    ld d,a ; line * 256.
    ld a,c ; get vertical again.
    rrca ; multiply by 32.
    rrca
    rrca
    and 24 ; high byte of segment displacement.
    add a,d ; add to existing screen high byte.
    ld d,a ; that's the high byte sorted.
    ld a,c ; 8 character squares per segment.
    rlca ; 8 pixels per cell, mulplied by 4 = 32.
    rlca ; cell x 32 gives position within segment.
    and 224 ; make sure it's a multiple of 32.
    ld e,a ; vertical coordinate calculation done.
    ld a,b ; y coordinate.
    rrca ; only need to divide by 8.
    rrca
    rrca
    and 31 ; squares 0 - 31 across screen.
    add a,e ; add to total so far.
    ld e,a ; hl = address of screen.
    ret
    ; Pseudo-random number generator.
    ; Steps a pointer through the ROM (held in seed), returning the contents
    ; of the byte at that location.
random ld hl,(seed) ; pointer to ROM.
    res 5,h ; stay within first 8K of ROM.
    ld a,(hl) ; get "random" number from location.
    xor l ; more randomness.
    inc hl ; increment pointer.
    ld (seed),hl ; new position.
    ret
; Sprite graphic data.
; Going up first.
cargfx defb 49,140,123,222,123,222,127,254,55,236,15,240,31,248,30,120
defb 29,184,108,54,246,111,255,255,247,239,246,111,103,230,3,192
; Second image looks right.
defb 60,0,126,14,126,31,61,223,11,238,127,248,252,254,217,127
defb 217,127,252,254,127,248,11,238,61,223,126,31,126,14,60,0
; Third is pointing down.
defb 3,192,103,230,246,111,247,239,255,255,246,111,108,54,29,184
defb 30,120,31,248,15,240,55,236,127,254,123,222,123,222,49,140
; Last car looks left.
defb 0,60,112,126,248,126,251,188,119,208,31,254,127,63,254,155
defb 254,155,127,63,31,254,119,208,251,188,248,126,112,126,0,60
; Variables used by the game.
org 32768
playi equ $ ; intended direction when turn is possible.
playd equ playi+1 ; player's current direction.
nplayd equ playd+1 ; next player direction.
playx equ nplayd+1 ; player x.
playy equ playx+1 ; player's y coordinate.
encar1 equ playy+1 ; enemy car 1.
encar2 equ encar1+3 ; enemy car 2.
dispx equ encar2+3 ; general-use coordinates.
dispy equ dispx+1
seed equ dispy+1 ; random number seed.
sprtmp equ seed+2 ; sprite temporary address.
termin equ sprtmp+2 ; end of variables.
rmdat equ 49152

    end 32768