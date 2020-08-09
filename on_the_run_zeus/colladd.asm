ManSizeX        EQU     $0008
ManSizeY        EQU     $0010
MaxMazeX        EQU     $0200
MaxMazeY        EQU     $0140
ScreenWidth     EQU     $0080
ScreenHeight    EQU     $0050
NoKillPoints    EQU     $0001

AddMove:        LD      HL,(ManYPos)
                ADD     HL,DE
                PUSH    HL
                EX      DE,HL
                LD      HL,(ManXPos)
                ADD     HL,BC
                PUSH    HL
                LD      B,ManSizeY
                LD      C,ManSizeX
                CALL    ObjectColl
                CALL    C,DWObject
                POP     HL
                POP     DE
                RET     C
                LD      B,ManSizeY
                LD      C,ManSizeX
                CALL    SceneColl
                RET     C
                CALL    ThingColl
                JP      C,IncBorder
                LD      (ManYPos),DE
                LD      (ManXPos),HL
                RET

WeapCreate:     LD      A,(IX+$01)
                OR      A
                JR      Z,BlankProj
                ADD     IX,DE
                LD      A,(IX+$01)
                OR      A
                JR      Z,BlankProj
                ADD     IX,DE
                LD      A,(IX+$01)
                OR      A
                JR      Z,BlankProj
                ADD     IX,DE
                LD      A,(IX+$01)
                OR      A
                JR      Z,BlankProj
                RET

BlankProj:      LD      (IX+$00),$0A
                LD      (IX+$01),$0A
                LD      (IX+$0C),$D0
                LD      (IX+$0D),$47
                LD      (IX+$0E),$00
                LD      DE,$0000
                LD      A,(SgnVelY)
                OR      A
                JR      NZ,ManWeapUp
                LD      A,(VelocityY)
                CP      $E0
                JR      C,GotWeaponY
                LD      DE,$0002
                JP      GotWeaponY
ManWeapUp:      LD      A,(VelocityY)
                CP      $20
                JR      NC,GotWeaponY
                LD      DE,$FFFE
GotWeaponY:     LD      (IX+$08),E
                LD      (IX+$09),D
                LD      DE,$0009
                LD      BC,$0002
                LD      A,(Direct)
                OR      A
                JR      Z,ManRight
                LD      DE,$FFFB
                LD      BC,$FFFE
ManRight:       LD      (IX+$06),C
                LD      (IX+$07),B
                LD      HL,(ManXPos)
                ADD     HL,DE
                LD      (IX+$02),L
                LD      (IX+$03),H
                EX      DE,HL
                LD      BC,$0006
                LD      HL,(ManYPos)
                ADD     HL,BC
                LD      (IX+$04),L
                LD      (IX+$05),H
                EX      DE,HL
                PUSH    DE
                PUSH    HL
                LD      B,$04
                LD      C,$04
                CALL    NoHackObjColl
                POP     HL
                POP     DE
                JR      C,KillProj
                CALL    NoHackColl
                JR      C,KillProj
                LD      A,$FF
                LD      (ProjMove),A
                RET

KillThing:      LD      A,NoKillPoints
                CALL    AddPoints
                LD      (IY+$07),$C0
                LD      (IY+$0E),$FF
                LD      A,(IY+$0C)
                CP      $08
                JR      Z,KillProj
                LD      L,(IY+$02)
                LD      H,(IY+$03)
                LD      DE,$0002
                ADD     HL,DE
                LD      (IY+$02),L
                LD      (IY+$03),H
                LD      L,(IY+$04)
                LD      H,(IY+$05)
                LD      DE,$0002
                ADD     HL,DE
                LD      (IY+$04),L
                LD      (IY+$05),H
KillProj:       LD      (IX+$0E),$20
                RET

MoveProject:    LD      A,(IX+$04)
                ADD     A,(IX+$08)
                LD      E,A
                LD      A,(IX+$05)
                ADC     A,(IX+$09)
                LD      D,A
                PUSH    DE
                LD      A,(IX+$02)
                ADD     A,(IX+$06)
                LD      L,A
                LD      A,(IX+$03)
                ADC     A,(IX+$07)
                LD      H,A
                PUSH    HL
                LD      B,$04
                LD      C,$04
                CALL    NoHackObjColl
                POP     HL
                POP     DE
                JR      C,KillProj
                LD      B,$04
                LD      C,$04
                CALL    NoHackColl
                JR      C,KillProj
                CALL    ThingColl
                JR      C,KillThing
                LD      (IX+$02),L
                LD      (IX+$03),H
                LD      (IX+$04),E
                LD      (IX+$05),D
                RET

