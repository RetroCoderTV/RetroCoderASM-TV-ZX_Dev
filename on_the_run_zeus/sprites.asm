DisplayFile     EQU     $4000
Attributes      EQU     $5800
ScreenWidth     EQU     $0080
ChScreenWidth   EQU     $0020
ChScreenHeight  EQU     $0014

TopImage:       PUSH    HL
                PUSH    DE
                LD      (ImagePosX),BC
                LD      L,A
                LD      H,HIGH SceneSet
                LD      E,(HL)
                INC     H
                LD      D,(HL)
                PUSH    DE              ;Pointer to sprite
                INC     H
                LD      B,(HL)          ;Height
                INC     H
                LD      C,(HL)          ;Width
                LD      L,C
                LD      H,0
                LD      (AddWidth),HL
                PUSH    BC              ;Height, Width
                LD      BC,(ImagePosX)
                LD      A,B
                ADD     A,B
                ADD     A,A
                ADD     A,A
                LD      B,A
                LD      A,C
                ADD     A,C
                ADD     A,A
                ADD     A,A
                LD      C,A
                mConvert(C,B)
                POP     BC
                LD      A,B
                LD      B,C
                PUSH    DE
                EXX
                POP     HL
                EXX
                POP     DE
                JP      DrImOutLoop

DrawImage:      PUSH    HL
                PUSH    DE
                LD      (ImagePosX),BC
                LD      L,A
                LD      H,HIGH SceneSet
                LD      E,(HL)
                INC     H
                LD      D,(HL)
                PUSH    DE              ;Pointer to sprite
                INC     H
                LD      B,(HL)          ;Height
                INC     H
                LD      C,(HL)          ;Width
                LD      L,C
                LD      H,0
                LD      (AddWidth),HL
                CALL    CheckOnX
                JP      C,PopDoneImage
                CALL    CheckOnY
                JP      C,PopDoneImage
                POP     HL              ;Pointer to sprite
                LD      A,(ImagePosY)
                OR      A
                JP      P,NoTopClip
                NEG
                LD      E,A
                LD      A,B
                SUB     E
                LD      B,A
                LD      A,E
                PUSH    HL
                LD      HL,(AddWidth)
                LD      D,H
                LD      E,L
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,DE
                EX      DE,HL
                POP     HL
TopClipLoop:    ADD     HL,DE
                DEC     A
                JR      NZ,TopClipLoop
                XOR     A
                LD      (ImagePosY),A
                JP      NoClipBottom
NoTopClip:      ADD     A,B
                SUB     ChScreenHeight
                JR      C,NoClipBottom
                LD      E,A
                LD      A,B
                SUB     E
                LD      B,A
NoClipBottom:   LD      A,(ImagePosX)
                OR      A
                JP      P,NoLeftClip
                NEG
                LD      E,A
                LD      A,C
                SUB     E
                LD      C,A
                LD      D,0
                ADD     HL,DE
                XOR     A
                LD      (ImagePosX),A
                JP      NoRightClip
NoLeftClip:     ADD     A,C
                SUB     ChScreenWidth
                JR      C,NoRightClip
                LD      E,A
                LD      A,C
                SUB     E
                LD      C,A
NoRightClip:    PUSH    HL              ;Pointer to sprite
                PUSH    BC              ;Height, Width
                LD      BC,(ImagePosX)
                LD      A,B
                ADD     A,B
                ADD     A,A
                ADD     A,A
                ADD     A,$20
                LD      B,A
                LD      A,C
                ADD     A,C
                ADD     A,A
                ADD     A,A
                LD      C,A
                mConvert(C,B)
                POP     BC
                LD      A,B
                LD      B,C
                PUSH    DE
                EXX
                POP     HL
                EXX
                POP     DE
DrImOutLoop:    EX      AF,AF'
                PUSH    HL
                PUSH    DE
DrImLoop0:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop0
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop1:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop1
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop2:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop2
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop3:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop3
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop4:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop4
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop5:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop5
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop6:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop6
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                INC     H
                LD      B,C
                PUSH    HL
                PUSH    DE
