; SMB - the ugly indentation is my fault, sorry.
;
; The original wasn't indented, then I started indenting to my format, decided that was too
; intrusive a change and left it as this bloody awful half-way mess...
;

mDrawLine       macro(Size)
                  loop Size-1
                    LD  A,(DE)
                    OR  (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  OR    (HL)
                  LD    (HL),A
                  INC   DE
                  loop Size-1
                    DEC L
                    lend
                  INC   H
                  loop Size-1
                    LD  A,(DE)
                    OR  (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  OR    (HL)
                  LD    (HL),A
                  INC   DE
                  loop Size-1
                    DEC L
                    lend
                  mend

mEraseLine      macro(Size)
                  loop Size-1
                    LD  A,(DE)
                    CPL
                    AND (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  CPL
                  AND   (HL)
                  LD    (HL),A
                  INC   DE
                  loop Size-1
                    DEC L
                    lend
                  INC   H
                  loop Size-1
                    LD  A,(DE)
                    CPL
                    AND (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  CPL
                  AND   (HL)
                  LD    (HL),A
                  INC   DE
                  loop Size-1
                    DEC L
                    lend
                  mend

mDrawAttr       MACRO(Size)
                  EXX
                  loop Size-1
                    LD  A,(HL)
                    AND E
                    OR  D
                    LD  (HL),A
                    INC L
                    lend
                  LD    A,(HL)
                  AND   E
                  OR    D
                  LD    (HL),A
                  loop Size-1
                    DEC L
                    lend
                  LD    BC,$0020
                  ADD   HL,BC
                  EXX
                  mend

mClipLine       MACRO(Size)
                  loop Size-1
                    LD  A,(DE)
                    OR  (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  OR    (HL)
                  LD    (HL),A
                  loop Size-1
                    DEC L
                    lend
                  LD    A,E
                  ADD   A,B
                  LD    E,A
                  LD    A,D
                  ADC   A,0
                  LD    D,A
                  INC   H
                  loop Size-1
                    LD  A,(DE)
                    OR  (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  OR    (HL)
                  LD    (HL),A
                  loop Size-1
                    DEC L
                    lend
                  LD    A,E
                  ADD   A,B
                  LD    E,A
                  LD    A,D
                  ADC   A,0
                  LD    D,A
                  mend

mClearLine      macro(Size)
                  loop Size-1
                    LD  A,(DE)
                    CPL
                    AND (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  CPL
                  AND   (HL)
                  LD    (HL),A
                  loop Size-1
                    DEC L
                    lend
                  LD    A,E
                  ADD   A,B
                  LD    E,A
                  LD    A,D
                  ADC   A,0
                  LD    D,A
                  INC   H
                  loop Size-1
                    LD  A,(DE)
                    CPL
                    AND (HL)
                    LD  (HL),A
                    INC L
                    INC DE
                    lend
                  LD    A,(DE)
                  CPL
                  AND   (HL)
                  LD    (HL),A
                  loop Size-1
                    DEC L
                    lend
                  LD    A,E
                  ADD   A,B
                  LD    E,A
                  LD    A,D
                  ADC   A,0
                  LD    D,A
                  mend

mConvert        macro(Across,Down)
                  LD    A,Across
                  RRA
                  RRA                             ;HL=DFile
                  RRA                             ;DE=AFile
                  AND   $1F
                  LD    L,A
                  LD    A,Down
                  RLCA
                  RLCA
                  LD    H,A
                  AND   $E0
                  OR    L
                  LD    L,A
                  LD    E,A
                  LD    A,H
                  AND   $03
                  LD    H,A
                  RLA
                  RLA
                  RLA
                  LD    D,A
                  LD    A,Down
                  AND   $07
                  OR    D
                  LD    D,A
                  LD    BC,Attributes
                  ADD   HL,BC
                  EX    DE,HL
                  LD    BC,DisplayFile
                  ADD   HL,BC
                  mend

mPushAll        macro()
                  PUSH  AF,BC,DE,HL
                  EX    AF,AF'
                  EXX
                  PUSH  AF,BC,DE,HL,IX,IY
                  mend

mPopAll         macro()
                  POP   IY,IX,HL,DE,BC,AF
                  EX    AF,AF'
                  EXX
                  POP   HL,DE,BC,AF
                  mend

mClearScreen    MACRO(Colour)
                  LD    HL,$4000
                  LD    DE,$4001
                  LD    BC,$1800
                  LD    (HL),$00
                  LDIR
                  LD    (HL),Colour*8
                  LD    BC,$02FF
                  LDIR
                  LD    A,Colour
                  OUT   ($FE),A
                  mend

mSprite         macro(SprNum,PosX,PosY,ANDAtt,ORAtt)
                  DI
                  PUSH  HL
                  INC   HL
                  LD    (HL),SprNum
                  INC   HL
                  LD    (HL),PosX
                  INC   HL
                  LD    (HL),PosY
                  INC   HL
                  LD    (HL),ANDAtt
                  INC   HL
                  LD    (HL),ORAtt
                  POP   HL
                  LD    A,(HL)
                  OR    $05
                  LD    (HL),A
                  EI
                  mend

