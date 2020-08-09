
Black           EQU     $00
Blue            EQU     $41
Red             EQU     $42
Magenta         EQU     $43
Green           EQU     $44
Cyan            EQU     $45
Yellow          EQU     $46
White           EQU     $47

mPrintAt        macro(X,Y)
                  DEFB    $03,X,Y
                  endm

mSetAttr        macro(Colour)
                  DEFB    $04,Colour
                  endm

mCls            macro()
                  DEFB    $02
                  endm

mReturn         macro(NumReturn)
                  loop NumReturn
                    DEFB    $0D
                     lend
                  endm

mEndString      macro()
                  DEFB    $FF
                  endm

                org $7E00

FrontBegin:     DI
                LD      SP,$0000
                CALL    Print

                mCls()
                mPrintAt($0B,$01)
                mSetAttr(White)
                DEFM    "On The Run"
                mReturn(3)
                DEFM    "1  "
                mSetAttr(Yellow)
                DEFM    "Play the game"
                mReturn(3)
                mSetAttr(White)
                DEFM    "2  "
                mSetAttr(Cyan)
                DEFM    "Define the playing keys"
                mReturn(3)
                mSetAttr(White)
                DEFM    "3  "
                mSetAttr(Green)
                DEFM    "Select a joystick"
                mReturn(3)
                mSetAttr(White)
                DEFM    "4  "
                mSetAttr(Magenta)
                DEFM    "Instructions"
                mEndString()

SillyLoop:      CALL    FrontKeys
                CP      "1"
                JP      Z,First
                CP      "2"
                JP      Z,Define
                CP      "3"
                JP      Z,Joystick
                CP      "4"
                JP      Z,Instruct
                JP      SillyLoop

Define:         CALL    Print

                mCls()
                mPrintAt($0F,$00)
                mSetAttr(White)
                DEFM    "Present Controls"
                mReturn(2)
                DEFM    "1"
                mSetAttr(Yellow)
                DEFM    " Left"
                mReturn(2)
                mSetAttr(White)
                DEFM    "2"
                mSetAttr(Yellow)
                DEFM    " Right"
                mReturn(2)
                mSetAttr(White)
                DEFM    "3"
                mSetAttr(Yellow)
                DEFM    " Fire"
                mReturn(2)
                mSetAttr(White)
                DEFM    "4"
                mSetAttr(Yellow)
                DEFM    " Thrust"
                mReturn(2)
                mSetAttr(White)
                DEFM    "5"
                mSetAttr(Yellow)
                DEFM    " Centre Screen"
                mReturn(2)
                mSetAttr(White)
                DEFM    "6"
                mSetAttr(Yellow)
                DEFM    " Smart Bomb"
                mPrintAt($0F,$0C)
                mReturn(3)
                mSetAttr(White)
                DEFM    "0"
                mSetAttr(Magenta)
                DEFM    " Return to main menu"
                mReturn(2)
                mSetAttr(White)
                DEFM    " Press a number from 1 to 6 to"
                mReturn(1)
                DEFM    "select the control you want to"
                mReturn(1)
                DEFM    "change, then type the desired"
                mReturn(1)
                DEFM    "key. When you have finished"
                mReturn(1)
                DEFM    "press '0' to return to main menu"
                mEndString()

DefineLoop:     LD      HL,KeyTab
                LD      B,$06
                LD      C,$02
PrintDefsLp:    PUSH    BC
                LD      A,$03
                CALL    CharOut
                LD      A,$10
                CALL    CharOut
                LD      A,C
                CALL    CharOut
                CALL    Print
                DEFM    "            "
                mSetAttr(Cyan)
                mEndString()
                LD      A,$03
                CALL    CharOut
                LD      A,$10
                CALL    CharOut
                LD      A,C
                CALL    CharOut
                LD      E,(HL)
                INC     HL
                LD      D,(HL)
                INC     HL
                PUSH    HL
                CALL    PrintKey
                POP     HL
                POP     BC
                INC     C
                INC     C
                DJNZ    PrintDefsLp
WaitDefLoop:    CALL    FrontKeys
                CP      "0"
                JP      Z,FrontBegin
                CP      "1"
                JR      Z,DefLeft
                CP      "2"
                JR      Z,DefRight
                CP      "3"
                JR      Z,DefFire
                CP      "4"
                JR      Z,DefThrust
                CP      "5"
                JR      Z,DefCentre
                CP      "6"
                JR      Z,DefSmart
                JP      WaitDefLoop

