ScreenHeight    EQU     $0050
ScreenWidth     EQU     $0080
InitManCount    EQU     $0005
MazeSize        EQU     $000A
ManSizeX        EQU     $0008
ManSizeY        EQU     $0010
MaxMazeX        EQU     $0200
MaxMazeY        EQU     $0140
InitKeyCnt      EQU     $0003
NoKeys          EQU     $0006
Thrust          EQU     $000F
NoProject       EQU     $0004
ProjectSize     EQU     $0010
SprSet          EQU     $D700
NoKillPoints    EQU     $0001

; SMB - the original used a submit file and a linker to join the sources together, I've just combined them into
; one assembly job using include statements. This means that all the labels are global, fortunately there were
; only a couple of places where this caused naming conflicts. I chose not to use zeus's proc/pend process delimiters
; (which would have given us local labels) because it would have changed the flavour of the source to much.

First           EQU     $

                DI
                LD      SP,$0000
                LD      A,IntPage
                LD      I,A
                IM      2
                CALL    SetUpObjects
                LD      A,$0A
                CALL    NewMaze
                LD      HL,FlyTable
                LD      DE,FlyTable+$01
                LD      BC,$000F
                LD      (HL),$00
                LDIR
                LD      A,$00
                LD      (Flasks),A
                LD      (NoBombs),A
                LD      (PrtEnergy),A
                LD      (ChTopXLeft),A
                LD      (ChTopYLeft),A
                LD      A,$3B
                LD      (Minutes),A
                LD      (Seconds),A
                LD      A,$60
                LD      (Energy),A
                LD      HL,$00000
                LD      (TopXLeft),HL
                LD      (TopYLeft),HL
                LD      (Score),HL
                LD      HL,$0040
                LD      (ManXPos),HL
                LD      HL,$0034
                LD      (ManYPos),HL
                CALL    SetUpThings
                CALL    DrawScreen
MainLoop:       CALL    MoveMan
                CALL    MoveThings
                CALL    ScanKeys
ModKeys         EQU     $-2
                CALL    DoProject
                CALL    CheckQuit
                CALL    DoSound
                JP      MainLoop

DoSound:        LD      HL,SoundCount
                DEC     (HL)
                RET     NZ
                LD      (HL),$01
                LD      A,(SoundFlag)
                OR      A
                RET     NZ
                LD      A,(ObjColl)
                OR      A
                JR      NZ,ObjSound
                LD      A,(ManColl)
                OR      A
                JR      NZ,ManSound
                LD      A,(ProjMove)
                OR      A
                JR      NZ,ProjSound
                LD      A,(ThingMove)
                OR      A
                JR      NZ,ThingSound
                LD      A,(ThrustFlag)
                OR      A
                RET     Z
                LD      A,R
                AND     $10
                OUT     ($FE),A
                RET

ObjSound:       XOR     A
                LD      (ObjColl),A
                LD      B,$40
                LD      A,$10
ObjSndLp:       OUT     ($FE),A
                LD      C,$20
DelObj:         DEC     C
                JR      NZ,DelObj
                XOR     $10
                DJNZ    ObjSndLp
                LD      (HL),$03
                RET

ManSound:       XOR     A
                LD      (ManColl),A
                LD      B,$60
                LD      A,$10
ManSndLp:       OUT     ($FE),A
                LD      C,$10
DelMan:         DEC     C
                JR      NZ,DelMan
                XOR     $10
                DJNZ    ManSndLp
                LD      (HL),$03
                RET

ProjSound:      XOR     A
                LD      (ProjMove),A
                LD      B,$20
                LD      A,$10
ProjSndLp:      OUT     ($FE),A
                LD      E,A
                LD      A,R
                AND     $0F
                ADD     A,A
                ADD     A,A
                ADD     A,$30
                OR      E
                LD      C,A
                LD      A,E
DelProj:        DEC     C
                JR      NZ,DelProj
                XOR     $10
                DJNZ    ProjSndLp
                LD      (HL),$03
                RET

ThingSound:     XOR     A
                LD      (ThingMove),A
                LD      A,$10
                OUT     ($FE),A
                LD      C,$10
DelThing:       DEC     C
                JR      NZ,DelThing
                XOR     $10
                OUT     ($FE),A
                RET

SoundFlag:      DEFB    $00
SoundCount:     DEFB    $01
ObjColl:        DEFB    $00
ThingMove:      DEFB    $00
ProjMove:       DEFB    $00
ManColl:        DEFB    $00
UpDateCount_NU: DEFB    $00

