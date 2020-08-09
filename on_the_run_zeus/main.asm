/*

On The Run by Graham Stafford, sources converted to assemble correctly using Zeus.
These sources generate exactly the same bytes as the original release version.

SMB denotes places where I (Simon Brattel) have altered things from Graham Stafford's original sources.
All edits mentioning Zeus are also changes, the original sources assembled using M80 on CP/M

In the original sources Graham made extensive use of leading-zero numbers to denote hexadecimal, I've taken the
liberty of changing these to use a '$' prefix for compatibility with older versions of Zeus.

Aside from that the only significant changes to the original feel of the sources are that I've changed most of the
graphic definitions to use Zeus's DG pseudo-op rather than just being hexadecimal define-bytes. This is something I
feel Graham would have happily used had the opportunity existed back then, and it does allow easier changes if anyone
is interested...

You will probably want to change where it stores the szx file on disk, this is defined near the start.
*/

; SMB: Turn Zeus's flow warnings off globally. Otherwise the Print calls cause Zeus to grumble...
zoWarnFlow      = 0     ; We don't want to bother with flow warnings

; Generate an szx file so we can play it directly - change the path here to suit your environment

                zeusemulate "48K"       ; Tell Zeus we're emulating a 48K Spectrum

                output_szx "otr.szx",$0000,FrontBegin
//                output_bin "otr2.bin",$0000,$10000

                include "macros.asm"
                include "charset.asm"
                include "sceneset.asm"
                include "frontend.asm"
                include "ontherun.asm"
                include "colladd.asm"
                include "object.asm"
                include "sprites.asm"
                include "interrupt.asm"
                include "cells.asm"
                include "mazes.asm"
                include "sprset.asm"

/*

SMB: The On The Run binary saved from an actual tape load also contains this code in memory, possibly part of the loader?

$E800           LD IX,$4000                     ; E800
                LD DE,$E000                     ; E804
                DI                              ; E807
                LD A,$08                        ; E808
                OUT ($FE),A                     ; E80A
                IN A,($FE)                      ; E80C
                LD C,$00                        ; E80E
$E810           CALL $E876                      ; E810
                JR NC $E810                     ; E813

                LD HL,$0415                     ; E815
$E818           DJNZ $E818                      ; E818

                DEC HL                          ; E81A
                LD A,H                          ; E81B
                OR L                            ; E81C
                JR NZ $E818                     ; E81D

                CALL $E872                      ; E81F
                JR NC $E800                     ; E822

$E824           LD B,$9C                        ; E824
                CALL $E872                      ; E826
                JR NC $E800                     ; E829

                LD A,$C6                        ; E82B
                CP B                            ; E82D
                JR NC $E810                     ; E82E

                INC H                           ; E830
                JR NZ $E824                     ; E831

$E833           LD B,$C9                        ; E833
                CALL $E876                      ; E835
                JR NC $E800                     ; E838

                LD A,B                          ; E83A
                CP $D4                          ; E83B
                JR NC $E833                     ; E83D

                CALL $E876                      ; E83F
                JR NC $E800                     ; E842

                LD H,$00                        ; E844
                LD B,$B0                        ; E846
                JR $E857                        ; E848

$E84A           LD A,E                          ; E84A
                AND $03                         ; E84B
                JR Z $E854                      ; E84D

                LD (IX),L                       ; E84F
                INC IX                          ; E852
$E854           DEC DE                          ; E854
                LD B,$B2                        ; E855
$E857           LD L,$01                        ; E857
$E859           CALL $E872                      ; E859
                JR NC $E800                     ; E85C

                LD A,$CB                        ; E85E
                CP B                            ; E860
                RL L                            ; E861
                LD B,$B0                        ; E863
                JP NC $E859                     ; E865

                LD A,H                          ; E868
                XOR L                           ; E869
                LD H,A                          ; E86A
                LD A,D                          ; E86B
                OR E                            ; E86C
                JR NZ $E84A                     ; E86D

                JP $7E00                        ; E86F

$E872           CALL $E876                      ; E872
                RET NC                          ; E875

$E876           LD A,$16                        ; E876
$E878           DEC A                           ; E878
                JR NZ $E878                     ; E879

                AND A                           ; E87B
$E87C           INC B                           ; E87C
                RET Z                           ; E87D

                LD A,$7F                        ; E87E
                IN A,($FE)                      ; E880
                RRA                             ; E882
                XOR C                           ; E883
                AND $20                         ; E884
                JR Z $E87C                      ; E886

                LD A,C                          ; E888
                XOR $F9                         ; E889
                LD C,A                          ; E88B
                AND $07                         ; E88C
                OR $08                          ; E88E
                OUT ($FE),A                     ; E890
                SCF                             ; E892
                RET                             ; E893
*/