DrImLoop7:      LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImLoop7
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                POP     HL
                LD      B,C
                LD      A,B
                PUSH    DE
                EXX
                POP     DE
                LD      B,A
                PUSH    HL
                PUSH    DE
DrImAttrLoop:   LD      A,(DE)
                LD      (HL),A
                INC     L
                INC     DE
                DJNZ    DrImAttrLoop
                POP     DE
                LD      HL,(AddWidth)
                ADD     HL,DE
                EX      DE,HL
                LD      BC,$0020
                POP     HL
                ADD     HL,BC
                PUSH    DE
                EXX
                POP     DE
                EX      AF,AF'
                DEC     A
                JR      Z,DoneImage
                EX      AF,AF'
                CALL    OverLine
                EX      AF,AF'
                JP      DrImOutLoop

PopDoneImage:   POP     DE
DoneImage:      POP     DE
                POP     HL
                RET

AddWidth:       DEFW    $0000
ImagePosX:      DEFB    $00
ImagePosY:      DEFB    $00

CheckOnX:       LD      A,(ImagePosX)
                OR      A
                JP      M,CheckOnXOver
                CP      ChScreenWidth
                CCF
                RET
CheckOnXOver:   ADD     A,C
                CCF
                RET     NZ
                SCF
                RET

CheckOnY:       LD      A,(ImagePosY)
                OR      A
                JP      M,CheckOnYOver
                CP      ChScreenHeight
                CCF
                RET
CheckOnYOver:   ADD     A,B
                CCF
                RET     NZ
                SCF
                RET

SpriteTable:    DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Draw10,Erase10
                DEFW    Draw12,Erase12
                DEFW    Draw14,Erase14
                DEFW    Draw16,Erase16
                DEFW    Draw20,Erase20
                DEFW    Draw22,Erase22
                DEFW    Draw24,Erase24
                DEFW    Draw26,Erase26
                DEFW    Draw30,Erase30
                DEFW    Draw32,Erase32
                DEFW    Draw34,Erase34
                DEFW    Draw36,Erase36
                DEFW    Draw40,Erase40
                DEFW    Draw42,Erase42
                DEFW    Draw44,Erase44
                DEFW    Draw46,Erase46

Return:         RET

DrawLine18:     mDrawLine(1)
                INC     H
DrawLine16:     mDrawLine(1)
                INC     H
DrawLine14:     mDrawLine(1)
                INC     H
DrawLine12:     mDrawLine(1)
                mDrawAttr(1)
                RET

DrawLine28:     mDrawLine(2)             ;DE=Location of sprite data
                INC     H               ;HL=Screen location
DrawLine26:     mDrawLine(2)
                INC     H
DrawLine24:     mDrawLine(2)
                INC     H
DrawLine22:     mDrawLine(2)
                mDrawAttr(2)
                RET

DrawLine38:     mDrawLine(3)
                INC     H
DrawLine36:     mDrawLine(3)
                INC     H
DrawLine34:     mDrawLine(3)
                INC     H
DrawLine32:     mDrawLine(3)
                mDrawAttr(3)
                RET

DrawLine48:     mDrawLine(4)
                INC     H
DrawLine46:     mDrawLine(4)
                INC     H
DrawLine44:     mDrawLine(4)
                INC     H
DrawLine42:     mDrawLine(4)
                mDrawAttr(4)
                RET

Draw10:         CALL    DrawLine18
DrawLoop10:     CALL    OverLine
MidDraw10:      DEC     C
                RET     Z
                CALL    DrawLine18
                JP      DrawLoop10

Draw12:         CALL    DrawLine16
DrawLoop12:     CALL    OverLine
MidDraw12:      DEC     C
                JP      Z,DrawLine12
                CALL    DrawLine18
                JP      DrawLoop12

Draw14:         CALL    DrawLine14
DrawLoop14:     CALL    OverLine
MidDraw14:      DEC     C
                JP      Z,DrawLine14
                CALL    DrawLine18
                JP      DrawLoop14