SetUpObjects:   LD      B,$10
                LD      HL,Mazes+$04
NextMazeObjs:   PUSH    HL
                LD      E,(HL)
                INC     HL
                LD      D,(HL)
                EX      DE,HL
                LD      C,$10
SetUpNextObj:   LD      A,R
                AND     $03
                JR      Z,PutEnergy
ObjNumTooBig:   CALL    RandNumber
                CP      $0D
                JR      NC,ObjNumTooBig
PutEnergy:      ADD     A,$87
                INC     HL
                INC     HL
                LD      (HL),A
                INC     HL
                DEC     C
                JR      NZ,SetUpNextObj
                POP     HL
                LD      DE,$000A
                ADD     HL,DE
                DJNZ    NextMazeObjs
                LD      B,$06
PutNextChem:    CALL    RandNumber
                AND     $0F
                LD      C,A
                CALL    RandNumber
                AND     $0F
                LD      E,A
                ADD     A,A
                ADD     A,A
                ADD     A,E
                ADD     A,A
                LD      E,A
                LD      D,$00
                LD      HL,Mazes+$04
                ADD     HL,DE
                LD      E,(HL)
                INC     HL
                LD      D,(HL)
                LD      A,C
                ADD     A,A
                ADD     A,C
                LD      L,A
                LD      H,$00
                ADD     HL,DE
                INC     HL
                INC     HL
                LD      A,(HL)
                CP      $86
                JR      C,PutNextChem
                LD      A,$7F
                ADD     A,B
                LD      (HL),A
                DJNZ    PutNextChem
                LD      B,$10
                LD      HL,Mazes+$04
PutNextFly:     PUSH    HL
                LD      E,(HL)
                INC     HL
                LD      D,(HL)
                EX      DE,HL
                CALL    RandNumber
                AND     $0F
                LD      E,A
                ADD     A,A
                ADD     A,E
                LD      E,A
                LD      D,$00
                ADD     HL,DE
                INC     HL
                INC     HL
                LD      (HL),$94
                POP     HL
                LD      DE,$000A
                ADD     HL,DE
                DJNZ    PutNextFly
                RET

CentreScreen:   LD      A,$04
                CALL    ReadKey
                RET     Z
DoCentre:       LD      HL,(ManXPos)
                LD      DE,ScreenWidth/2-ManSizeX/2
                OR      A
                SBC     HL,DE
                LD      A,L
                AND     $FC
                LD      L,A
                LD      (TopXLeft),HL
                LD      HL,(ManYPos)
                LD      DE,ScreenHeight/2-ManSizeY/2
                OR      A
                SBC     HL,DE
                LD      A,L
                AND     $FC
                LD      L,A
                LD      (TopYLeft),HL
                LD      HL,CheckChange
                LD      (HL),$FF
                RET

ScanKeys:       LD      HL,KeyCount
                DEC     (HL)
                RET     NZ
                LD      (HL),InitKeyCnt
                LD      B,NoKeys
                LD      HL,KeyTab
                LD      DE,BncTab
ScanLoop:       LD      A,(HL)
                IN      A,($FE)
                INC     HL
                OR      (HL)
                INC     HL
                CALL    ProcessKey
                DJNZ    ScanLoop
                RET

Sinclair:       LD      HL,KeyCount
                DEC     (HL)
                RET     NZ
                LD      (HL),InitKeyCnt
                LD      B,NoKeys
                LD      HL,SincTab
                LD      DE,BncTab
SincLoop:       LD      A,(HL)
                IN      A,($FE)
                INC     HL
                OR      (HL)
                INC     HL
                CALL    ProcessKey
                DJNZ    SincLoop
                RET

Protek:         LD      HL,KeyCount
                DEC     (HL)
                RET     NZ
                LD      (HL),InitKeyCnt
                LD      B,NoKeys
                LD      HL,ProtTab
                LD      DE,BncTab
ProtLoop:       LD      A,(HL)
                IN      A,($FE)
                INC     HL
                OR      (HL)
                INC     HL
                CALL    ProcessKey
                DJNZ    ProtLoop
                RET

Kempston:       LD      HL,KeyCount
                DEC     (HL)
                RET     NZ
                LD      (HL),InitKeyCnt
                LD      B,NoKeys-$01
                LD      HL,KempTab
                LD      DE,BncTab
KempLoop:       IN      A,($1F)
                AND     (HL)
                CPL
                INC     HL
                CALL    ProcessKey
                DJNZ    KempLoop
                LD      A,$08
                IN      A,($FE)
                OR      $E0
                CALL    ProcessKey
                RET