ThingMoves:     DEFW    VeryRandThg
                DEFW    RandThing
                DEFW    IntellThing

VeryRandThg:    LD      A,R
                LD      L,(IY+$08)
                CP      $04
                JR      NC,VeryRandKeep
VeryRandNew:    LD      A,(IY+$0F)
                CP      $02
                JP      Z,IntellThing
RandIntell:     CALL    RandNumber
                AND     $1C
                LD      (IY+$08),A
                LD      L,A
VeryRandKeep:   LD      H,0
                LD      DE,MoveTab
                ADD     HL,DE
                LD      A,(IY+$02)
                ADD     A,(HL)
                LD      E,A
                INC     HL
                LD      A,(IY+$03)
                ADC     A,(HL)
                LD      D,A
                INC     HL
                LD      A,(IY+$04)
                ADD     A,(HL)
                LD      B,A
                INC     HL
                LD      A,(IY+$05)
                ADC     A,(HL)
                LD      H,A
                LD      L,B
                EX      DE,HL
                PUSH    DE
                PUSH    HL
                LD      C,(IY+$0C)
                LD      B,(IY+$0D)
                CALL    ObjectColl
                POP     HL
                POP     DE
                JR      C,VeryRandNew
                CALL    SceneColl
                JR      C,VeryRandNew
                CALL    OutMaze
                JR      C,VeryRandNew
                LD      A,(IY+$0F)
                OR      A
                RET     Z
                CALL    CheckHitMan
                RET     NC
                LD      L,(IY+$02)
                LD      H,(IY+$03)
                LD      E,(IY+$04)
                LD      D,(IY+$05)
                RET

RandThing:      LD      L,(IY+$08)
                JR      RandKeep
RandNew:        CALL    RandNumber
                AND     $1C
                LD      (IY+$08),A
                LD      L,A
RandKeep:       LD      H,0
                LD      DE,MoveTab
                ADD     HL,DE
                LD      A,(IY+$02)
                ADD     A,(HL)
                LD      E,A
                INC     HL
                LD      A,(IY+$03)
                ADC     A,(HL)
                LD      D,A
                INC     HL
                LD      A,(IY+$04)
                ADD     A,(HL)
                LD      B,A
                INC     HL
                LD      A,(IY+$05)
                ADC     A,(HL)
                LD      H,A
                LD      L,B
                EX      DE,HL
                PUSH    DE
                PUSH    HL
                LD      C,(IY+$0C)
                LD      B,(IY+$0D)
                CALL    ObjectColl
                POP     HL
                POP     DE
                JR      C,RandNew
                CALL    SceneColl
                JR      C,RandNew
                CALL    OutMaze
                JR      C,RandNew
                LD      A,(IY+$0F)
                OR      A
                RET     Z
                CALL    CheckHitMan
                RET     NC
                LD      L,(IY+$02)
                LD      H,(IY+$03)
                LD      E,(IY+$04)
                LD      D,(IY+$05)
                RET

IntellThing:    LD      (IY+$06),$02
                LD      HL,(ManXPos)
                LD      C,(IY+$02)
                LD      B,(IY+$03)
                OR      A
                SBC     HL,BC
                LD      BC,$0000
                JR      Z,SameX
                LD      BC,$0001
                JP      P,SameX
                LD      BC,$FFFF
SameX:          LD      HL,(ManYPos)
                LD      E,(IY+$04)
                LD      D,(IY+$05)
                OR      A
                SBC     HL,DE
                LD      DE,$0000
                JR      Z,SameY
                LD      DE,$0001
                JP      P,SameY
                LD      DE,$FFFF
SameY:          LD      L,(IY+$04)
                LD      H,(IY+$05)
                ADD     HL,DE
                EX      DE,HL
                PUSH    DE
                LD      L,(IY+$02)
                LD      H,(IY+$03)
                ADD     HL,BC
                PUSH    HL
                LD      C,(IY+$0C)
                LD      B,(IY+$0D)
                CALL    ObjectColl
                POP     HL
                POP     DE
                JR      C,IntellNew
                CALL    SceneColl
                JR      C,IntellNew
                CALL    OutMaze
                JR      C,IntellNew
                LD      A,(IY+$0F)
                OR      A
                RET     Z
                CALL    CheckHitMan
                JR      C,IntellNew
                RET

