                ORG     $AF00

NoThings        EQU     $0018
ThingSize       EQU     $0010
NoCells         EQU     NoThings+1+NoProject
CellSize        EQU     $0010

Cells           EQU     $
                DEFS    NoCells*CellSize,$00

ThingData       EQU     $
                DEFS    NoThings*ThingSize,$00

ProjData        EQU     $
                DEFW    $0000,$0000,$0000,$0000,$0000
                DEFW    Cells+NoThings*CellSize+$01*CellSize
                DEFB    $00,$00,$00,$00
                DEFW    $0000,$0000,$0000,$0000,$0000
                DEFW    Cells+NoThings*CellSize+$02*CellSize
                DEFB    $00,$00,$00,$00
                DEFW    $0000,$0000,$0000,$0000,$0000
                DEFW    Cells+NoThings*CellSize+$03*CellSize
                DEFB    $00,$00,$00,$00
                DEFW    $0000,$0000,$0000,$0000,$0000
                DEFW    Cells+NoThings*CellSize+$04*CellSize
                DEFB    $00,$00,$00,$00