KeyCount:       DEFB    $01

ProcessKey:     INC     A
                JR      Z,NotPressed
                LD      A,(DE)
                OR      A
                JR      NZ,PressedLast
                LD      A,$FF
                LD      (DE),A
                INC     DE
                LD      (DE),A
                INC     DE
                RET

NotPressed:     XOR     A
                LD      (DE),A
PressedLast:    INC     DE
                INC     DE
                RET

ReadKey:        ADD     A,A             ;A Holds the number of the key
                LD      HL,BncTab+1     ;NZ if key pressed
                ADD     A,L
                LD      L,A
                LD      A,H
                ADC     A,$00
                LD      H,A
                LD      A,(HL)
                OR      A
                RET     Z
                LD      (HL),$00
                RET

KeyTab:         DEFB    $FE,$FD ;Z
                DEFB    $FE,$FB ;X
                DEFB    $BF,$FB ;K
                DEFB    $DF,$FD ;O
                DEFB    $EF,$FE ;0
                DEFB    $7F,$FB ;M

SincTab:        DEFB    $EF,$EF ;6
                DEFB    $EF,$F7 ;7
                DEFB    $EF,$FE ;0
                DEFB    $EF,$FD ;9
                DEFB    $EF,$FB ;8
                DEFB    $18,$E0 ;The    Rest

ProtTab:        DEFB    $F7,$EF ;5
                DEFB    $EF,$FB ;8
                DEFB    $EF,$FE ;0
                DEFB    $EF,$F7 ;7
                DEFB    $EF,$EF ;9
                DEFB    $18,$E0 ;The    Rest

KempTab:        DEFB    $02             ;Left
                DEFB    $01             ;Right
                DEFB    $10             ;Fire
                DEFB    $08             ;Up
                DEFB    $04             ;Down

BncTab:         DEFW    $0000
                DEFW    $0000
                DEFW    $0000
                DEFW    $0000
                DEFW    $0000
                DEFW    $0000

NewMaze:        LD      (MazeNumber),A
                LD      HL,Mazes
                LD      DE,MazeImages
                LD      BC,MazeSize
                OR      A
                JR      Z,FirstMaze
NextMaze:       ADD     HL,BC
                DEC     A
                JR      NZ,NextMaze
FirstMaze:      LDIR
                LD      HL,(MazeObjects)
                LD      IX,ObjList
ExpandObjList:  LD      A,(HL)
                CP      $FF
                RET     Z
                LD      (IX+$0A),$FF            ;End indicator
                LD      A,(HL)
                LD      (IX+$00),A
                INC     HL
                LD      D,(HL)
                LD      (IX+$02),D
                INC     HL
                LD      E,(HL)
                INC     HL
                LD      (IX+$04),E
                OR      D
                JR      Z,ExpandObjList
                LD      D,(HIGH SceneSet)+$02   ; SMB: Watch the priority of HIGH, Zeus is different to M80!
                LD      A,(DE)
                LD      (IX+$03),A
                INC     D
                LD      A,(DE)
                LD      (IX+$01),A
                LD      A,E
                ADD     A,A
                ADD     A,A
                LD      C,A
                LD      B,0
                EX      DE,HL
                LD      HL,ObjDefs
                ADD     HL,BC
                LD      A,(HL)
                LD      (IX+$05),A      ;Points
                INC     HL
                LD      A,(HL)
                LD      (IX+$06),A      ;Chemical
                INC     HL
                LD      A,(HL)
                LD      (IX+$07),A      ;Weapon
                INC     HL
                LD      A,(HL)
                LD      (IX+$08),A      ;Energy
                EX      DE,HL
                LD      DE,$000A
                ADD     IX,DE
                JP      ExpandObjList

CompactObject:  LD      HL,(MazeObjects)
                LD      IX,ObjList
CompObjList:    LD      A,(IX+$00)
                CP      $FF
                RET     Z
                INC     HL
                INC     HL
                LD      A,(IX+$04)
                LD      (HL),A
                INC     HL
                LD      DE,$000A
                ADD     IX,DE
                JP      CompObjList

MoveMan:        LD      HL,ManCount
                DEC     (HL)
                RET     NZ
                LD      (HL),InitManCount
                CALL    CentreScreen
                CALL    DoWeapon
                CALL    DoBomb
                CALL    CheckLeftRgt
                LD      A,B
                OR      C
                JR      Z,NotHitLeftRgt
                LD      DE,$0000
                CALL    AddMove
                JR      NC,NotHitLeftRgt
                XOR     A
                LD      (VelocityX),A
                LD      (SgnVelX),A