Draw16:         CALL    DrawLine12
DrawLoop16:     CALL    OverLine
MidDraw16:      DEC     C
                JP      Z,DrawLine16
                CALL    DrawLine18
                JP      DrawLoop16

Draw20:         CALL    DrawLine28
DrawLoop20:     CALL    OverLine
MidDraw20:      DEC     C
                RET     Z
                CALL    DrawLine28
                JP      DrawLoop20

Draw22:         CALL    DrawLine26
DrawLoop22:     CALL    OverLine
MidDraw22:      DEC     C
                JP      Z,DrawLine22
                CALL    DrawLine28
                JP      DrawLoop22

Draw24:         CALL    DrawLine24
DrawLoop24:     CALL    OverLine
MidDraw24:      DEC     C
                JP      Z,DrawLine24
                CALL    DrawLine28
                JP      DrawLoop24

Draw26:         CALL    DrawLine22
DrawLoop26:     CALL    OverLine
MidDraw26:      DEC     C
                JP      Z,DrawLine26
                CALL    DrawLine28
                JP      DrawLoop26

Draw30:         CALL    DrawLine38
DrawLoop30:     CALL    OverLine
MidDraw30:      DEC     C
                RET     Z
                CALL    DrawLine38
                JP      DrawLoop30

Draw32:         CALL    DrawLine36
DrawLoop32:     CALL    OverLine
MidDraw32:      DEC     C
                JP      Z,DrawLine32
                CALL    DrawLine38
                JP      DrawLoop32

Draw34:         CALL    DrawLine34
DrawLoop34:     CALL    OverLine
MidDraw34:      DEC     C
                JP      Z,DrawLine34
                CALL    DrawLine38
                JP      DrawLoop34

Draw36:         CALL    DrawLine32
DrawLoop36:     CALL    OverLine
MidDraw36:      DEC     C
                JP      Z,DrawLine36
                CALL    DrawLine38
                JP      DrawLoop36

Draw40:         CALL    DrawLine48
DrawLoop40:     CALL    OverLine
MidDraw40:      DEC     C
                RET     Z
                CALL    DrawLine48
                JP      DrawLoop40

Draw42:         CALL    DrawLine46
DrawLoop42:     CALL    OverLine
MidDraw42:      DEC     C
                JP      Z,DrawLine42
                CALL    DrawLine48
                JP      DrawLoop42

Draw44:         CALL    DrawLine44
DrawLoop44:     CALL    OverLine
MidDraw44:      DEC     C
                JP      Z,DrawLine44
                CALL    DrawLine48
                JP      DrawLoop44

Draw46:         CALL    DrawLine42
DrawLoop46:     CALL    OverLine
MidDraw46:      DEC     C
                JP      Z,DrawLine46
                CALL    DrawLine48
                JP      DrawLoop46

EraseLine18:    mEraseLine(1)
                INC     H
EraseLine16:    mEraseLine(1)
                INC     H
EraseLine14:    mEraseLine(1)
                INC     H
EraseLine12:    mEraseLine(1)
                RET

EraseLine28:    mEraseLine(2)            ;DE=Location of sprite data
                INC     H               ;HL=Screen location
EraseLine26:    mEraseLine(2)
                INC     H
EraseLine24:    mEraseLine(2)
                INC     H
EraseLine22:    mEraseLine(2)
                RET

EraseLine38:    mEraseLine(3)
                INC     H
EraseLine36:    mEraseLine(3)
                INC     H
EraseLine34:    mEraseLine(3)
                INC     H
EraseLine32:    mEraseLine(3)
                RET

EraseLine48:    mEraseLine(4)
                INC     H
EraseLine46:    mEraseLine(4)
                INC     H
EraseLine44:    mEraseLine(4)
                INC     H
EraseLine42:    mEraseLine(4)
                RET

Erase10:        CALL    EraseLine18
EraseLoop10:    CALL    OverLine
MidErase10:     DEC     C
                RET     Z
                CALL    EraseLine18
                JP      EraseLoop10

