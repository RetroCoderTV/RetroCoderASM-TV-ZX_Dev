L0010:       equ  0010h
L0097:       equ  0097h
L0C0A:       equ  0C0Ah
L0D6E:       equ  0D6Eh
L0DAF:       equ  0DAFh
L0ECD:       equ  0ECDh
L15EF:       equ  15EFh
L16B0:       equ  16B0h
L1A1B:       equ  1A1Bh
L1B8A:       equ  1B8Ah
L229B:       equ  229Bh
L5C0B:       equ  5C0Bh
L5C16:       equ  5C16h
L5C3A:       equ  5C3Ah
L5C45:       equ  5C45h
L991F:       equ  991Fh
LBD51:       equ  BD51h
LBD52:       equ  BD52h
LBD54:       equ  BD54h
LBD55:       equ  BD55h
LBD56:       equ  BD56h
LBD57:       equ  BD57h
LBD58:       equ  BD58h
LBD59:       equ  BD59h
LBD5A:       equ  BD5Ah
LBD5B:       equ  BD5Bh
LBD5C:       equ  BD5Ch
LBD5D:       equ  BD5Dh
LBD5E:       equ  BD5Eh
LBD5F:       equ  BD5Fh
LBE01:       equ  BE01h
LBE07:       equ  BE07h
LBE0D:       equ  BE0Dh
LBE12:       equ  BE12h
LBE18:       equ  BE18h
LBE1E:       equ  BE1Eh
LE367:       equ  E367h
LE368:       equ  E368h
LE36B:       equ  E36Bh
LE450:       equ  E450h
LE464:       equ  E464h
LE49F:       equ  E49Fh
LE4AC:       equ  E4ACh
LE4B8:       equ  E4B8h
LE4C4:       equ  E4C4h
LE4D0:       equ  E4D0h
LE4DC:       equ  E4DCh
LE4F7:       equ  E4F7h
LE770:       equ  E770h
LE7FD:       equ  E7FDh
LE823:       equ  E823h


             org 1300h


1300 L1300:
1300 CD 8A 1B     CALL L1B8A  
1303 76           HALT        
1304 FD CB 01 AE  RES  5,(IY+1) 
1308 FD CB 30 4E  BIT  1,(IY+48) 
130C C4 CD 0E     CALL NZ,L0ECD 
130F 3A 3A 5C     LD   A,(L5C3A) 
1312 3C           INC  A      
1313 F5           PUSH AF     
1314 21 00 00     LD   HL,0000h 
1317 FD 74 37     LD   (IY+55),H 
131A FD 74 26     LD   (IY+38),H 
131D 22 0B 5C     LD   (L5C0B),HL 
1320 21 01 00     LD   HL,0001h 
1323 22 16 5C     LD   (L5C16),HL 
1326 CD B0 16     CALL L16B0  
1329 FD CB 37 AE  RES  5,(IY+55) 
132D CD 6E 0D     CALL L0D6E  
1330 FD CB 02 EE  SET  5,(IY+2) 
1334 F1           POP  AF     
1335 47           LD   B,A    
1336 FE 0A        CP   0Ah    
1338 38 02        JR   C,L133C 
133A C6 07        ADD  A,07h  
133C L133C:
133C CD EF 15     CALL L15EF  
133F 3E 20        LD   A,20h  
1341 D7           RST  10h    
1342 78           LD   A,B    
1343 11 91 13     LD   DE,1391h 
1346 CD 0A 0C     CALL L0C0A  
1349 AF           XOR  A      
134A 11 36 15     LD   DE,1536h 
134D CD 0A 0C     CALL L0C0A  
1350 ED 4B 45 5C  LD   BC,(L5C45) 
1354 CD 1B 1A     CALL L1A1B  
1357 3E 3A        LD   A,3Ah  
1359 D7           RST  10h    
135A FD 4E 0D     LD   C,(IY+13) 
135D 06 00        LD   B,00h  
135F CD 1B 1A     CALL L1A1B  
1362 CD 97 00     CALL L0097  


             org 9800h