NotHitLeftRgt:  CALL    CheckUpDown
                LD      A,D
                OR      E
                JR      Z,NotCrawl
                LD      BC,$0000
                CALL    AddMove
                JR      NC,NotCrawl
                LD      A,(SgnVelY)
                LD      (VelocityY),A
                LD      A,(SgnVelX)
                RRA
                LD      A,(VelocityX)
                RRA
                LD      (VelocityX),A
NotCrawl:       CALL    CheckMazeChng
ReDraw:         LD      HL,(ManXPos)
                LD      BC,ManSizeX
                CALL    CheckXOn
                LD      HL,(ManYPos)
                LD      BC,ManSizeY
                CALL    CheckYOn
                LD      HL,CheckChange
                LD      A,(HL)
                OR      A
                JR      Z,NoChngScreen
                LD      (HL),0
                LD      HL,(TopXLeft)
                LD      D,H
                LD      E,L
                BIT     7,H
                JR      Z,NoBlankLeft
                LD      DE,$0000
                JP      NoBlankRight
NoBlankLeft:    LD      BC,MaxMazeX-ScreenWidth
                OR      A
                SBC     HL,BC
                JR      C,NoBlankRight
                LD      E,C
                LD      D,B
NoBlankRight:   EX      DE,HL
                LD      (TopXLeft),HL
                SRL     H
                RR      L
                SRL     H
                RR      L
                LD      A,L
                LD      (ChTopXLeft),A
                LD      HL,(TopYLeft)
                LD      D,H
                LD      E,L
                BIT     7,H
                JR      Z,NoBlankUp
                LD      DE,$0000
                JP      NoBlankDown
NoBlankUp:      LD      BC,MaxMazeY-ScreenHeight
                OR      A
                SBC     HL,BC
                JR      C,NoBlankDown
                LD      E,C
                LD      D,B
NoBlankDown:    EX      DE,HL
                LD      (TopYLeft),HL
                SRL     H
                RR      L
                SRL     H
                RR      L
                LD      A,L
                LD      (ChTopYLeft),A
                CALL    DrawScreen
NoChngScreen:   LD      HL,(ManXPos)
                LD      DE,(TopXLeft)
                OR      A
                SBC     HL,DE
                LD      C,L
                LD      HL,(ManYPos)
                LD      DE,(TopYLeft)
                OR      A
                SBC     HL,DE
                LD      B,L
                LD      A,(ManColour)
                LD      D,A
                LD      A,C
                AND     $03
                LD      E,A
                LD      A,(ThrustFlag)
                OR      A
                JR      Z,NoThrustSpr
                LD      HL,AnimStep
                INC     (HL)
                LD      A,(HL)
                AND     $03
                ADD     A,A
                ADD     A,A
                JR      NZ,NoThrustSpr
                INC     (HL)
                LD      A,$04
NoThrustSpr:    OR      E
                LD      E,A
                LD      A,(Direct)
                OR      E
                LD      HL,Cells
                mSprite(A,C,B,$38,D)
                LD      A,(ColourCount)
                DEC     A
                RET     M
                LD      (ColourCount),A
                OR      A
                RET     NZ
                LD      A,$47
                LD      (ManColour),A
                RET

ManColour:      DEFB    $47
ColourCount:    DEFB    $00
AnimStep:       DEFB    $00

CheckMazeChng:  LD      HL,(ManXPos)
                BIT     7,H
                JR      NZ,SwapMazeLeft
                LD      BC,ManSizeX
                ADD     HL,BC
                LD      DE,MaxMazeX
                SBC     HL,DE
                JR      NC,SwapMazeRgt
                LD      HL,(ManYPos)
                BIT     7,H
                JR      NZ,SwapMazeUp
                LD      BC,ManSizeY
                ADD     HL,BC
                LD      DE,MaxMazeY
                SBC     HL,DE
                JR      NC,SwapMazeDown
                OR      A
                RET

SwapMazeUp:     LD      A,(MazeNumber)
                LD      E,A
                LD      D,$00
                LD      HL,FlyTable
                ADD     HL,DE
                LD      A,(HL)
                OR      A
                JR      NZ,GotFlyUp
                LD      HL,(ManYPos)
                INC     HL
                LD      (ManYPos),HL
                RET
GotFlyUp:       LD      HL,MaxMazeY-ManSizeY-1
                LD      (ManYPos),HL
                LD      HL,MazeChanges+$00
                JP      SwapMaze

