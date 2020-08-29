; HEART_ROW_0_START_X equ 9
; HEART_ROW_0_START_Y equ 0

; hearticons:
;     db 0,HEART_ROW_0_START_X,HEART_ROW_0_START_Y
;     db 0,HEART_ROW_0_START_X+1,HEART_ROW_0_START_Y
;     db 0,HEART_ROW_0_START_X+2,HEART_ROW_0_START_Y
;     db 0,HEART_ROW_0_START_X+3,HEART_ROW_0_START_Y
;     db 0,HEART_ROW_0_START_X+4,HEART_ROW_0_START_Y
;     db 255

; ;IX=hearticons
; ui_add_heart:
;     ld a,(ix)
;     cp 255
;     ret z
;     ld a,(ix)
;     cp 1
;     jp z,uiaddheart_gonext
;     ld (ix),1
;     ret
; uiaddheart_gonext:
;     ld de,HEART_ICON_DATA_LENGTH
;     add ix,de
;     jp ui_add_heart



; ui_update:
;     ld ix,hearticons
;     call ui_draw_hearts
;     ret

; ;IX=hearticons
; ui_draw_hearts:
;     ld a,(ix)
;     cp 255
;     ret z
;     ld a,(ix)
;     cp 0
;     ret z
;     ld bc,heart_icon
;     ld d,(ix+1)
;     ld e,(ix+2)
;     call drawsprite8_8
;     ld de,HEART_ICON_DATA_LENGTH
;     add ix,de
;     jp ui_draw_hearts
