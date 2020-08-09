DWObject:       PUSH    HL
                POP     IX
                LD      A,(IX+$07)
                OR      A
                CALL    M,DWBomb
                RET     C
                LD      A,(IX+$07)
                BIT     6,A
                CALL    NZ,DWFly
                LD      A,(IX+$05)
                CALL    AddPoints
                LD      A,(IX+$06)
                OR      A
                CALL    NZ,DWChemical
                LD      A,(IX+$08)
                CALL    AddEnergy
                LD      B,(IX+$02)
                LD      C,(IX+$00)
                CALL    ChBigToScreen
                LD      A,$A0
                LD      (ObjColl),A
                CALL    DrawImage
                LD      (IX+$04),$00
                OR      A
                RET

DWFly:          LD      A,(MazeNumber)
                LD      E,A
                LD      D,$00
                LD      HL,FlyTable
                ADD     HL,DE
                LD      (HL),$FF
                RET

DWBomb:         LD      HL,NoBombs
                LD      A,(HL)
                CP      $03
                SCF
                RET     Z
                INC     (HL)
                CALL    PrintBombs
                OR      A
                RET

DWChemical:     LD      E,A
                LD      A,(Flasks)
                OR      E
                LD      (Flasks),A
                CP      $FC
                JR      Z,Completed
                CALL    DoFlasks
                RET

Completed:      LD      A,$03
                JP      EndGame

AddPoints:      LD      D,$00
                LD      E,A
                LD      HL,(Score)
                ADD     HL,DE
                LD      (Score),HL
                RET

Score:          DEFW    $0000

AddEnergy:      DI
                OR      A
                JP      M,SubEnergy
                LD      E,A
                LD      A,(Energy)
                ADD     A,E
                CP      $60
                JR      C,NotMax
                LD      A,$60
NotMax:         LD      (Energy),A
                EI
                RET

SubEnergy:      AND     $7F
                LD      E,A
                LD      A,(Energy)
                SUB     E
                JR      NC,NotMin
                LD      A,$00
NotMin:         LD      (Energy),A
                EI
                RET

Energy:         DEFB    $60
Flasks:         DEFB    $00

PrintScore      PROC
                CALL    Print
                DEFB    $03,$00,$01,$04,$17
                DEFM    " "
                DEFB    $FF
                LD      IX,Powers
                LD      B,$04
                LD      C,$20
                LD      HL,(Score)
ScoreLoop:      XOR     A
                LD      E,(IX+$00)
                LD      D,(IX+$01)
InnerLoop:      INC     A
                OR      A
                SBC     HL,DE
                JR      NC,InnerLoop
                DEC     A
                JR      Z,ItsAZero
                LD      C,$30
ItsAZero:       ADD     A,C
                ADD     HL,DE
                PUSH    HL
                PUSH    BC
                CALL    CharOut
                POP     BC
                POP     HL
                INC     IX
                INC     IX
                DJNZ    ScoreLoop
                LD      A,L
                OR      A
                JR      Z,ItsNextZero
                LD      C,$30
ItsNextZero:    ADD     A,C
                CALL    CharOut
                LD      A,$30
                CALL    CharOut
                LD      A,$20
                CALL    CharOut
                RET
                PEND

Powers:         DEFW    10000
                DEFW    1000
                DEFW    100
                DEFW    10

PrtEnergy:      DEFB    $00
LastPrtPos:     DEFW    $0000
LastBar:        DEFB    $00

PrintEnergy:    LD      HL,PrtEnergy
                LD      A,(Energy)
                SUB     (HL)
                RET     Z
                LD      A,(HL)
                JR      C,DownDemand
                INC     A
                LD      (HL),A
                LD      BC,(LastPrtPos)
                LD      A,(LastBar)
                INC     A
                CP      $09
                JR      C,NotOverEnd
                LD      A,$01
                INC     C
NotOverEnd:     LD      (LastPrtPos),BC
                LD      (LastBar),A
                ADD     A,$F0
                CALL    TopImage
                RET

DownDemand:     DEC     A
                JR      Z,Killed
                LD      (HL),A
                LD      BC,(LastPrtPos)
                LD      A,(LastBar)
                DEC     A
                JP      P,NotUnderEnd
                LD      A,$08
                DEC     C
NotUnderEnd:    LD      (LastPrtPos),BC
                LD      (LastBar),A
                ADD     A,$F0
                CALL    TopImage
                RET

Killed:         LD      A,$02
                JP      EndGame

InitEnergy:     LD      BC,$0300
                LD      A,$F9
                PUSH    BC
                CALL    TopImage
                POP     BC
                INC     C
                LD      A,(PrtEnergy)
                LD      (LastPrtPos),BC
                LD      (LastBar),A
                LD      E,A
                LD      D,$0C
NextCharBar:    LD      A,E
                OR      A
                JR      Z,DoBar
                LD      (LastPrtPos),BC
                LD      (LastBar),A
                AND     $07
                CP      E
                JR      Z,DoBar
                LD      A,$08
DoBar:          OR      A
                ADD     A,$F0
                PUSH    DE
                PUSH    BC
                CALL    TopImage
                POP     BC
                POP     DE
                LD      A,E
                SUB     $08
                JR      NC,NotDone
                XOR     A
NotDone:        LD      E,A
                INC     C
                DEC     D
                JR      NZ,NextCharBar
                LD      A,$FA
                CALL    TopImage
                RET