SwapMazeDown:   LD      A,(MazeNumber)
                LD      E,A
                LD      D,$00
                LD      HL,FlyTable
                ADD     HL,DE
                LD      A,(HL)
                OR      A
                JR      NZ,GotFlyDown
                LD      HL,(ManYPos)
                DEC     HL
                LD      (ManYPos),HL
                RET
GotFlyDown:     LD      HL,$0001
                LD      (ManYPos),HL
                LD      HL,MazeChanges+$02
                JP      SwapMaze

SwapMazeLeft:   LD      HL,MaxMazeX-ManSizeX-1
                LD      (ManXPos),HL
                LD      HL,MazeChanges+$03
                JP      SwapMaze

SwapMazeRgt:    LD      HL,$0001
                LD      (ManXPos),HL
                LD      HL,MazeChanges+$01
SwapMaze:       DI
                PUSH    HL
                CALL    CompactObject
                POP     HL
                LD      A,(HL)
                CALL    NewMaze
                CALL    DoCentre
                CALL    SetUpThings
                EI
                RET

DoWeapon:       LD      A,$02
                CALL    ReadKey
                RET     Z
                LD      IX,ProjData
                LD      DE,ProjectSize
                CALL    WeapCreate
                RET

DoBomb:         LD      A,$05
                CALL    ReadKey
                RET     Z
                LD      A,(NoBombs)
                OR      A
                RET     Z
                DEC     A
                LD      (NoBombs),A
                CALL    PrintBombs
                LD      IY,ThingData
                LD      B,NoThings
BombLoop:       LD      A,(IY+$0F)
                OR      A
                JR      Z,NotBombed
                LD      (IY+$07),$C0
                LD      (IY+$0E),$FF
                LD      A,NoKillPoints
                CALL    AddPoints
NotBombed:      LD      DE,ThingSize
                ADD     IY,DE
                DJNZ    BombLoop
                RET

NoBombs:        DEFB    $00

CheckLeftRgt:   LD      A,(VelocityX)
                LD      C,A
                OR      A
                JR      Z,Stopped
                LD      A,(SgnVelX)
                LD      B,A
                OR      A
                LD      A,C
                JP      M,MovingLeft
                RLCA
                RLCA
                RLCA
                RLCA
                AND     $0F
                OR      $01
                LD      E,A
                LD      A,C
                SUB     E
                JR      C,Stopped
                LD      B,$00
                LD      C,A
                JP      DoTheMove
MovingLeft:     NEG
                RLCA
                RLCA
                RLCA
                RLCA
                AND     $0F
                OR      $01
                ADD     A,C
                JR      C,Stopped
                LD      B,$FF
                LD      C,A
                JP      DoTheMove
Stopped:        LD      C,$00
                LD      B,$00
DoTheMove:      LD      A,(BncTab+$00)
                LD      E,A
                LD      A,(BncTab+$02)
                XOR     E
                JR      Z,DoTheThrust
                LD      A,E
                OR      A
                JR      NZ,ThrustLeft
                LD      A,$00
                LD      (Direct),A
                LD      A,C
                ADD     A,Thrust
                LD      C,A
                JR      C,ChangeSgnVel
                JP      DoTheThrust
ThrustLeft:     LD      A,$10
                LD      (Direct),A
                LD      A,C
                SUB     Thrust
                LD      C,A
                JR      NC,DoTheThrust
ChangeSgnVel:   LD      A,B
                XOR     $FF
                LD      B,A
DoTheThrust:    LD      A,B
                LD      (SgnVelX),A
                LD      A,C
                LD      (VelocityX),A
                CP      $E0
                CCF
                JR      C,FullSpeedLR
                LD      HL,LowerX
                LD      A,C
                ADD     A,(HL)
                LD      (HL),A
FullSpeedLR:    LD      A,B
                ADC     A,$00
                LD      C,A
                RET     NZ
                LD      BC,$0000
                RET

CheckUpDown:    LD      A,(VelocityY)
                LD      E,A
                OR      A
                JR      Z,StoppedUp
                LD      A,(SgnVelY)
                LD      D,A
                OR      A
                LD      A,E
                JP      M,MovingUp
                RLCA
                RLCA
                RLCA
                RLCA
                AND     $0F
                OR      $01
                LD      C,A
                LD      A,E
                SUB     C
                JR      C,StoppedUp
                LD      D,$00
                LD      E,A
                JP      DoTheMoveUp
MovingUp:       NEG
                RLCA
                RLCA
                RLCA
                RLCA
                AND     $0F
                OR      $01
                ADD     A,E
                JR      C,StoppedUp
                LD      D,$FF
                LD      E,A
                JP      DoTheMoveUp