9800 L9800:
9800 CD AF 0D     CALL L0DAF  
9803 3E 01        LD   A,01h  
9805 CD 9B 22     CALL L229B  
9808 CD FD E7     CALL LE7FD  
980B C3 23 E8     JP   LE823  


980E CD           defb CDh    
980F AF           defb AFh    
9810 0D           defb 0Dh    
9811 3E           defb 3Eh    
9812 01           defb 01h    
9813 32           defb 32h    


             org BD67h


BD67 LBD67:
BD67 C4 2A BE     CALL NZ,LBE2A 
BD6A 3A 52 BD     LD   A,(LBD52) 
BD6D FE 01        CP   01h    
BD6F CC 07 BE     CALL Z,LBE07 
BD72 C4 0D BE     CALL NZ,LBE0D 
BD75 3A 59 BD     LD   A,(LBD59) 
BD78 FE 01        CP   01h    
BD7A CC 3B BE     CALL Z,LBE3B 
BD7D C4 41 BE     CALL NZ,LBE41 
BD80 3A 5D BD     LD   A,(LBD5D) 
BD83 FE 01        CP   01h    
BD85 CC 58 BE     CALL Z,LBE58 
BD88 C4 5E BE     CALL NZ,LBE5E 
BD8B AF           XOR  A      
BD8C 32 51 BD     LD   (LBD51),A 
BD8F 32 52 BD     LD   (LBD52),A 
BD92 32 54 BD     LD   (LBD54),A 
BD95 32 55 BD     LD   (LBD55),A 
BD98 32 56 BD     LD   (LBD56),A 
BD9B 32 58 BD     LD   (LBD58),A 
BD9E 32 59 BD     LD   (LBD59),A 
BDA1 32 5B BD     LD   (LBD5B),A 
BDA4 32 5C BD     LD   (LBD5C),A 
BDA7 32 5D BD     LD   (LBD5D),A 
BDAA 01 FE FD     LD   BC,FDFEh 
BDAD ED 78        IN   A,(C)  
BDAF 1F           RRA         
BDB0 F5           PUSH AF     
BDB1 D4 01 BE     CALL NC,LBE01 
BDB4 F1           POP  AF     
BDB5 1F           RRA         
BDB6 F5           PUSH AF     
BDB7 D4 12 BE     CALL NC,LBE12 
BDBA F1           POP  AF     
BDBB 1F           RRA         
BDBC F5           PUSH AF     
BDBD D4 18 BE     CALL NC,LBE18 
BDC0 F1           POP  AF     
BDC1 1F           RRA         
BDC2 F5           PUSH AF     
BDC3 D4 1E BE     CALL NC,LBE1E 
BDC6 F1           POP  AF     
BDC7 01 FE FB     LD   BC,FBFEh 
BDCA ED 00        INVALID INSTRUCTION	; mostly equivalent to NOP. 


             org BE2Ah


BE2A LBE2A:
BE2A AF           XOR  A      
BE2B 32 57 BD     LD   (LBD57),A 
BE2E C9           RET         


BE2F 3E           defb 3Eh    
BE30 01           defb 01h    
BE31 32           defb 32h    
BE32 58           defb 58h    
BE33 BD           defb BDh    
BE34 C9           defb C9h    
BE35 3E           defb 3Eh    
BE36 01           defb 01h    
BE37 32           defb 32h    
BE38 59           defb 59h    
BE39 BD           defb BDh    
BE3A C9           defb C9h    


BE3B LBE3B:
BE3B 3E 01        LD   A,01h  
BE3D 32 5A BD     LD   (LBD5A),A 
BE40 C9           RET         


BE41 LBE41:
BE41 AF           XOR  A      
BE42 32 5A BD     LD   (LBD5A),A 
BE45 C9           RET         


BE46 3E           defb 3Eh    
BE47 01           defb 01h    
BE48 32           defb 32h    
BE49 5B           defb 5Bh    
BE4A BD           defb BDh    
BE4B C9           defb C9h    
BE4C 3E           defb 3Eh    
BE4D 01           defb 01h    
BE4E 32           defb 32h    
BE4F 5C           defb 5Ch    
BE50 BD           defb BDh    
BE51 C9           defb C9h    
BE52 3E           defb 3Eh    
BE53 01           defb 01h    
BE54 32           defb 32h    
BE55 5D           defb 5Dh    
BE56 BD           defb BDh    
BE57 C9           defb C9h    