DefLeft:        CALL    Print
                mPrintAt($10,$02)
                mEndString()
                LD      HL,KeyTab+$00
                JP      DoDefine

DefRight:       CALL    Print
                mPrintAt($10,$04)
                mEndString()
                LD      HL,KeyTab+$02
                JP      DoDefine

DefFire:        CALL    Print
                mPrintAt($10,$06)
                mEndString()
                LD      HL,KeyTab+$04
                JP      DoDefine

DefThrust:      CALL    Print
                mPrintAt($10,$08)
                mEndString()
                LD      HL,KeyTab+$06
                JP      DoDefine

DefCentre:      CALL    Print
                mPrintAt($10,$0A)
                mEndString()
                LD      HL,KeyTab+$08
                JP      DoDefine

DefSmart:       CALL    Print
                mPrintAt($10,$0C)
                mEndString()
                LD      HL,KeyTab+$0A
DoDefine:       XOR     A
                IN      A,($FE)
                OR      $E0
                INC     A
                JR      NZ,DoDefine
                CALL    Print
                DEFM    "            "
                mEndString()
ReDoDefine:     LD      D,$10
DefineOuter:    LD      E,$7F
DefineInner:    LD      A,E
                CP      $F7
                JR      Z,RepeatDefine
                IN      A,($FE)
                AND     D
                JR      Z,GotDefine
RepeatDefine:   RRC     E
                JR      C,DefineInner
                RRC     D
                JR      NC,DefineOuter
                JP      ReDoDefine
GotDefine:      LD      A,D
                CPL
                LD      (HL),E
                INC     HL
                LD      (HL),A
                JP      DefineLoop

Joystick:       CALL    Print

                mCls()
                mEndString()

JoyPrtLoop:     LD      D,$01
                CALL    Print
                mPrintAt($07,$00)
                mSetAttr(White)
                DEFM    "Joystick Selection"
                mReturn(2)
                DEFM    "1"
                mSetAttr(Yellow)
                DEFM    " Keyboard"
                mReturn(2)
                mSetAttr(White)
                DEFM    "2"
                mSetAttr(Yellow)
                DEFM    " Kempston"
                mReturn(2)
                mSetAttr(White)
                DEFM    "3"
                mSetAttr(Yellow)
                DEFM    " Protek"
                mReturn(2)
                mSetAttr(White)
                DEFM    "4"
                mSetAttr(Yellow)
                DEFM    " Sinclair Interface 2"
                mPrintAt($00,$0F)
                mSetAttr(White)
                DEFM    "0"
                mSetAttr(Magenta)
                DEFM    " Return to main menu"
                mReturn(2)
                mSetAttr(White)
                DEFM    " Press a number from 1 to 4 to"
                mReturn(1)
                DEFM    "select the joystick you want. Or"
                mReturn(1)
                DEFM    "press '0' to return to main menu"
                mReturn(2)
                mSetAttr(Green)
                DEFM    "If a joystick is selected the"
                mReturn(1)
                DEFM    "bottom 3 rows of the keyboard"
                mReturn(1)
                DEFM    "act as the smart bomb control."
                mEndString()

JoyOutLoop:     LD      B,$05
JoyInLoop:      CALL    FrontKeys
                LD      HL,ScanKeys
                LD      C,$02
                CP      "1"
                JR      Z,GotJoy
                LD      HL,Kempston
                LD      C,$04
                CP      "2"
                JR      Z,GotJoy
                LD      HL,Protek
                LD      C,$06
                CP      "3"
                JR      Z,GotJoy
                LD      HL,Sinclair
                LD      C,$08
                CP      "4"
                JR      Z,GotJoy
                CP      "0"
                JP      Z,FrontBegin
                DJNZ    JoyInLoop
                LD      A,D
                OR      A
                JP      Z,JoyPrtLoop
                LD      D,$00
                LD      A,$03
                CALL    CharOut
                LD      A,$02
                CALL    CharOut
                LD      A,(SelJoy)
                CALL    CharOut
                CALL    Print
                DEFM    "                    "
                mEndString()
                JP      JoyOutLoop

GotJoy:         LD      A,C
                LD      (SelJoy),A
                LD      (ModKeys),HL
                JP      JoyPrtLoop

SelJoy:         DEFB    $02