StoppedUp:      LD      E,$00
                LD      D,$00
DoTheMoveUp:    LD      A,(BncTab+$06)
                OR      A
                JR      NZ,ThrustUp
                LD      A,$00
                LD      (ThrustFlag),A
                LD      A,E
                ADD     A,Thrust
                LD      E,A
                JR      C,ChangeSgnUp
                JP      DoTheUpDown
ThrustUp:       LD      A,$08
                LD      (ThrustFlag),A
                LD      A,E
                SUB     Thrust
                LD      E,A
                JR      NC,DoTheUpDown
ChangeSgnUp:    LD      A,D
                XOR     $FF
                LD      D,A
DoTheUpDown:    LD      A,D
                LD      (SgnVelY),A
                LD      A,E
                LD      (VelocityY),A
                CP      $E0
                CCF
                JR      C,FullSpeedUD
                LD      HL,LowerY
                LD      A,E
                ADD     A,(HL)
                LD      (HL),A
FullSpeedUD:    LD      A,D
                ADC     A,$00
                LD      E,A
                RET     NZ
                LD      DE,$0000
                RET

LowerX:         DEFB    $00
SgnVelX:        DEFB    $00
VelocityX:      DEFB    $00
LowerY:         DEFB    $00
SgnVelY:        DEFB    $00
VelocityY:      DEFB    $00
Direct:         DEFB    $00
ThrustFlag:     DEFB    $00
CheckChange:    DEFB    $00

KillCells:      LD      HL,Cells
                LD      DE,CellSize
                LD      B,NoCells
KillCellLp:     LD      (HL),$00
                ADD     HL,DE
                DJNZ    KillCellLp
                RET

CheckXOn:       LD      DE,(TopXLeft)
                OR      A
                SBC     HL,DE
                JP      M,ChangeLeft
                ADD     HL,BC
                LD      DE,ScreenWidth
                SBC     HL,DE
                CCF
                RET     NC
                LD      HL,(TopXLeft)
                OR      A
                SBC     HL,BC
                ADD     HL,DE
                LD      (TopXLeft),HL
                LD      HL,CheckChange
                LD      (HL),$FF
                SCF
                RET

ChangeLeft:     LD      HL,(TopXLeft)
                LD      DE,ScreenWidth
                ADD     HL,BC
                SBC     HL,DE
                LD      (TopXLeft),HL
                LD      HL,CheckChange
                LD      (HL),$FF
                SCF
                RET

CheckYOn:       LD      DE,(TopYLeft)
                OR      A
                SBC     HL,DE
                JP      M,ChangeUp
                ADD     HL,BC
                LD      DE,ScreenHeight
                SBC     HL,DE
                CCF
                RET     NC
                LD      HL,(TopYLeft)
                OR      A
                SBC     HL,BC
                ADD     HL,DE
                LD      (TopYLeft),HL
                LD      HL,CheckChange
                LD      (HL),$FF
                SCF
                RET

ChangeUp:       LD      HL,(TopYLeft)
                LD      DE,ScreenHeight-$08
                ADD     HL,BC
                SBC     HL,DE
                LD      (TopYLeft),HL
                LD      HL,CheckChange
                LD      (HL),$FF
                SCF
                RET

MoveThings:     LD      HL,ThingData
                LD      B,NoThings
ThingLoop:      DEC     (HL)
                CALL    Z,DoThing
                LD      DE,ThingSize
                ADD     HL,DE
                DJNZ    ThingLoop
                RET

DoThing:        PUSH    BC
                PUSH    HL
                PUSH    HL
                POP     IY
                LD      A,(IY+$01)
                LD      (HL),A
                INC     (IY+$0E)
                LD      A,(IY+$07)
                CP      $C0
                JP      Z,DyeingThing
                LD      A,(IY+$0F)
                OR      A
                JR      NZ,DontIgnore
                LD      A,R
                AND     $03
                JR      Z,DontIgnore
                LD      L,(IY+$02)
                LD      H,(IY+$03)
                LD      E,(IY+$04)
                LD      D,(IY+$05)
                JP      SeeIfOn
DontIgnore:     LD      L,(IY+$06)
                LD      H,$00
                ADD     HL,HL
                LD      DE,ThingMoves
                ADD     HL,DE
                LD      A,(HL)
                INC     HL
                LD      H,(HL)
                LD      L,A
                CALL    CallHL
                LD      (IY+$02),L
                LD      (IY+$03),H
                LD      (IY+$04),E
                LD      (IY+$05),D