IntellNew:      LD      (IY+$06),$00
                JP      RandIntell

OutMaze:        LD      A,H
                OR      A
                JP      M,ThingOut
                JR      Z,NoChkMazeX
                LD      A,L
                ADD     A,C
                JR      C,ThingOut
NoChkMazeX:     LD      A,D
                OR      A
                JP      M,ThingOut
                JR      Z,ThingIn
                LD      A,E
                ADD     A,B
                CP      MaxMazeY-$0100
                JR      NC,ThingOut
ThingIn:        OR      A
                RET
ThingOut:       SCF
                RET

CheckHitMan:    PUSH    HL
                PUSH    DE
                PUSH    DE
                PUSH    HL
                LD      DE,(ManXPos)
                LD      BC,ManSizeX
                OR      A
                SBC     HL,DE
                SBC     HL,BC
                JP      P,NoHitManPop2
                EX      DE,HL
                LD      C,(IY+$0C)
                LD      B,$00
                POP     DE
                OR      A
                SBC     HL,DE
                SBC     HL,BC
                JP      P,NoHitManPop
                POP     HL
                PUSH    HL
                LD      DE,(ManYPos)
                LD      BC,ManSizeY
                OR      A
                SBC     HL,DE
                SBC     HL,BC
                JP      P,NoHitManPop
                EX      DE,HL
                LD      C,(IY+$0D)
                LD      B,$00
                POP     DE
                OR      A
                SBC     HL,DE
                SBC     HL,BC
                JP      P,NoHitMan
                CALL    IncBorder
                POP     DE
                POP     HL
                SCF
                RET

NoHitManPop2:   POP     HL
NoHitManPop:    POP     HL
NoHitMan:       POP     DE
                POP     HL
                OR      A
                RET

ThingColl:      PUSH    HL
                PUSH    DE
                PUSH    HL
                LD      A,C
                LD      C,B
                LD      B,$00
                EXX
                POP     DE
                LD      C,A
                LD      B,$00
                LD      IY,ThingData
                LD      A,NoThings
ThingCollLp:    EX      AF,AF'
                LD      A,(IY+$07)
                CP      $C0
                JR      Z,RepeatT
                LD      A,C
                CP      $04
                JR      Z,ItsProj
                LD      A,(IY+$0F)
                OR      A
                JR      Z,RepeatT
ItsProj:        LD      L,(IY+$02)
                LD      H,(IY+$03)
                PUSH    HL
                SBC     HL,DE
                SBC     HL,BC
                JP      P,PopRepeatT
                EX      DE,HL
                POP     DE
                PUSH    HL
                OR      A
                SBC     HL,DE
                LD      E,(IY+$0C)
                LD      D,$00
                SBC     HL,DE
                POP     DE
                JP      P,RepeatT
                EXX
                LD      L,(IY+$04)
                LD      H,(IY+$05)
                PUSH    HL
                OR      A
                SBC     HL,DE
                SBC     HL,BC
                JP      P,PopRepeatTEX
                EX      DE,HL
                POP     DE
                PUSH    HL
                OR      A
                SBC     HL,DE
                LD      E,(IY+$0D)
                LD      D,$00
                SBC     HL,DE
                POP     DE
                JP      P,RepeatTEX
                POP     DE
                POP     HL
                SCF
                RET

RepeatTEX:      EXX
RepeatT:        EX      DE,HL
                LD      DE,ThingSize
                ADD     IY,DE
                EX      DE,HL
                EX      AF,AF'
                DEC     A
                JR      NZ,ThingCollLp
                POP     DE
                POP     HL
                OR      A
                RET

PopRepeatTEX:   EXX
PopRepeatT:     EX      DE,HL
                POP     DE
                LD      DE,ThingSize
                ADD     IY,DE
                EX      DE,HL
                EX      AF,AF'
                DEC     A
                JR      NZ,ThingCollLp
                POP     DE
                POP     HL
                OR      A
                RET

SceneColl:      LD      A,L
                OR      E
                RRA
                RET     NC
NoHackColl:     PUSH    HL
                PUSH    DE
                PUSH    BC
                LD      A,L             ;Get X size
                AND     $03
                ADD     A,C
                DEC     A
                SRL     A
                SRL     A
                INC     A
                LD      C,A
                LD      A,E             ;Get Y size
                AND     $03
                ADD     A,B
                DEC     A
                SRL     A
                SRL     A
                INC     A
                LD      B,A
                LD      A,L
                SRL     H
                RRA
                SRL     H
                RRA
                LD      L,A
                LD      A,E
                SRL     D
                RRA
                SRL     D
                RRA
                LD      H,A
                EX      DE,HL
                LD      HL,(CollMaze)