Instruct:       CALL    Print

                mCls()
                mPrintAt($07,$00)
                mSetAttr(White)
                DEFM    "Brief Instructions"
                mReturn(3)
                mSetAttr(Yellow)
                DEFM    "If it moves shoot it !"
                mReturn(2)
                DEFM    "If it doesn't, see what"
                mReturn(2)
                DEFM    "happens when you pick it up."
                mSetAttr(Cyan)
                mReturn(3)
                DEFM    "To quit the game press 3 and 4"
                mReturn(2)
                DEFM    "simultaniously."
                mReturn(2)
                DEFM    "Pressing 2 will pause the game."
                mReturn(2)
                DEFM    "Press 1 to toggle sound on/off."
                mReturn(3)
                mSetAttr(Green)
                DEFM    "Oh, sorry there's no high scores"
                mEndString()
                CALL    PressSpace
                JP      FrontBegin

PressSpace:     CALL    Print

                mPrintAt($05,$17)
                mSetAttr(Magenta)
                DEFM    "Press "
                mSetAttr(White)
                DEFM    "SPACE"
                mSetAttr(Magenta)
                DEFM    " to continue"
                mEndString()

WaitNoSpc:      CALL    FrontKeys
                CP      " "
                JR      Z,WaitNoSpc
WaitSpace:      CALL    FrontKeys
                CP      " "
                JR      NZ,WaitSpace
                RET

PrintKey:       PUSH    DE
                LD      HL,DefineTab
                LD      BC,$0005
GetRowDef:      RR      D
                JR      NC,GetColumnDef
                INC     HL
                JP      GetRowDef
GetColumnDef:   RR      E
                JR      NC,GotColumnDef
                ADD     HL,BC
                JP      GetColumnDef
GotColumnDef:   POP     DE
                LD      A,(HL)
                OR      A
                JP      M,TokenDef
                CALL    CharOut
                RET
TokenDef:       INC     A
                JR      Z,Caps
                INC     A
                JR      Z,Enter
                INC     A
                JR      Z,SymShft
                CALL    Print
                DEFM    "Space"
                mEndString()
                RET

Caps:           CALL    Print
                DEFM    "Caps Shift"
                mEndString()
                RET

Enter:          CALL    Print
                DEFM    "Enter"
                mEndString()
                RET

SymShft:        CALL    Print
                DEFM    "Symbol Shift"
                mEndString()
                RET

EndGame:        DI
                OR      A
                JR      Z,GaveUp
                DEC     A
                JR      Z,TimeUp
                DEC     A
                JP      Z,Killed_FE
                CALL    Print

                mCls()
                mPrintAt($00,$00)
                mSetAttr(White)
                DEFM    "You are victorious !"
                DEFB    $0D
                DEFM    "You collected all the flasks."
                mEndString()
                CALL    TellTime
                CALL    TellScore
                CALL    PressSpace
                JP      FrontBegin

GaveUp:         CALL    Print

                mCls()
                mPrintAt($00,$00)
                mSetAttr(White)
                DEFM    "You gave up, coward!"
                mEndString()
                CALL    TellTime
                CALL    TellFlasks
                CALL    TellScore
                CALL    PressSpace
                JP      FrontBegin

TimeUp:         CALL    Print

                mCls()
                mPrintAt($00,$00)
                mSetAttr(White)
                DEFM    "You ran out of time."
                mEndString()
                CALL    TellFlasks
                CALL    TellScore
                CALL    PressSpace
                JP      FrontBegin

Killed_FE:      CALL    Print

                mCls()
                mPrintAt($00,$00)
                mSetAttr(White)
                DEFM    "You have been killed."
                mEndString()
                CALL    TellTime
                CALL    TellFlasks
                CALL    TellScore
                CALL    PressSpace
                JP      FrontBegin

TellTime:       CALL    Print
                DEFB    $0D
                DEFM    "You had "
                mEndString()
                LD      A,(Minutes)
                LD      L,A
                LD      H,$00
                CALL    PrintDec
                CALL    Print
                DEFM    " minutes and "
                DEFB    $0D
                mEndString()
                LD      A,(Seconds)
                LD      L,A
                LD      H,$00
                CALL    PrintDec
                CALL    Print
                DEFM    " seconds left."
                mEndString()
                RET

TellFlasks:     CALL    Print
                DEFB    $0D
                DEFM    "You collected "
                mEndString()
                LD      B,$06
                LD      C,$00
                LD      A,(Flasks)
NumFlasks:      ADD     A,A
                JR      NC,NotThisFlask
                INC     C