SeeIfOn:        PUSH    HL
                LD      C,(IY+$0D)
                LD      B,0
                EXX
                POP     DE
                LD      C,(IY+$0C)
                LD      B,0
                CALL    BigToScreen
                LD      L,(IY+$0A)
                LD      H,(IY+$0B)
                JR      C,ThingOffScrn
                LD      A,$FF
                LD      (ThingMove),A
                LD      (IY+$0F),A
                LD      A,(IY+$0E)
                AND     $06
                ADD     A,A
                LD      E,A
                LD      A,C
                AND     $03
                OR      E
                ADD     A,(IY+$07)
                LD      D,(IY+$09)
                mSprite(A,C,B,$38,D)
                POP     HL
                POP     BC
                RET

ThingOffScrn:   LD      (IY+$0F),$00
                EX      DE,HL
                POP     HL
                POP     BC
                LD      A,(DE)
                OR      A
                RET     Z
                LD      A,$06
                LD      (DE),A
                RET

DyeingThing:    LD      E,(IY+$04)
                LD      D,(IY+$05)
                LD      C,$08
                LD      B,$00
                EXX
                LD      E,(IY+$02)
                LD      D,(IY+$03)
                LD      C,$08
                LD      B,$00
                CALL    BigToScreen
                LD      L,(IY+$0A)
                LD      H,(IY+$0B)
                JR      C,DThingOffScrn
                LD      (IY+$0F),$FF
                LD      A,(IY+$0E)
                CP      $04
                JR      Z,DeadThing
                AND     $03
                ADD     A,A
                ADD     A,A
                LD      E,A
                LD      A,C
                AND     $03
                OR      E
                ADD     A,(IY+$07)
                LD      D,(IY+$09)
                mSprite(A,C,B,$38,D)
                POP     HL
                POP     BC
                RET

DeadThing:      LD      A,(HL)
                OR      A
                JR      Z,CellNotActive
                LD      (HL),$06
CellNotActive:  CALL    CreateThing
                POP     HL
                POP     BC
                RET

DThingOffScrn:  LD      (IY+$0F),$00
                LD      A,(IY+$0E)
                CP      $04
                JR      Z,DeadThing
                EX      DE,HL
                POP     HL
                POP     BC
                LD      A,(DE)
                OR      A
                RET     Z
                LD      A,$06
                LD      (DE),A
                RET

CallHL:         JP      (HL)

ChkScnThings:   LD      IY,ThingData
                LD      B,NoThings
ChkScnLoop:     PUSH    BC
                LD      E,(IY+$04)
                LD      D,(IY+$05)
                LD      C,(IY+$0D)
                LD      B,0
                EXX
                LD      E,(IY+$02)
                LD      D,(IY+$03)
                LD      C,(IY+$0C)
                LD      B,0
                CALL    BigToScreen
                LD      A,$FF
                ADC     A,$00
                LD      (IY+$0F),A
                POP     BC
                LD      DE,ThingSize
                ADD     IY,DE
                DJNZ    ChkScnLoop
                RET

DoProject:      LD      HL,ProjData+1
                LD      A,(HL)
                OR      A
                CALL    NZ,DealWProject
                LD      HL,ProjData+ProjectSize+1
                LD      A,(HL)
                OR      A
                CALL    NZ,DealWProject
                LD      HL,ProjData+2*ProjectSize+1
                LD      A,(HL)
                OR      A
                CALL    NZ,DealWProject
                LD      HL,ProjData+3*ProjectSize+1
                LD      A,(HL)
                OR      A
                CALL    NZ,DealWProject
                RET

DealWProject:   DEC     HL
                DEC     (HL)
                RET     NZ
                PUSH    HL
                POP     IX
                LD      (HL),A
                INC     (IX+$0E)
                CALL    MoveProject
                LD      E,(IX+$04)
                LD      D,(IX+$05)
                LD      C,$04
                LD      B,$00
                EXX
                LD      E,(IX+$02)
                LD      D,(IX+$03)
                LD      C,$04
                LD      B,$00
                CALL    BigToScreen
                LD      L,(IX+$0A)
                LD      H,(IX+$0B)
                JR      C,ProjectOffScn
                LD      A,(IX+$0E)
                CP      $20
                JR      NC,DeadProj
                AND     $18
                RRA
                LD      E,A
                LD      A,C
                AND     $03
                OR      E
                ADD     A,(IX+$0C)
                LD      D,(IX+$0D)
                mSprite(A,C,B,$38,D)
                RET