SceneLoop:      LD      A,(HL)
                CP      $FF
                JR      Z,EndSceneColl
                SUB     E
                SUB     C
                JP      P,Repeat4
                LD      A,E
                SUB     (HL)
                INC     HL
                SUB     (HL)
                JP      P,Repeat3
                INC     HL
                LD      A,(HL)
                SUB     D
                SUB     B
                JP      P,Repeat2
                LD      A,D
                SUB     (HL)
                INC     HL
                SUB     (HL)
                JP      P,Repeat1
                POP     BC
                POP     DE
                POP     HL
                SCF
                RET

Repeat4:        INC     HL
Repeat3:        INC     HL
Repeat2:        INC     HL
Repeat1:        INC     HL
                JP      SceneLoop

EndSceneColl:   POP     BC
                POP     DE
                POP     HL
                OR      A
                RET

ObjectColl:     LD      A,L
                OR      E
                RRA
                RET     NC
NoHackObjColl:  PUSH    BC
                LD      A,L             ;Get X size
                AND     $03
                ADD     A,C
                DEC     A
                SRL     A
                SRL     A
                INC     A
                LD      C,A
                LD      A,E             ;Get Y size
                AND     $03
                ADD     A,B
                DEC     A
                SRL     A
                SRL     A
                INC     A
                LD      B,A
                LD      A,L
                SRL     H
                RRA
                SRL     H
                RRA
                LD      L,A
                LD      A,E
                SRL     D
                RRA
                SRL     D
                RRA
                LD      H,A
                EX      DE,HL
                LD      HL,ObjList
ObjectLoop:     LD      A,(HL)
                CP      $FF
                JR      Z,EndObjectColl
                PUSH    HL
                SUB     E
                SUB     C
                JP      P,NextObject
                LD      A,E
                SUB     (HL)
                INC     HL
                SUB     (HL)
                JP      P,NextObject
                INC     HL
                LD      A,(HL)
                SUB     D
                SUB     B
                JP      P,NextObject
                LD      A,D
                SUB     (HL)
                INC     HL
                SUB     (HL)
                JP      P,NextObject
                INC     HL
                LD      A,(HL)
                OR      A
                JR      Z,NextObject
                POP     HL              ;Address of hit object
                POP     BC
                SCF
                RET

NextObject:     POP     HL
                LD      A,L
                ADD     A,$0A
                LD      L,A
                JP      NC,ObjectLoop
                INC     H
                JP      ObjectLoop

EndObjectColl:  POP     BC
                OR      A
                RET

ChBigToScreen:  LD      HL,ChTopYLeft
                LD      A,B
                SUB     (HL)
                LD      B,A
                LD      HL,ChTopXLeft
                LD      A,C
                SUB     (HL)
                LD      C,A
                RET

BigToScreen:    LD      HL,(TopXLeft)   ;DE =Position X
                OR      A               ;BC =Size X
                SBC     HL,DE           ;DE'=Position Y
                SBC     HL,BC           ;BC'=Size X
                JP      P,OffScreen
                LD      HL,(TopXLeft)   ;C =Difference X
                EX      DE,HL           ;B =Difference Y
                PUSH    HL
                OR      A               ;Carry set if off screen
                SBC     HL,DE
                LD      DE,ScreenWidth
                OR      A
                SBC     HL,DE
                POP     DE
                JP      P,OffScreen
                EXX
                LD      HL,(TopYLeft)
                OR      A
                SBC     HL,DE
                SBC     HL,BC
                JP      P,OffScreen
                LD      HL,(TopYLeft)
                EX      DE,HL
                PUSH    HL
                OR      A
                SBC     HL,DE
                LD      DE,ScreenHeight
                OR      A
                SBC     HL,DE
                POP     DE
                JP      P,OffScreen
                LD      HL,(TopYLeft)
                EX      DE,HL
                OR      A
                SBC     HL,DE
                ADD     HL,HL
                LD      A,L
                RRA
                EXX
                LD      B,A
                LD      HL,(TopXLeft)
                EX      DE,HL
                OR      A
                SBC     HL,DE
                ADD     HL,HL
                LD      A,L
                RRA
                LD      C,A
                OR      A
                RET

