GAME_WINDOW_WIDTH equ 24
GAME_WINDOW_HEIGHT equ 24

VMEM_X EQU 0 ; output x offset in chars
VMEM_Y EQU 0 ; output y offset in lines

;;;;;;;;

GAME_WINDOW_START equ 0x8000
;GAME_WINDOW_LENGTH equ 0x1500
GAME_WINDOW_END_UB equ 0x95

BUFFER_SIDE_EXTRA equ 2
BUFFER_WINDOW_WIDTH equ GAME_WINDOW_WIDTH+(BUFFER_SIDE_EXTRA*2)

;BUFFER_MIDDLE equ BUFFER_WINDOW_WIDTH/2


BUFFER_CHUNK_LENGTH equ 12
;SEG_SIZE equ 0x700

SCREEN_WIDTH equ 32

VMEM_START equ 0x4000
VMEM_SEG_SIZE equ 0x800
;VMEM_SEG_0 equ VMEM_START + VMEM_SEG_SIZE * 0
;VMEM_SEG_1 equ VMEM_START + VMEM_SEG_SIZE * 1
;VMEM_SEG_2 equ VMEM_START + VMEM_SEG_SIZE * 2
;VMEM_END_UB equ 0x58


;line down offsets
L1 equ 0x100
L2 equ 0x200
L3 equ 0x300
L4 equ 0x400
L5 equ 0x500
L6 equ 0x600
L7 equ 0x700
;char down offsets
C1 equ 0x20
C2 equ 0x40
C3 equ 0x60
C4 equ 0x80
C5 equ 0xA0
C6 equ 0xC0
C7 equ 0xE0

stack_ptr dw 0
cleargamewindow: 
	ld hl,GAME_WINDOW_START
	call clr_window
	ret



clr_window:  
	ld a,h
	cp GAME_WINDOW_END_UB
	ret z
	xor a
	ld (hl),a
	inc hl
	jp clr_window



drawgamewindow:
	di
	push iy
	push ix
	push hl
	push de
	push bc
	push af
	ld (stack_ptr),sp ;cache correct stack_ptr

	REPT GAME_WINDOW_HEIGHT*8, y

	vy      DEFL VMEM_Y + y	; the line in video memory
	seg     DEFL vy / 64	; the video segment number
	segy    DEFL vy % 64	; the line within the video segment
	ch      DEFL segy / 8	; the character offset within in the segment
	chy     DEFL segy % 8	; the scanline within the scharacter
	voffset DEFL seg * VMEM_SEG_SIZE + chy * 0x100 + ch * 0x20 + VMEM_X

		REPT 2, chunk

			ld sp, GAME_WINDOW_START + BUFFER_SIDE_EXTRA + y * BUFFER_WINDOW_WIDTH + BUFFER_CHUNK_LENGTH * chunk
			pop af
			pop bc
			pop de
			pop hl
			pop ix
			pop iy

			ld sp, VMEM_START + voffset + BUFFER_CHUNK_LENGTH * (chunk + 1)
			push iy
			push ix
			push hl
			push de
			push bc
			push af

		ENDM
	ENDM

	ld sp,(stack_ptr)

	pop af
	pop bc
	pop de
	pop hl
	pop ix
	pop iy
	ei

	ret