Erase12:        CALL    EraseLine16
EraseLoop12:    CALL    OverLine
MidErase12:     DEC     C
                JP      Z,EraseLine12
                CALL    EraseLine18
                JP      EraseLoop12

Erase14:        CALL    EraseLine14
EraseLoop14:    CALL    OverLine
MidErase14:     DEC     C
                JP      Z,EraseLine14
                CALL    EraseLine18
                JP      EraseLoop14

Erase16:        CALL    EraseLine12
EraseLoop16:    CALL    OverLine
MidErase16:     DEC     C
                JP      Z,EraseLine16
                CALL    EraseLine18
                JP      EraseLoop16

Erase20:        CALL    EraseLine28
EraseLoop20:    CALL    OverLine
MidErase20:     DEC     C
                RET     Z
                CALL    EraseLine28
                JP      EraseLoop20

Erase22:        CALL    EraseLine26
EraseLoop22:    CALL    OverLine
MidErase22:     DEC     C
                JP      Z,EraseLine22
                CALL    EraseLine28
                JP      EraseLoop22

Erase24:        CALL    EraseLine24
EraseLoop24:    CALL    OverLine
MidErase24:     DEC     C
                JP      Z,EraseLine24
                CALL    EraseLine28
                JP      EraseLoop24

Erase26:        CALL    EraseLine22
EraseLoop26:    CALL    OverLine
MidErase26:     DEC     C
                JP      Z,EraseLine26
                CALL    EraseLine28
                JP      EraseLoop26

Erase30:        CALL    EraseLine38
EraseLoop30:    CALL    OverLine
MidErase30:     DEC     C
                RET     Z
                CALL    EraseLine38
                JP      EraseLoop30

Erase32:        CALL    EraseLine36
EraseLoop32:    CALL    OverLine
MidErase32:     DEC     C
                JP      Z,EraseLine32
                CALL    EraseLine38
                JP      EraseLoop32

Erase34:        CALL    EraseLine34
EraseLoop34:    CALL    OverLine
MidErase34:     DEC     C
                JP      Z,EraseLine34
                CALL    EraseLine38
                JP      EraseLoop34

Erase36:        CALL    EraseLine32
EraseLoop36:    CALL    OverLine
MidErase36:     DEC     C
                JP      Z,EraseLine36
                CALL    EraseLine38
                JP      EraseLoop36

Erase40:        CALL    EraseLine48
EraseLoop40:    CALL    OverLine
MidErase40:     DEC     C
                RET     Z
                CALL    EraseLine48
                JP      EraseLoop40

Erase42:        CALL    EraseLine46
EraseLoop42:    CALL    OverLine
MidErase42:     DEC     C
                JP      Z,EraseLine42
                CALL    EraseLine48
                JP      EraseLoop42

Erase44:        CALL    EraseLine44
EraseLoop44:    CALL    OverLine
MidErase44:     DEC     C
                JP      Z,EraseLine44
                CALL    EraseLine48
                JP      EraseLoop44

Erase46:        CALL    EraseLine42
EraseLoop46:    CALL    OverLine
MidErase46:     DEC     C
                JP      Z,EraseLine46
                CALL    EraseLine48
                JP      EraseLoop46