OffScreen:      SCF
                RET

SetUpThings:    CALL    Randomise
                CALL    ChooseFour
                LD      IY,ThingData
                LD      B,NoThings
                LD      HL,Cells+CellSize
                LD      (ThgCell),HL
SetThgLoop:     PUSH    BC
                LD      B,ThingSize
                XOR     A
                PUSH    IY
                POP     HL
ClrThingLp:     LD      (HL),A
                INC     HL
                DJNZ    ClrThingLp
                LD      HL,(ThgCell)
                LD      (IY+$0A),L
                LD      (IY+$0B),H
                CALL    CreateThing
                POP     BC
                LD      DE,ThingSize
                ADD     IY,DE
                LD      DE,CellSize
                LD      HL,(ThgCell)
                ADD     HL,DE
                LD      (ThgCell),HL
                DEC     B
                JP      NZ,SetThgLoop
                RET

CreateThing:    CALL    RandNumber
                AND     $03
                CP      $03
                JR      NZ,ValidType
                LD      A,$02
ValidType:      LD      (IY+$06),A
                LD      (IY+$0F),A
                CALL    RandNumber
                AND     $1F
NastyThing:     ADD     A,$08
                LD      (IY+$00),A
                LD      (IY+$01),A
                CALL    RandNumber
                AND     $1C
                LD      (IY+$08),A
DoColour:       LD      A,R
                AND     $07
                JR      Z,DoColour
                OR      $40
                LD      (IY+$09),A
                CALL    RandNumber
                AND     $30
                ADD     A,$40
                LD      (IY+$07),A
                LD      L,A
                LD      H,(HIGH SprSet)+2
                LD      A,(HL)
                ADD     A,A
                ADD     A,A
                LD      (IY+$0D),A
                INC     H
                LD      A,(HL)
                ADD     A,A
                ADD     A,A
                LD      (IY+$0C),A
GetThgYPos:     CALL    RandNumber
                LD      L,A
                LD      H,$00
                ADD     HL,HL
                ADD     HL,HL
                LD      C,L
                LD      B,H
                LD      DE,MaxMazeY
                OR      A
                SBC     HL,DE
                JR      NC,GetThgYPos
                PUSH    BC
GetThgXPos:     CALL    RandNumber
                LD      L,A
                LD      H,$00
                ADD     HL,HL
                ADD     HL,HL
                LD      B,H
                LD      C,L
                LD      DE,MaxMazeX
                OR      A
                SBC     HL,DE
                JR      NC,GetThgXPos
                LD      H,B
                LD      L,C
                POP     DE
                LD      B,(IY+$0D)
                LD      C,(IY+$0C)
                PUSH    HL
                PUSH    DE
                CALL    NoHackObjColl
                POP     DE
                POP     HL
                JR      C,GetThgYPos
                CALL    NoHackColl
                JR      C,GetThgYPos
                CALL    OutMaze
                JR      C,GetThgYPos
                PUSH    HL
                PUSH    DE
                PUSH    HL
                LD      C,(IY+$0D)
                LD      B,$00
                EXX
                POP     DE
                LD      C,(IY+$0C)
                LD      B,$00
                CALL    BigToScreen
                POP     DE
                POP     HL
                JR      NC,GetThgYPos
                LD      (IY+$02),L
                LD      (IY+$03),H
                LD      (IY+$04),E
                LD      (IY+$05),D
                RET

ThgCell:        DEFW    $0000

ChooseFour:     LD      DE,SprSet+$40
                LD      C,$04
                LD      B,$80
NextChoice:     CALL    RandNumber
                AND     $0C
                ADD     A,B
                LD      L,A
                LD      H,HIGH SprSet
                PUSH    BC
                LD      B,$04
NextAnim:       LD      A,(HL)
                LD      (DE),A
                INC     H
                INC     D
                LD      A,(HL)
                LD      (DE),A
                DEC     H
                DEC     D
                INC     L
                LD      A,E
                ADD     A,$04
                LD      E,A
                DJNZ    NextAnim
                POP     BC
                LD      A,B
                ADD     A,$10
                LD      B,A
                DEC     C
                JR      NZ,NextChoice
                LD      B,$10
                LD      C,$40
MoveThgLoop:    CALL    MoveImage
                LD      A,C
                ADD     A,$04
                LD      C,A
                DJNZ    MoveThgLoop
                LD      B,$40
                LD      C,$40