BE58 LBE58:
BE58 3E 01        LD   A,01h  
BE5A 32 5E BD     LD   (LBD5E),A 
BE5D C9           RET         


BE5E LBE5E:
BE5E AF           XOR  A      
BE5F 32 5E BD     LD   (LBD5E),A 
BE62 C9           RET         


BE63 11           defb 11h    
BE64 15           defb 15h    
BE65 00           defb 00h    
BE66 21           defb 21h    
BE67 FF           defb FFh    
BE68 03           defb 03h    
BE69 CD           defb CDh    
BE6A B5           defb B5h    
BE6B 03           defb 03h    
BE6C C9           defb C9h    
BE6D 21           defb 21h    
BE6E F1           defb F1h    
BE6F 01           defb 01h    
BE70 11           defb 11h    
BE71 D0           defb D0h    
BE72 00           defb 00h    
BE73 CD           defb CDh    
BE74 B5           defb B5h    
BE75 03           defb 03h    
BE76 C9           defb C9h    
BE77 21           defb 21h    
BE78 6E           defb 6Eh    
BE79 00           defb 00h    
BE7A 11           defb 11h    
BE7B C4           defb C4h    
BE7C 03           defb 03h    
BE7D CD           defb CDh    
BE7E B5           defb B5h    
BE7F 03           defb 03h    
BE80 C9           defb C9h    
BE81 21           defb 21h    
BE82 7B           defb 7Bh    
BE83 00           defb 00h    
BE84 11           defb 11h    
BE85 58           defb 58h    
BE86 03           defb 03h    
BE87 CD           defb CDh    
BE88 B5           defb B5h    
BE89 03           defb 03h    
BE8A C9           defb C9h    
BE8B 21           defb 21h    
BE8C 00           defb 00h    
BE8D 00           defb 00h    


             org E3E5h


E3E5 LE3E5:
E3E5 CD 5F BD     CALL LBD5F  
E3E8 3A 6B E3     LD   A,(LE36B) 
E3EB FE 00        CP   00h    
E3ED F5           PUSH AF     
E3EE CC 64 E4     CALL Z,LE464 
E3F1 F1           POP  AF     
E3F2 C8           RET  Z      
E3F3 3A 67 E3     LD   A,(LE367) 
E3F6 FE 01        CP   01h    
E3F8 CC 3F E4     CALL Z,LE43F 
E3FB CD 70 E7     CALL LE770  
E3FE CD 1F 99     CALL L991F  
E401 FE 21        CP   21h    
E403 DC 9F E4     CALL C,LE49F 
E406 3A 59 BD     LD   A,(LBD59) 
E409 FE 01        CP   01h    
E40B CC AC E4     CALL Z,LE4AC 
E40E 3A 52 BD     LD   A,(LBD52) 
E411 FE 01        CP   01h    
E413 CC B8 E4     CALL Z,LE4B8 
E416 3A 5B BD     LD   A,(LBD5B) 
E419 FE 01        CP   01h    
E41B CC C4 E4     CALL Z,LE4C4 
E41E 3A 5C BD     LD   A,(LBD5C) 
E421 FE 01        CP   01h    
E423 CC D0 E4     CALL Z,LE4D0 
E426 3A 5D BD     LD   A,(LBD5D) 
E429 FE 01        CP   01h    
E42B CC DC E4     CALL Z,LE4DC 
E42E 3A 56 BD     LD   A,(LBD56) 
E431 FE 01        CP   01h    
E433 CC F7 E4     CALL Z,LE4F7 
E436 3A 54 BD     LD   A,(LBD54) 
E439 FE 01        CP   01h    
E43B CC 50 E4     CALL Z,LE450 
E43E C9           RET         


E43F LE43F:
E43F 2A 68 E3     LD   HL,(LE368) 
E442 23           INC  HL     
E443 22 68 E3     LD   (LE368),HL 
E446 7C           LD   A,H    
E447 FE 01        CP   01h    