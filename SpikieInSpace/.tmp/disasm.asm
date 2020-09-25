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
LE79D:       equ  E79Dh
LE7C3:       equ  E7C3h


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
9808 CD 9D E7     CALL LE79D  
980B C3 C3 E7     JP   LE7C3  


980E CD           defb CDh    
980F AF           defb AFh    
9810 0D           defb 0Dh    
9811 3E           defb 3Eh    
9812 01           defb 01h    
9813 32           defb 32h    


             org 9C30h


9C30 L9C30:
9C30 CD 34 9C     CALL L9C34  
9C33 C9           RET         


9C34 L9C34:
9C34 11 01 80     LD   DE,8001h 
9C37 01 00 15     LD   BC,1500h 
9C3A 36 00        LD   (HL),00h 
9C3C ED B0        LDIR        
9C3E C9           RET         


9C3F F3           defb F3h    
9C40 FD           defb FDh    
9C41 E5           defb E5h    
9C42 DD           defb DDh    
9C43 E5           defb E5h    
9C44 E5           defb E5h    
9C45 D5           defb D5h    
9C46 C5           defb C5h    
9C47 F5           defb F5h    
9C48 ED           defb EDh    
9C49 73           defb 73h    
9C4A 2B           defb 2Bh    
9C4B 9C           defb 9Ch    
9C4C 31           defb 31h    
9C4D 02           defb 02h    
9C4E 80           defb 80h    
9C4F F1           defb F1h    
9C50 C1           defb C1h    
9C51 D1           defb D1h    
9C52 E1           defb E1h    
9C53 DD           defb DDh    
9C54 E1           defb E1h    
9C55 FD           defb FDh    
9C56 E1           defb E1h    
9C57 31           defb 31h    
9C58 0C           defb 0Ch    
9C59 40           defb 40h    
9C5A FD           defb FDh    
9C5B E5           defb E5h    
9C5C DD           defb DDh    
9C5D E5           defb E5h    
9C5E E5           defb E5h    
9C5F D5           defb D5h    
9C60 C5           defb C5h    
9C61 F5           defb F5h    
9C62 31           defb 31h    
9C63 0E           defb 0Eh    
9C64 80           defb 80h    
9C65 F1           defb F1h    
9C66 C1           defb C1h    
9C67 D1           defb D1h    
9C68 E1           defb E1h    
9C69 DD           defb DDh    
9C6A E1           defb E1h    
9C6B FD           defb FDh    
9C6C E1           defb E1h    
9C6D 31           defb 31h    
9C6E 18           defb 18h    
9C6F 40           defb 40h    
9C70 FD           defb FDh    
9C71 E5           defb E5h    
9C72 DD           defb DDh    
9C73 E5           defb E5h    
9C74 E5           defb E5h    
9C75 D5           defb D5h    
9C76 C5           defb C5h    
9C77 F5           defb F5h    
9C78 31           defb 31h    
9C79 1E           defb 1Eh    
9C7A 80           defb 80h    
9C7B F1           defb F1h    
9C7C C1           defb C1h    
9C7D D1           defb D1h    
9C7E E1           defb E1h    
9C7F DD           defb DDh    
9C80 E1           defb E1h    
9C81 FD           defb FDh    
9C82 E1           defb E1h    
9C83 31           defb 31h    
9C84 0C           defb 0Ch    
9C85 41           defb 41h    
9C86 FD           defb FDh    
9C87 E5           defb E5h    
9C88 DD           defb DDh    
9C89 E5           defb E5h    
9C8A E5           defb E5h    
9C8B D5           defb D5h    
9C8C C5           defb C5h    
9C8D F5           defb F5h    
9C8E 31           defb 31h    
9C8F 2A           defb 2Ah    
9C90 80           defb 80h    
9C91 F1           defb F1h    
9C92 C1           defb C1h    
9C93 D1           defb D1h    
9C94 E1           defb E1h    
9C95 DD           defb DDh    
9C96 E1           defb E1h    
9C97 FD           defb FDh    
9C98 E1           defb E1h    
9C99 31           defb 31h    
9C9A 18           defb 18h    
9C9B 41           defb 41h    
9C9C FD           defb FDh    
9C9D E5           defb E5h    
9C9E DD           defb DDh    
9C9F E5           defb E5h    