ShiftThgLoop:   CALL    ShiftImage
                INC     C
                DJNZ    ShiftThgLoop
                LD      B,$08
                LD      C,$C0
MoveImLoop:     CALL    MoveImage
                LD      A,C
                ADD     A,$04
                LD      C,A
                DJNZ    MoveImLoop
                LD      B,$20
                LD      C,$C0
ShiftImLoop:    CALL    ShiftImage
                INC     C
                DJNZ    ShiftImLoop
                LD      B,$08
                LD      C,$00
MoveManLoop:    CALL    MoveImage
                LD      A,C
                ADD     A,$04
                LD      C,A
                DJNZ    MoveManLoop
                LD      B,$20
                LD      C,$00
ShiftManLoop:   CALL    ShiftImage
                INC     C
                DJNZ    ShiftManLoop
                RET

ShiftImage:     PUSH    BC
                LD      L,C
                LD      H,HIGH SprSet
                LD      E,(HL)
                INC     H
                LD      D,(HL)
                INC     H
                LD      A,(HL)
                ADD     A,A
                ADD     A,A
                ADD     A,A
                LD      C,A
                INC     H
                LD      B,(HL)
                EX      DE,HL
                LD      A,E
                AND     $03
                JR      Z,EndShift
                ADD     A,A
                LD      D,A
                LD      E,A
ShiftOutLoop:   PUSH    HL              ;D,E No to Shift
                PUSH    BC              ;B=Width
                OR      A               ;C=Height
ShiftInLoop:    RR      (HL)            ;HL=Pointer
                INC     HL
                DJNZ    ShiftInLoop
                POP     BC
                POP     HL
                DEC     E
                JR      NZ,ShiftOutLoop
                LD      E,D
                LD      A,L
                ADD     A,B
                LD      L,A
                LD      A,H
                ADC     A,$00
                LD      H,A
                DEC     C
                JR      NZ,ShiftOutLoop
EndShift:       POP     BC
                RET

MoveImage       PROC

                PUSH    BC
                LD      L,C
                LD      H,HIGH SprSet
                LD      C,(HL)
                INC     L
                LD      E,(HL)
                INC     H
                LD      D,(HL)
                DEC     L
                LD      B,(HL)
                PUSH    BC
                INC     H
                LD      A,(HL)
                ADD     A,A
                ADD     A,A
                ADD     A,A
                LD      C,A             ;Height
                INC     H               ;DE=To
                LD      B,(HL)          ;Width
                POP     HL              ;From
                LD      A,$03
MoveNextSpr:    EX      AF,AF'
                PUSH    BC
                PUSH    HL
OuterLoop:      PUSH    BC
InnerLoop:      LD      A,(HL)
                LD      (DE),A
                INC     HL
                INC     DE
                DJNZ    InnerLoop
                LD      A,$00
                LD      (DE),A
                INC     DE
                POP     BC
                DEC     C
                JR      NZ,OuterLoop
                POP     HL
                POP     BC
                EX      AF,AF'
                DEC     A
                JR      NZ,MoveNextSpr
                POP     BC
                RET
                PEND

Randomise:      PUSH    AF
                PUSH    BC
                LD      A,R
                LD      B,A
RandLoop:       CALL    RandNumber
                DJNZ    RandLoop
                POP     BC
                POP     AF
                RET

MoveTab:        DEFW    $FFFF,$0000
                DEFW    $0001,$0000
                DEFW    $0000,$FFFF
                DEFW    $FFFF,$FFFF
                DEFW    $0001,$FFFF
                DEFW    $0000,$0001
                DEFW    $FFFF,$0001
                DEFW    $0001,$0001

RandNumber:     PUSH    HL
                PUSH    DE
                PUSH    BC
                CALL    DoRand
                POP     BC
                POP     DE
                POP     HL
                LD      A,(Seed+2)
                RET

DoRand:         LD      HL,(Seed+2)
                ADC     HL,HL
                ADC     HL,HL
                LD      C,H
                LD      A,(Seed)
                RLA
                LD      B,A
                LD      HL,(Seed+1)
                ADC     HL,HL
                RES     7,H
                EX      DE,HL
                LD      HL,(Seed)
                ADD     HL,BC
                LD      (Seed),HL
                LD      HL,(Seed+2)
                ADC     HL,DE
                RES     7,H
                LD      (Seed+2),HL
                RET     M
                LD      HL,Seed
Rand1:          INC     (HL)
                RET     NZ
                INC     HL
                JP      Rand1

Seed:           DEFM    "cp/m"

