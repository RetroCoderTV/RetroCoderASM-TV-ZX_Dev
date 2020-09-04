;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		GetPixelAddr
;
;	Desc:		Get screen pixel from x, y
;				x = 0 to 255; y = 0 to 191
;
;	Input:		DE = y, x coords in pixels (d=y)
;
;	Output: 	HL = Screen address
;				A  = Pixel position
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GetPixelAddr:
	ld		a, e			; use copy of x coord
	rrca					; divide by 8
	rrca
	rrca
	and		31				; mask rotated in bits
	ld		h, a			; store in h
	
	ld 		a, d			; get y
	rla						; rotate y3 to y5 into position
	rla
	and 	224				; and isolate
	or 		h				; merge x (copy)
	ld 		l, a			; store in l
	
	ld 		a, d			; get y
	rra						; rotate y7 and y6 into position-1
	rra
	or 		128				; bring in high bit
	rra						; rotate y7 and y6 into position
	xor 	d				; merge lower 3 bits of y for y0 to y2
	and 	248
	xor 	d
	ld 		h, a			; store in h
	
	ld		a, e			; get pixel position
	and		7

	ret
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		GetScreenAddr
;
;	Desc:		Get screen byte from x, y
;				x = 0 to 31; y = 0 to 191
;
;	Input:		DE = y, x coords in pixels (d=y)
;
;	Output: 	HL = Screen address
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GetScreenAddr:
	ld 		a, d			; get y
	rla						; rotate y3 to y5 into position
	rla
	and 	224				; and isolate
	or 		e				; merge x
	ld 		l, a			; store in l
	
	ld 		a, d			; get y
	rra						; rotate y7 and y6 into position-1
	rra
	or 		128				; bring in high bit
	rra						; rotate y7 and y6 into position
	xor 	d				; merge lower 3 bits of y for y0 to y2
	and 	248
	xor 	d
	ld 		h, a			; store in h

	ret

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		IncY
;
;	Desc:		Get next screen y down
;
;	Input:		HL = Current screen address
;
;	Output: 	HL = Next y line down
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IncY:
	inc 	h				; move down 1 line
	ld 		a, h
	and 	7				; test if still in char block
	ret 	nz				; just return if so
	
	ld 		a, l			; if not...
	add		a, 32			; get next char block
	ld 		l, a
	ret 	c				; return if in new third
	
	ld 		a, h			; if not....
	sub		8				; go back a third
	ld 		h, a
	
	ret
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		DecY
;
;	Desc:		Get next screen y up
;
;	Input:		HL = Current screen address
;
;	Output: 	HL = Next y line up
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
DecY:
	dec 	h				; move up 1 line
	ld 		a, h
	and 	7				; isolate 0 - 7
	cp		7				; are we at end of a char?
	ret 	nz				; return if not
	
	ld 		a, l			; if so...
	sub 	32				; get next char block
	ld 		l, a
	ret 	c				; return if in new third
	
	ld 		a, h			; if not...
	add		a, 8			; go back a third
	ld 		h, a
	
	ret
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		GetCharAddr
;
;	Desc:		Get char block address from x, y
;				x = 0 to 31; y = 0 to 24
;
;	Input:		DE = y, x coords in chars (d=y)
;
;	Output: 	HL = Char address
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
GetCharAddr:
	ld 		a, d			; get y
	rrca					; rotate y3 - y5 into pos
	rrca
	rrca
	and 	224				; isolate
	or 		e				; merge x
	ld 		l, a			; and store
	
	ld 		a, d			; get y
	and		248				; isolate y6 and y7
	or		64				; bring in screen high bit	
	ld		h, a			; and store
	
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		GetAttrAddr
;
;	Desc:		Get attr byte from screen addr
;
;	Input:		HL = Screen byte address
;
;	Output: 	HL = Attr address
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GetAttrAddr:
	ld		a, h			; get high byte of screen addr
	rra						; rotate bits 3 and 4 of screen addr
	rra						; (screen third bits)
	rra						; into first 2 bits of h
	and		3				; and isolate them
	or		$58				; set attr start
	ld		h, a			; store attr address
	
	ret

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		GetAttrXY
;
;	Desc:		Get attr byte from x, y
;				x = 0 to 31; y = 0 to 24
;
;	Input:		DE = y, x coords in chars (d=y)
;
;	Output: 	HL = Attr address
;
;	Clobbers: 	A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GetAttrXY:
	ld	h, AttrTbl / 256
	ld	a, d
	add a, a
	ld	l, a
	ld	a, (hl)
	inc l
	ld	h, (hl)
	or	e
	ld	l, a
	
	ret

org ($ + 255) / 256 * 256	; align to 256 bytes

AttrTbl:
	REPT 24, y
		dw	0x5800+32*y
	ENDM


; GetAttrXY:
	; ld		a, d			;	4
	; rrca					;	4
	; rrca					;	4
	; rrca					;	4
	; ld		h, a			;	4
	
	; and		224				;	7
	; or		e				;	4		
	; ld		l, a			;	4
	
	; ld		a, h			;	4
	; and		3				;	7
	; or		$58				;	7
	; ld		h, a			;	4
	
	; ret

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		PrintChar
;
;	Desc:		Print single char
;
;	Input:		A = Char to print
;				HL = Screen address
;				BC = Charset address
;
;	Output: 	HL = Next screen byte
;
;	Clobbers: 	A, DE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PrintChar:	
	sub		32			; get char pos (space is 0)
	
	ex		de, hl		; store hl in de
	
	ld		h, 0		; calc offset	
	ld		l, a	
	add		hl, hl		; * 8
	add		hl, hl
	add		hl, hl
	
	add		hl, bc		; add offset into charset
	
	push	de			; save screen address

REPT 7
	ld		a, (hl)		; get char byte
	ld		(de), a		; store on screen
	inc		d			; next screen line
	inc		hl			; next char byte
ENDM	
	ld		a, (hl)
	ld		(de), a
	
	pop		hl			; restore screen address
	inc		hl			; and move along 1
	
	ret
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Name:		PrintStr
;
;	Desc:		Print zero terminated string
;
;	Input:		DE = Address of string
;				HL = Screen address
;				BC = Charset address
;
;	Output: 	NONE
;
;	Clobbers: 	A, HL, DE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PrintStr:	PROC
	LOCAL NotAt, loop
	
	ex		de, hl		; consistency with other routines
	
loop:
	ld		a, (hl)		; load char and test for 0
	or		a
	ret		z			; return if finished
	
	cp		22			; AT directive?
	jr		nz, NotAt	; print string if not
	
	inc		hl
	ld		d, (hl)		; otherwise load de with coords
	inc		hl
	ld		e, (hl)
	push	hl			; store char position
	
	call	GetCharAddr	; get char address
	ex		de, hl
	
	pop		hl			; restore char position
	inc		hl
	ld		a, (hl)		; and get next char
	
NotAt:
	sub		32			; get char pos (space is 0)
	
	push	hl			; save position in string
	
	ld		h, 0		; calc offset	
	ld		l, a	
	add		hl, hl		; * 8
	add		hl, hl
	add		hl, hl
	
	add		hl, bc		; add offset into charset	
	
	push	de			; save screen pos
	
REPT 7
	ld		a, (hl)		; get char byte
	ld		(de), a		; store on screen
	inc		d			; next screen line
	inc		hl			; next char byte
ENDM
	ld		a, (hl)
	ld		(de), a
	
	pop		de			; restore and inc screen pos
	inc		de	

	pop		hl			; restore string pos and point to next char
	inc		hl
	
	jr		loop		; loop until done
	
ENDP