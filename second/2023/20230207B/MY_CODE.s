 
IN          RN  0
OUT		   RN  1
N		   RN  2
I		   RN  3
J		   RN  4
TMP		   RN  5
SWAP	   RN  6
TMP2	   RN  7
PLAT	   RN  8
;		   RN  10
;		   RN  11
;		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
copyData       PROC
	           EXPORT copyData
			   PUSH{R4-R8,R10-R11,LR}
			   LDR I,=0
			   LDR J,=0
			   
FOR			   LDRB TMP,[IN,I]
			   STRB TMP,[OUT,J]
			   ADD I,#1
			   ADD J,#1
			   CMP I,N
			   BLT FOR
		   
		   
		   
		   
		   
		   
		   
		   
		   
	;	   MOV R0,RESULT
		   
		     POP{R4-R8,R10-R11,PC}
			 ENDP
				 
		   AREA MYCODE2,CODE,READONLY
			   
bubbleSort     PROC
	           EXPORT bubbleSort
			   PUSH{R4-R8,R10-R11,LR}	
              LDR SWAP,=1
WHILE        CMP SWAP,#1
              BNE END_WHILE 
			  CMP N,#1
			  BLE END_WHILE
			  MOV SWAP,#0
			  LDR I,=1
			
			  
FOR2           CMP I,N
              BEQ END_FOR
			  SUB J,I,#1
			  LDRSB TMP,[OUT,J]
			  LDRSB TMP2,[OUT,I]
              CMP TMP,TMP2
			  BLE NEXT_N
			  MOV PLAT,TMP
			  MOV TMP,TMP2
			  MOV TMP2,PLAT
			  STRB TMP,[OUT,J]
			  STRB TMP2,[OUT,I]
			  MOV SWAP,#1
			  
			  

NEXT_N       
              ADD I,#1
              B FOR2

       
END_FOR		   MOV SWAP,#1
               LDR I,=1
               SUB N,#1
			   B WHILE
			   

END_WHILE



	         POP{R4-R8,R10-R11,PC}
			 ENDP
			 END 
				 
				 
;ADD  PNTR, SP, #32 ;stack pointer	
;STR  NUM, [PNTR]        ;  store digit IN STACK
;ADD  PNTR, PNTR, #4     ;  next slot
;LDR 	TMP,[PNTR] ;GET DIGIT FROM STACK
;LSL A,B,#1 A=2B
;CS,HS unsigned>=
;CC,LO unsigned<
;MI negative
;PL positive or 0
;VS overFlow VC no over
;HI unsigned>
;LS unsigned<=
;GE signed>=
;LE signed <=
;GT igned>
;LT signed <
;AL always
;MVN Rd, Rn ,ADDS RD,#1 ; MAKUS MIKONE YANI AGE Rn = 0000 1101 MISHE Rd = 1111 0010 
;X=UL  MVN U,U - MVN L,L -ADDS L,L,#1 -ADC U,U,#0 ;MAKUSE ADADE DO BAKHSI BA CARRY BIT
;{SUBS  TMP, E2, E1      ; TMP = E2 - E1  
;IT    MI               ; agar hasele tafrigh manfi bud,mosbatesh kone
;RSBMI TMP, TMP, #0   }  ; TMP = 0 - TMP  => abs
;BIC X, X,mask ;baraye 0 kardane bit morede nazar masalan mask=0101 bashe bit0 va bit2 ra tuye x sefr mikone

;lowercase letter 97-122
;upper 65-90