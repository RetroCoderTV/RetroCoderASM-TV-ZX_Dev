L0010:       equ  0010h
L0097:       equ  0097h
L0C0A:       equ  0C0Ah
L0D6E:       equ  0D6Eh
L0ECD:       equ  0ECDh
L15EF:       equ  15EFh
L16B0:       equ  16B0h
L1A1B:       equ  1A1Bh
L1B8A:       equ  1B8Ah
L5C0B:       equ  5C0Bh
L5C16:       equ  5C16h
L5C3A:       equ  5C3Ah
L5C45:       equ  5C45h


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