ProjectOffScn:  LD      A,(IX+$0E)
                CP      $20
                JR      NC,DeadProj
                LD      A,(HL)
                OR      A
                RET     Z
                LD      A,$06
                LD      (HL),A
                RET

DeadProj:       LD      (IX+$01),$00
                LD      A,(HL)
                OR      A
                RET     Z
                LD      A,$06
                LD      (HL),A
                RET

IncBorder:      PUSH    AF
                LD      A,$42
                LD      (ManColl),A
                LD      (ManColour),A
                LD      A,$10
                LD      (ColourCount),A
                LD      A,$81
                CALL    AddEnergy
                POP     AF
                RET

ManCount:       DEFB    $00
ManXPos:        DEFW    $0020
ManYPos:        DEFW    $0020
QuitCount:      DEFB    $00

CheckQuit:      LD      HL,QuitCount
                DEC     (HL)
                RET     NZ
                LD      (HL),$10
                LD      A,$08
                IN      A,($FE)
                OR      $E0
                INC     A
                RET     NZ
                LD      A,$F7
                IN      A,($FE)
                BIT     0,A
                JR      Z,ToggleSound
                AND     $0C
                JR      Z,QuitGame
                LD      A,$F7
                IN      A,($FE)
                AND     $02
                RET     NZ
                DI
Pause1:         LD      A,$F7
                IN      A,($FE)
                AND     $02
                JR      Z,Pause1
Pause2:         LD      A,$F7
                IN      A,($FE)
                LD      B,A
                AND     $0C
                JR      Z,QuitGame
                BIT     1,B
                JR      NZ,Pause2
                LD      (HL),$00
                EI
                RET

ToggleSound:    LD      A,$F7
                IN      A,($FE)
                RRA
                JR      NC,ToggleSound
                LD      A,(SoundFlag)
                CPL
                LD      (SoundFlag),A
                LD      (HL),$00
                RET

QuitGame:       LD      A,$00
                JP      EndGame

ChTopXLeft:     DEFB    $00
ChTopYLeft:     DEFB    $00

TopXLeft:       DEFW    $00
TopYLeft:       DEFW    $00

DrawScreen:     DI
                CALL    KillCells
                CALL    ChkScnThings
                mClearScreen(0)
                LD      A,$FF
                LD      BC,$0014
                CALL    TopImage
                CALL    DoFlasks
                CALL    Print
                DEFB    $03,$00,$00,$04,$17
                DEFM    " SCORE  "      ; SMB added an extra space here
                DEFB    $FF
                CALL    PrintScore
                CALL    Print
                DEFB    $03,$00,$02,$04,$06
                DEFM    " TIME   "      ; SMB added 2 extra spaces here
                DEFB    $FF
                CALL    PrintTime
                CALL    InitEnergy
                CALL    PrintBombs
                LD      IX,(MazeImages)
DrawRoomLoop:   LD      C,(IX+$00)
                LD      B,(IX+$01)
                LD      A,B
                AND     C
                INC     A
                JR      Z,DrawObjects
                CALL    ChBigToScreen
                CALL    DrawComposite
                LD      DE,$0003
                ADD     IX,DE
                JP      DrawRoomLoop

DrawObjects:    LD      IX,ObjList
DrawObjLoop:    LD      A,(IX+$00)
                LD      C,A
                CP      $FF
                RET     Z
                LD      B,(IX+$02)
                CALL    ChBigToScreen
                LD      A,(IX+$04)
                OR      A
                CALL    NZ,DrawImage
DoNextObj:      LD      DE,$000A
                ADD     IX,DE
                JP      DrawObjLoop

DrawComposite:  LD      L,(IX+$02)
                LD      H,$00
                LD      DE,CompPoints
                ADD     HL,HL
                ADD     HL,DE
                LD      E,(HL)
                INC     HL
                LD      D,(HL)
                EX      DE,HL
                LD      D,B
                LD      E,C
                LD      B,(HL)
                INC     HL
DrawCompLoop:   PUSH    BC
                LD      A,E
                ADD     A,(HL)
                LD      C,A
                INC     HL
                LD      A,D
                ADD     A,(HL)
                LD      B,A
                INC     HL
                LD      A,(HL)
                INC     HL
                CALL    DrawImage
                POP     BC
                DJNZ    DrawCompLoop
                RET

MazeNumber:     DEFB    $00
MazeImages:     DEFW    $0000
CollMaze:       DEFW    $0000
MazeObjects:    DEFW    $0000
MazeChanges:    DEFB    $00,$00,$00,$00
FlyTable:       DEFS    $10,$00