ClipTable:      DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return,Return,Return
                DEFW    Return,Return
                DEFW    Clip10,Clear10
                DEFW    MidDraw10,MidErase10
                DEFW    MidClip10,MidClear10
                DEFW    Return,Return
                DEFW    Clip12,Clear12
                DEFW    MidDraw12,MidErase12
                DEFW    MidClip12,MidClear12
                DEFW    Return,Return
                DEFW    Clip14,Clear14
                DEFW    MidDraw14,MidErase14
                DEFW    MidClip14,MidClear14
                DEFW    Return,Return
                DEFW    Clip16,Clear16
                DEFW    MidDraw16,MidErase16
                DEFW    MidClip16,MidClear16
                DEFW    Return,Return
                DEFW    Clip20,Clear20
                DEFW    MidDraw20,MidErase20
                DEFW    MidClip20,MidClear20
                DEFW    Return,Return
                DEFW    Clip22,Clear22
                DEFW    MidDraw22,MidErase22
                DEFW    MidClip22,MidClear22
                DEFW    Return,Return
                DEFW    Clip24,Clear24
                DEFW    MidDraw24,MidErase24
                DEFW    MidClip24,MidClear24
                DEFW    Return,Return
                DEFW    Clip26,Clear26
                DEFW    MidDraw26,MidErase26
                DEFW    MidClip26,MidClear26
                DEFW    Return,Return
                DEFW    Clip30,Clear30
                DEFW    MidDraw30,MidErase30
                DEFW    MidClip30,MidClear30
                DEFW    Return,Return
                DEFW    Clip32,Clear32
                DEFW    MidDraw32,MidErase32
                DEFW    MidClip32,MidClear32
                DEFW    Return,Return
                DEFW    Clip34,Clear34
                DEFW    MidDraw34,MidErase34
                DEFW    MidClip34,MidClear34
                DEFW    Return,Return
                DEFW    Clip36,Clear36
                DEFW    MidDraw36,MidErase36
                DEFW    MidClip36,MidClear36
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    MidDraw40,MidErase40
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    MidDraw42,MidErase42
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    MidDraw44,MidErase44
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    Return,Return
                DEFW    MidDraw46,MidErase46
                DEFW    Return,Return

ClipLine18:     mClipLine(1)            ;DE=Location of sprite data
                INC     H               ;HL=Screen location
ClipLine16:     mClipLine(1)
                INC     H
ClipLine14:     mClipLine(1)
                INC     H
ClipLine12:     mClipLine(1)
                mDrawAttr(1)
                RET

ClipLine28:     mClipLine(2)            ;DE=Location of sprite data
                INC     H               ;HL=Screen location
ClipLine26:     mClipLine(2)
                INC     H
ClipLine24:     mClipLine(2)
                INC     H
ClipLine22:     mClipLine(2)
                mDrawAttr(2)
                RET

ClipLine38:     mClipLine(3)
                INC     H
ClipLine36:     mClipLine(3)
                INC     H
ClipLine34:     mClipLine(3)
                INC     H
ClipLine32:     mClipLine(3)
                mDrawAttr(3)
                RET

Clip10:         CALL    ClipLine18
ClipLoop10:     CALL    OverLine
MidClip10:      DEC     C
                RET     Z
                CALL    ClipLine18
                JP      ClipLoop10

Clip12:         CALL    ClipLine16
ClipLoop12:     CALL    OverLine
MidClip12:      DEC     C
                JP      Z,ClipLine12
                CALL    ClipLine18
                JP      ClipLoop12

Clip14:         CALL    ClipLine14
ClipLoop14:     CALL    OverLine
MidClip14:      DEC     C
                JP      Z,ClipLine14
                CALL    ClipLine18
                JP      ClipLoop14

Clip16:         CALL    ClipLine12
ClipLoop16:     CALL    OverLine
MidClip16:      DEC     C
                JP      Z,ClipLine16
                CALL    ClipLine18
                JP      ClipLoop16

Clip20:         CALL    ClipLine28
ClipLoop20:     CALL    OverLine
MidClip20:      DEC     C
                RET     Z
                CALL    ClipLine28
                JP      ClipLoop20

Clip22:         CALL    ClipLine26
ClipLoop22:     CALL    OverLine
MidClip22:      DEC     C
                JP      Z,ClipLine22
                CALL    ClipLine28
                JP      ClipLoop22

Clip24:         CALL    ClipLine24
ClipLoop24:     CALL    OverLine
MidClip24:      DEC     C
                JP      Z,ClipLine24
                CALL    ClipLine28
                JP      ClipLoop24

Clip26:         CALL    ClipLine22
ClipLoop26:     CALL    OverLine
MidClip26:      DEC     C
                JP      Z,ClipLine26
                CALL    ClipLine28
                JP      ClipLoop26

