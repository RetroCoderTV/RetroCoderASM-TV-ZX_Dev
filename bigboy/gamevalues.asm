TRUE equ 1
FALSE equ 0

;directions:
UP equ 0
DOWN equ 1
LEFT equ 2
RIGHT equ 3

;16 is players width, also 16 is margin so the screen colours at edges 
;can use ink and paper colours without worrying about player ink
MIN_X equ 3
MAX_X equ 24-2-2

MIN_Y equ 40
MAX_Y equ 192-24 ;24 is players height