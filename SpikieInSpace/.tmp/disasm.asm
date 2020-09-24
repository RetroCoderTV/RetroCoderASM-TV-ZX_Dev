L0008:       equ  0008h
L00DA:       equ  00DAh
L0164:       equ  0164h
L0DAF:       equ  0DAFh
L0EDF:       equ  0EDFh
L1F54:       equ  1F54h
L229B:       equ  229Bh
L4753:       equ  4753h
L488A:       equ  488Ah
L4896:       equ  4896h
L4942:       equ  4942h
L498A:       equ  498Ah
L4996:       equ  4996h
L4A8A:       equ  4A8Ah
L4E41:       equ  4E41h
L4F46:       equ  4F46h
L4F4D:       equ  4F4Dh
L5153:       equ  5153h
L5453:       equ  5453h
L8A8C:       equ  8A8Ch
L8A9C:       equ  8A9Ch
L8AA8:       equ  8AA8h
L8AB8:       equ  8AB8h
LBD3C:       equ  BD3Ch
LE6E9:       equ  E6E9h
LE70F:       equ  E70Fh


             org 00DFh


00DF L00DF:
00DF D4 53 51     CALL NC,L5153 
00E2 D2 53 47     JP   NC,L4753 
00E5 CE 41        ADC  A,41h  
00E7 42           LD   B,D    
00E8 D3 50        OUT  (0050h),A 
00EA 45           LD   B,L    
00EB 45           LD   B,L    
00EC CB 49        BIT  1,C    
00EE CE 55        ADC  A,55h  
00F0 53           LD   D,E    
00F1 D2 53 54     JP   NC,L5453 
00F4 52           LD   D,D    
00F5 A4           AND  H      
00F6 43           LD   B,E    
00F7 48           LD   C,B    
00F8 52           LD   D,D    
00F9 A4           AND  H      
00FA 4E           LD   C,(HL) 
00FB 4F           LD   C,A    
00FC D4 42 49     CALL NC,L4942 
00FF CE 4F        ADC  A,4Fh  
0101 D2 41 4E     JP   NC,L4E41 
0104 C4 3C BD     CALL NZ,LBD3C 
0107 3E BD        LD   A,BDh  
0109 3C           INC  A      
010A BE           CP   (HL)   
010B 4C           LD   C,H    
010C 49           LD   C,C    
010D 4E           LD   C,(HL) 
010E C5           PUSH BC     
010F 54           LD   D,H    
0110 48           LD   C,B    
0111 45           LD   B,L    
0112 CE 54        ADC  A,54h  
0114 CF 53        RST  08h,53h 
0116 54           LD   D,H    
0117 45           LD   B,L    
0118 D0           RET  NC     
0119 44           LD   B,H    
011A 45           LD   B,L    
011B 46           LD   B,(HL) 
011C 20 46        JR   NZ,L0164 
011E CE 43        ADC  A,43h  
0120 41           LD   B,C    
0121 D4 46 4F     CALL NC,L4F46 
0124 52           LD   D,D    
0125 4D           LD   C,L    
0126 41           LD   B,C    
0127 D4 4D 4F     CALL NC,L4F4D 
012A 56           LD   D,(HL) 
012B C5           PUSH BC     
012C 45           LD   B,L    
012D 52           LD   D,D    
012E 41           LD   B,C    
012F 53           LD   D,E    
0130 C5           PUSH BC     
0131 4F           LD   C,A    
0132 50           LD   D,B    
0133 45           LD   B,L    
0134 4E           LD   C,(HL) 
0135 20 A3        JR   NZ,L00DA 
0137 43           LD   B,E    
0138 4C           LD   C,H    
0139 4F           LD   C,A    
013A 53           LD   D,E    
013B 45           LD   B,L    
013C 20 A3        JR   NZ,L00DF+2 
013E 4D           LD   C,L    
013F 45           LD   B,L    
0140 52           LD   D,D    
0141 47           LD   B,A    
0142 C5           PUSH BC     


             org 0EFDh
0EFD L0EFD:
0EFD CD 54 1F     CALL L1F54  
0F00 38 0A        JR   C,L0F0C 
0F02 3E 04        LD   A,04h  
0F04 D3 FB        OUT  (00FBh),A 
0F06 FB           EI          
0F07 CD DF 0E     CALL L0EDF  
0F0A CF 0C        RST  08h,0Ch 
0F0C L0F0C:
0F0C DB FB        IN   A,(00FBh) 
0F0E 87           ADD  A,A    
0F0F F8           RET  M      
0F10 30 EB        JR   NC,L0EFD 
0F12 0E 20        LD   C,20h  
0F14 L0F14:
0F14 5E           LD   E,(HL) 
0F15 23           INC  HL     
0F16 06 08        LD   B,08h  
0F18 L0F18:
0F18 CB 12        RL   D      
0F1A CB 13        RL   E      
0F1C CB 1A        RR   D      
0F1E L0F1E:
0F1E DB FB        IN   A,(00FBh) 
0F20 1F           RRA         
0F21 30 FB        JR   NC,L0F1E 
0F23 7A           LD   A,D    
0F24 D3 FB        OUT  (00FBh),A 
0F26 10 F0        DJNZ L0F18  
0F28 0D           DEC  C      
0F29 20 E9        JR   NZ,L0F14 
0F2B C9           RET         