Clip30:         CALL    ClipLine38
ClipLoop30:     CALL    OverLine
MidClip30:      DEC     C
                RET     Z
                CALL    ClipLine38
                JP      ClipLoop30

Clip32:         CALL    ClipLine36
ClipLoop32:     CALL    OverLine
MidClip32:      DEC     C
                JP      Z,ClipLine32
                CALL    ClipLine38
                JP      ClipLoop32

Clip34:         CALL    ClipLine34
ClipLoop34:     CALL    OverLine
MidClip34:      DEC     C
                JP      Z,ClipLine34
                CALL    ClipLine38
                JP      ClipLoop34

Clip36:         CALL    ClipLine32
ClipLoop36:     CALL    OverLine
MidClip36:      DEC     C
                JP      Z,ClipLine36
                CALL    ClipLine38
                JP      ClipLoop36

ClearLine18:    mClearLine(1)            ;DE=Location of sprite data
                INC     H               ;HL=Screen location
ClearLine16:    mClearLine(1)
                INC     H
ClearLine14:    mClearLine(1)
                INC     H
ClearLine12:    mClearLine(1)
                RET

ClearLine28:    mClearLine(2)            ;DE=Location of sprite data
                INC     H               ;HL=Screen location
ClearLine26:    mClearLine(2)
                INC     H
ClearLine24:    mClearLine(2)
                INC     H
ClearLine22:    mClearLine(2)
                RET

ClearLine38:    mClearLine(3)
                INC     H
ClearLine36:    mClearLine(3)
                INC     H
ClearLine34:    mClearLine(3)
                INC     H
ClearLine32:    mClearLine(3)
                RET

Clear10:        CALL    ClearLine18
ClearLoop10:    CALL    OverLine
MidClear10:     DEC     C
                RET     Z
                CALL    ClearLine18
                JP      ClearLoop10

Clear12:        CALL    ClearLine16
ClearLoop12:    CALL    OverLine
MidClear12:     DEC     C
                JP      Z,ClearLine12
                CALL    ClearLine18
                JP      ClearLoop12

Clear14:        CALL    ClearLine14
ClearLoop14:    CALL    OverLine
MidClear14:     DEC     C
                JP      Z,ClearLine14
                CALL    ClearLine18
                JP      ClearLoop14

Clear16:        CALL    ClearLine12
ClearLoop16:    CALL    OverLine
MidClear16:     DEC     C
                JP      Z,ClearLine16
                CALL    ClearLine18
                JP      ClearLoop16

Clear20:        CALL    ClearLine28
ClearLoop20:    CALL    OverLine
MidClear20:     DEC     C
                RET     Z
                CALL    ClearLine28
                JP      ClearLoop20

Clear22:        CALL    ClearLine26
ClearLoop22:    CALL    OverLine
MidClear22:     DEC     C
                JP      Z,ClearLine22
                CALL    ClearLine28
                JP      ClearLoop22

Clear24:        CALL    ClearLine24
ClearLoop24:    CALL    OverLine
MidClear24:     DEC     C
                JP      Z,ClearLine24
                CALL    ClearLine28
                JP      ClearLoop24

Clear26:        CALL    ClearLine22
ClearLoop26:    CALL    OverLine
MidClear26:     DEC     C
                JP      Z,ClearLine26
                CALL    ClearLine28
                JP      ClearLoop26

Clear30:        CALL    ClearLine38
ClearLoop30:    CALL    OverLine
MidClear30:     DEC     C
                RET     Z
                CALL    ClearLine38
                JP      ClearLoop30

Clear32:        CALL    ClearLine36
ClearLoop32:    CALL    OverLine
MidClear32:     DEC     C
                JP      Z,ClearLine32
                CALL    ClearLine38
                JP      ClearLoop32

Clear34:        CALL    ClearLine34
ClearLoop34:    CALL    OverLine
MidClear34:     DEC     C
                JP      Z,ClearLine34
                CALL    ClearLine38
                JP      ClearLoop34