DoFlasks:       LD      B,$06
                LD      C,$08
                LD      E,$80
                LD      A,(Flasks)
                LD      D,A
DoFlasksLoop:   LD      A,E
                RL      D
                JR      C,GotFlask
                LD      A,$86
GotFlask:       PUSH    BC
                PUSH    DE
                LD      B,$00
                CALL    TopImage
                POP     DE
                POP     BC
                INC     C
                INC     C
                INC     E
                DJNZ    DoFlasksLoop
                RET

PrintBombs:     LD      BC,$020E
                LD      E,$92
                LD      A,(NoBombs)
                OR      A
                JR      NZ,OneOrMore
                LD      E,$A0
OneOrMore:      LD      A,E
                CALL    TopImage
                LD      BC,$0210
                LD      E,$92
                LD      A,(NoBombs)
                CP      $02
                JR      NC,TwoOrMore
                LD      E,$A0
TwoOrMore:      LD      A,E
                CALL    TopImage
                LD      BC,$0212
                LD      E,$92
                LD      A,(NoBombs)
                CP      $03
                JR      Z,ThreeOrMore
                LD      E,$A0
ThreeOrMore:    LD      A,E
                CALL    TopImage
                RET

PrintTime:      CALL    Print
                DEFB    $03,$08,$02,$04,$06
                DEFB    $FF
                LD      A,(Minutes)
                CALL    PrintTens
                LD      A,$20
                CALL    CharOut
                LD      A,(Seconds)
PrintTens:      LD      C,$00
GetTensLoop:    SUB     $0A
                JR      C,GotTenMins
                INC     C
                JP      GetTensLoop
GotTenMins:     ADD     A,$0A
                PUSH    AF
                LD      A,$30
                ADD     A,C
                CALL    CharOut
                POP     AF
                ADD     A,$30
                CALL    CharOut
                RET

Print:          EX      (SP),HL
PrintLoop:      LD      A,(HL)
                CP      $FF
                JR      Z,EndPrint
                CALL    CharOut
                INC     HL
                JR      PrintLoop
EndPrint:       INC     HL
                EX      (SP),HL
                RET

CharOut:        PUSH    HL
                PUSH    DE
                PUSH    BC
                LD      HL,ControlBits
                BIT     0,(HL)
                JR      NZ,DoXPos
                BIT     1,(HL)
                JR      NZ,DoYPos
                BIT     2,(HL)
                JP      NZ,SetAttr
                CP      $20
                JR      C,ControlChar
                LD      L,A
                LD      H,$00
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                LD      DE,CharSet
                ADD     HL,DE
                EX      DE,HL
                LD      HL,(PrintPos)
                LD      B,$08
PutCharLp:      LD      A,(DE)
                LD      (HL),A
                INC     DE
                INC     H
                DJNZ    PutCharLp
                LD      HL,(AttrPos)
                LD      A,(Attribute)
                LD      (HL),A
                INC     HL
                LD      (AttrPos),HL
                LD      HL,(PrintPos)
                INC     HL
                LD      (PrintPos),HL
EndCharOut:     POP     BC
                POP     DE
                POP     HL
                RET

ControlChar:    CP      $02
                JR      Z,ClearScreen
                CP      $0D
                JR      Z,Return_O
                LD      (ControlBits),A
                JP      EndCharOut

Return_O:       LD      HL,YPos
                INC     (HL)
                XOR     A
                LD      (XPos),A
                JP      CalcScnPos

ClearScreen:    LD      HL,$4000
                LD      DE,$4001
                LD      BC,$1BFF
                XOR     A
                OUT     ($FE),A
                LD      (HL),A
                LDIR
                LD      (XPos),A
                LD      (YPos),A
                JP      CalcScnPos

DoXPos:         RES     0,(HL)
                LD      (XPos),A
                JP      EndCharOut

DoYPos:         RES     1,(HL)
                LD      (YPos),A
CalcScnPos:     LD      A,(YPos)
                LD      B,A
                LD      L,B
                LD      A,(XPos)
                LD      C,A
                LD      H,$00
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                LD      D,$58
                LD      E,C
                ADD     HL,DE
                LD      (AttrPos),HL
                LD      A,B
                AND     $07
                ADD     A,A
                ADD     A,A
                ADD     A,A
                ADD     A,A
                ADD     A,A
                ADD     A,C
                LD      L,A
                LD      A,B
                AND     $18
                ADD     A,$40
                LD      H,A
                LD      (PrintPos),HL
                JP      EndCharOut

SetAttr:        RES     2,(HL)
                LD      (Attribute),A
                JP      EndCharOut

PrintPos:       DEFW    $0000
AttrPos:        DEFW    $0000
Attribute:      DEFB    $00
XPos:           DEFB    $00
YPos:           DEFB    $00
ControlBits:    DEFB    $00

ObjList:        DEFS    $20*$0A+$01,$00

ObjDefs:        DEFB    $64,$80,$00,$00
                DEFB    $64,$40,$00,$00
                DEFB    $64,$20,$00,$00
                DEFB    $64,$10,$00,$00
                DEFB    $64,$08,$00,$00
                DEFB    $64,$04,$00,$00
                DEFB    $00,$00,$00,$00
                DEFB    $0A,$00,$00,$0A
                DEFB    $0A,$00,$00,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $64,$00,$00,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $0A,$00,$00,$A0
                DEFB    $0A,$00,$00,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $64,$00,$80,$00
                DEFB    $0A,$00,$00,$00
                DEFB    $64,$00,$40,$00