0F2C 2A           defb 2Ah    
0F2D 3D           defb 3Dh    
0F2E 5C           defb 5Ch    
0F2F E5           defb E5h    
0F30 21           defb 21h    
0F31 7F           defb 7Fh    
0F32 10           defb 10h    
0F33 E5           defb E5h    
0F34 ED           defb EDh    
0F35 73           defb 73h    
0F36 3D           defb 3Dh    
0F37 5C           defb 5Ch    
0F38 CD           defb CDh    
0F39 D4           defb D4h    
0F3A 15           defb 15h    
0F3B F5           defb F5h    
0F3C 16           defb 16h    
0F3D 00           defb 00h    
0F3E FD           defb FDh    
0F3F 5E           defb 5Eh    
0F40 FF           defb FFh    
0F41 21           defb 21h    
0F42 C8           defb C8h    
0F43 00           defb 00h    
0F44 CD           defb CDh    
0F45 B5           defb B5h    
0F46 03           defb 03h    
0F47 F1           defb F1h    
0F48 21           defb 21h    
0F49 38           defb 38h    
0F4A 0F           defb 0Fh    
0F4B E5           defb E5h    
0F4C FE           defb FEh    
0F4D 18           defb 18h    
0F4E 30           defb 30h    
0F4F 31           defb 31h    
0F50 FE           defb FEh    
0F51 07           defb 07h    
0F52 38           defb 38h    
0F53 2D           defb 2Dh    
0F54 FE           defb FEh    
0F55 10           defb 10h    
0F56 38           defb 38h    
0F57 3A           defb 3Ah    
0F58 01           defb 01h    
0F59 02           defb 02h    
0F5A 00           defb 00h    
0F5B 57           defb 57h    
0F5C FE           defb FEh    
0F5D 16           defb 16h    
0F5E 38           defb 38h    
0F5F 0C           defb 0Ch    
0F60 03           defb 03h    


             org 9800h


9800 L9800:
9800 CD AF 0D     CALL L0DAF  
9803 3E 01        LD   A,01h  
9805 CD 9B 22     CALL L229B  
9808 CD E9 E6     CALL LE6E9  
980B C3 0F E7     JP   LE70F  


980E CD           defb CDh    
980F AF           defb AFh    
9810 0D           defb 0Dh    
9811 3E           defb 3Eh    
9812 01           defb 01h    
9813 CD           defb CDh    


             org AC61h


AC61 LAC61:
AC61 DD E1        POP  IX     
AC63 FD E1        POP  IY     
AC65 31 8C 48     LD   SP,L488A+2 
AC68 FD E5        PUSH IY     
AC6A DD E5        PUSH IX     
AC6C E5           PUSH HL     
AC6D D5           PUSH DE     
AC6E C5           PUSH BC     
AC6F F5           PUSH AF     
AC70 31 8E 8A     LD   SP,L8A8C+2 
AC73 F1           POP  AF     
AC74 C1           POP  BC     
AC75 D1           POP  DE     
AC76 E1           POP  HL     
AC77 DD E1        POP  IX     
AC79 FD E1        POP  IY     
AC7B 31 98 48     LD   SP,L4896+2 
AC7E FD E5        PUSH IY     
AC80 DD E5        PUSH IX     
AC82 E5           PUSH HL     
AC83 D5           PUSH DE     
AC84 C5           PUSH BC     
AC85 F5           PUSH AF     
AC86 31 9E 8A     LD   SP,L8A9C+2 
AC89 F1           POP  AF     
AC8A C1           POP  BC     
AC8B D1           POP  DE     
AC8C E1           POP  HL     
AC8D DD E1        POP  IX     
AC8F FD E1        POP  IY     
AC91 31 8C 49     LD   SP,L498A+2 
AC94 FD E5        PUSH IY     
AC96 DD E5        PUSH IX     
AC98 E5           PUSH HL     
AC99 D5           PUSH DE     
AC9A C5           PUSH BC     
AC9B F5           PUSH AF     
AC9C 31 AA 8A     LD   SP,L8AA8+2 
AC9F F1           POP  AF     
ACA0 C1           POP  BC     
ACA1 D1           POP  DE     
ACA2 E1           POP  HL     
ACA3 DD E1        POP  IX     
ACA5 FD E1        POP  IY     
ACA7 31 98 49     LD   SP,L4996+2 
ACAA FD E5        PUSH IY     
ACAC DD E5        PUSH IX     
ACAE E5           PUSH HL     
ACAF D5           PUSH DE     
ACB0 C5           PUSH BC     
ACB1 F5           PUSH AF     
ACB2 31 BA 8A     LD   SP,L8AB8+2 
ACB5 F1           POP  AF     
ACB6 C1           POP  BC     
ACB7 D1           POP  DE     
ACB8 E1           POP  HL     
ACB9 DD E1        POP  IX     
ACBB FD E1        POP  IY     
ACBD 31 8C 4A     LD   SP,L4A8A+2 
ACC0 FD E5        PUSH IY     
ACC2 DD E5        PUSH IX     
ACC4 E5           PUSH HL     