Clear36:        CALL    ClearLine32
ClearLoop36:    CALL    OverLine
MidClear36:     DEC     C
                JP      Z,ClearLine36
                CALL    ClearLine38
                JP      ClearLoop36

OverLine:       LD      A,H
                AND     $58
                LD      H,A
                LD      A,L
                ADD     A,$20
                LD      L,A
                AND     $E0
                RET     NZ
                LD      A,H
                ADD     A,$08
                LD      H,A
                CP      $58
                RET     NZ
                POP     HL
                RET

DoTime:         LD      HL,Jiffys
                INC     (HL)
                LD      A,(HL)
                CP      $19
                JR      Z,DoColon
                CP      $32
                RET     NZ
                XOR     A
                LD      (HL),A
                LD      HL,Seconds
                DEC     (HL)
                JP      P,DoneDecTime
                LD      (HL),$3B
                LD      HL,Minutes
                DEC     (HL)
                JP      P,DoneDecTime
                LD      A,$01
                JP      EndGame
DoneDecTime:    CALL    PrintTime
                RET

DoColon:        CALL    Print
                DEFB    $03,$0A,$02,$04,$06
                DEFM    ":"
                DEFB    $FF
                RET

Minutes:        DEFB    $00
Seconds:        DEFB    $00
Jiffys:         DEFB    $00

UpDate:         LD      HL,UpDateCount
                DEC     (HL)
                RET     NZ
                LD      (HL),$02
                LD      HL,(ImagePosX)
                PUSH    HL
                LD      HL,(AddWidth)
                PUSH    HL
                CALL    PrintEnergy
                CALL    PrintScore
                POP     HL
                LD      (AddWidth),HL
                POP     HL
                LD      (ImagePosX),HL
                RET

UpDateCount:    DEFB    $04

DrawNew:        LD      (HL),$02
                PUSH    HL
                POP     IX
                INC     HL
                LD      L,(HL)
                LD      H,HIGH SprSet
                LD      E,(HL)
                LD      (IX+$08),E
                INC     H
                LD      D,(HL)
                LD      (IX+$09),D      ;DE=Pointer to sprite
                INC     H
                LD      B,(HL)
                LD      (IX+$0C),B      ;Height
                INC     H
                LD      C,(HL)
                LD      (IX+$0D),C      ;Width
                CALL    CheckClip
                JR      C,ClipNew
                LD      A,C
                ADD     A,A
                ADD     A,A
                ADD     A,A
                LD      C,A
                LD      A,(IX+$03)
                AND     $03
                ADD     A,A
                OR      C
                ADD     A,A
                LD      C,A
                LD      B,0
                LD      HL,SpriteTable
                ADD     HL,BC
                LD      C,(HL)
                INC     HL
                LD      B,(HL)
                PUSH    BC              ;Draw routine
                INC     HL
                LD      C,(HL)
                LD      (IX+$0A),C
                INC     HL
                LD      B,(HL)
                LD      (IX+$0B),B      ;Erase routine
                EXX                     ;Save DE
                LD      A,(IX+$02)
                ADD     A,A
                LD      C,A
                LD      A,(IX+$03)
                ADD     A,$10
                ADD     A,A
                LD      B,A
                mConvert(C,B)
                LD      (IX+$06),L
                LD      (IX+$07),H
                PUSH    HL
                EX      DE,HL
                LD      E,(IX+$04)
                LD      D,(IX+$05)
                EXX
                LD      C,(IX+$0C)
                POP     HL
                RET                     ;To Draw Routine

ClipNew:        LD      A,C             ;BC=Height,Width
                LD      (SpriteWidth),A ;DE=Pointer to sprite
                EX      DE,HL
                LD      E,C
                LD      BC,$0100
                LD      A,(IX+$03)
                LD      (TempY),A
                OR      A
                JP      P,NoTopClipInt
                NEG
                DEC     A
                SRL     A
                SRL     A
                LD      D,A
                LD      A,(IX+$0C)
                SUB     D
                LD      (IX+$0C),A
                LD      D,0
                LD      A,(TempY)
                NEG