NotThisFlask:   DJNZ    NumFlasks
                LD      L,C
                LD      H,$00
                PUSH    BC
                CALL    PrintDec
                CALL    Print
                DEFM    " flask"
                mEndString()
                POP     BC
                DEC     C
                JR      Z,OnlyOneFlsk
                LD      A,"s"
                CALL    CharOut
OnlyOneFlsk:    LD      A,"."
                CALL    CharOut
                RET

TellScore:      CALL    Print
                DEFB    $0D
                DEFM    "and scored "
                mEndString()
                LD      HL,(Score)
                CALL    PrintDec
                LD      HL,(Score)
                LD      A,L
                OR      H
                JR      Z,ZeroPoints
                LD      A,"0"
                CALL    CharOut
ZeroPoints:     CALL    Print
                DEFM    " points."
                mEndString()
                RET

PrintDec:       LD      A,H
                OR      L
                JR      Z,NoDecPrt
                LD      IX,Powers_FE
                LD      B,$04
                LD      C,$00
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
                RET

Powers_FE       DEFW    10000
                DEFW    1000
                DEFW    100
                DEFW    10

NoDecPrt:       CALL    Print
                DEFM    "no"
                mEndString()
                RET

FrontKeys:      PUSH    HL
                PUSH    DE
                PUSH    BC
                LD      A,(PreviousKey)
                LD      D,A
                LD      HL,KeyDelay
                LD      B,(HL)
                LD      C,$80
                LD      A,D
                LD      (LastKey),A
SameKey:        CALL    ScanRoutine
                LD      D,A
                LD      A,(LastKey)
                CP      D
                JR      NZ,KeyChange
                DEC     BC
                LD      A,B
                OR      C
                JR      NZ,SameKey
KeyChange:      LD      C,$00
                LD      A,D
                OR      A
                JR      Z,NoLastKey
                LD      C,$01
                LD      A,(PreviousKey)
                CP      D
                JR      Z,NoLastKey
                LD      C,$04
NoLastKey:      LD      A,C
                LD      (KeyDelay),A
                LD      A,D
                LD      (PreviousKey),A
                POP     BC
                POP     DE
                POP     HL
                OR      A
                RET

LastKey:        DEFB    $00
PreviousKey:    DEFB    $00
KeyDelay:       DEFB    $00

ScanRoutine:    PUSH    BC
                LD      D,$10
ScanOuter:      LD      E,$7F
ScanInner:      LD      A,E
                IN      A,($FE)
                AND     D
                JR      Z,KeyDown
RepeatScan:     RRC     E
                JR      C,ScanInner
                RRC     D
                JR      NC,ScanOuter
                POP     BC
                XOR     A
                RET
KeyDown:        PUSH    DE
                LD      HL,ScanTable
                LD      BC,$0005
GetRow:         RR      D
                JR      C,GetColumn
                INC     HL
                JP      GetRow
GetColumn:      RR      E
                JR      NC,GotColumn
                ADD     HL,BC
                JP      GetColumn
GotColumn:      POP     DE
                LD      A,(HL)
                OR      A
                JR      Z,RepeatScan
                LD      A,$7F
                IN      A,($FE)
                AND     $02
                LD      DE,$0050
                JR      Z,ItsShift
                LD      A,$FE
                IN      A,($FE)
                AND     $01
                JR      NZ,NoShift
                LD      DE,$0028
ItsShift:       ADD     HL,DE
NoShift:        POP     BC
                LD      A,(HL)
                OR      A
                RET

ScanTable:      DEFB    $00
                DEFM    "ZXCVASDFGQWERT12345"
                DEFM    "09876POIUY"
                DEFB    $0D
                DEFM    "LKJH "
                DEFB    $00
                DEFM    "MNB"

                DEFB    $00
                DEFM    "zxcvasdfgqwert12345"
                DEFM    "09876poiuy"
                DEFB    $0D
                DEFM    "lkjh "
                DEFB    $00
                DEFM    "mnb"

                DEFB    $00
                DEFM    ":#?/ASDFGQWE<>!@#$%"
                DEFM    "_)('&"
                DEFB    $22
                DEFM    ";IUY"
                DEFB    $0D
                DEFM    "=+-^ "
                DEFB    $00
                DEFM    ".,*"

DefineTab:      DEFB    $FF
                DEFM    "ZXCVASDFGQWERT12345"
                DEFM    "09876POIUY"
                DEFB    $FE
                DEFM    "LKJH"
                DEFB    $FC,$FD
                DEFM    "MNB"

;               END