GetPosInSpr:    ADD     HL,DE
                ADD     HL,DE
                DEC     A
                JR      NZ,GetPosInSpr
                SET     3,C
                LD      (IX+$03),0
NoTopClipInt:   LD      A,(IX+$02)
                OR      A
                JP      P,NoLeftClipInt
                NEG
                DEC     A
                SRL     A
                SRL     A
                INC     A
                LD      E,A
                LD      D,0
                ADD     HL,DE
                INC     E
                LD      B,E
                LD      (IX+$02),0
                SET     2,C
                JP      NoRightInt
NoLeftClipInt:  AND     $FC
                LD      E,A
                LD      A,(SpriteWidth)
                ADD     A,A
                ADD     A,A
                ADD     A,E
                SUB     ScreenWidth
                JR      C,NoRightInt
                JR      Z,NoRightInt
                DEC     A
                SRL     A
                SRL     A
                INC     A
                INC     A
                LD      B,A
                SET     2,C
NoRightInt:     LD      (IX+$0D),B
                LD      (IX+$08),L
                LD      (IX+$09),H
                PUSH    HL
                LD      A,(SpriteWidth)
                SUB     B
                INC     A
                ADD     A,A
                ADD     A,A
                LD      B,A
                LD      A,(TempY)
                AND     $03
                OR      B
                LD      H,0
                LD      L,A
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                LD      A,L
                OR      C
                LD      L,A
                LD      BC,ClipTable
                ADD     HL,BC
                LD      C,(HL)
                INC     HL
                LD      B,(HL)
                INC     HL
                POP     DE              ;Pointer to sprite
                PUSH    BC
                LD      C,(HL)
                INC     HL
                LD      B,(HL)
                LD      (IX+$0A),C
                LD      (IX+$0B),B
                EXX
                LD      C,(IX+$02)
                LD      A,(IX+$03)
                SLA     C
                ADD     A,$10
                ADD     A,A
                LD      B,A
                mConvert(C,B)
                LD      (IX+$06),L
                LD      (IX+$07),H
                PUSH    HL
                EX      DE,HL
                LD      E,(IX+$04)
                LD      D,(IX+$05)
                EXX
                LD      C,(IX+$0C)
                LD      B,(IX+$0D)
                POP     HL
                RET             ;To Draw Routine

SpriteWidth:    DEFB    $00

CheckClip:      LD      A,(IX+$03)
                OR      A
                SCF
                RET     M
                LD      A,(IX+$02)
                OR      A
                SCF
                RET     M
                AND     $FC
                ADD     A,C
                ADD     A,C
                ADD     A,C
                ADD     A,C
                CP      ScreenWidth
                CCF
                RET     NZ
                OR      A
                RET

EraseOld:       RES     1,(HL)
                LD      (Stack),SP
                LD      DE,$0006
                ADD     HL,DE
                LD      SP,HL
                POP     HL
                POP     DE
                POP     AF
                POP     BC
                LD      SP,(Stack)
                PUSH    AF
                RET             ;To erase routine

Stack:          DEFW    $0000
HighLow:        DEFW    $0000
TempY:          DEFB    $00
IntFlag:        DEFB    $00

IntRt:          DI
                mPushAll()
                LD      HL,Cells
                LD      B,NoCells
DoLoop:         BIT     2,(HL)
                JP      Z,CheckNextCell
                PUSH    BC
                LD      (HighLow),HL
                RES     2,(HL)
                BIT     1,(HL)
                CALL    NZ,EraseOld
                LD      HL,(HighLow)
                BIT     0,(HL)
                CALL    NZ,DrawNew
                LD      HL,(HighLow)
                POP     BC
CheckNextCell:  LD      DE,CellSize
                ADD     HL,DE
                DJNZ    DoLoop
                CALL    UpDate
                CALL    DoTime
                mPopAll()
                EI
                RET

Zzzzzz          EQU     $

