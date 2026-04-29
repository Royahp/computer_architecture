 
A          RN  0
BB		   RN  1
C		   RN  2
I		   RN  3
J		   RN  4
TMP_A	   RN  5
TMP_B	   RN  6
TMP		   RN  7
K		   RN  8
RES        RN  9
B_RES	   RN  10
INDEX	   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
bitMatrixMultiplication        PROC
	                           EXPORT bitMatrixMultiplication 
			                   PUSH{R4-R9,R10-R11,LR}
		                       LDR I,=0
							   LDR J,=0
							   LDR K,=7
							   LDR B_RES,=0
							   
FOR_A						   LDRB TMP_A,[A,I]
							   
		   
FOR_B		                   LDRB TMP_B,[BB,J]
                                
							   LSR TMP,TMP_B,K
							   AND TMP,#1
							   SUB INDEX,K,J
							   LSL TMP,TMP,INDEX
							   ORR B_RES,TMP
							   ADD J,#1
							   CMP J,#8
							   BLT FOR_B
							   
							   AND B_RES,TMP_A,B_RES
							   AND J,B_RES,#1 ;0
							   MOV TMP,#0
							   MOV INDEX,#1
							   
FOR_C						   
							   LSR TMP_B,B_RES,INDEX
							   AND TMP,TMP_B,#1
							   EOR J,TMP,J
							   ADD INDEX,#1
							   CMP INDEX,#8
							   BLT FOR_C
							   
							   LSL J,J,K
							   ORR RES,J,RES
							   
							   
							   
							   
NEXT	                       ADD I,#1
							   SUB K,#1
							   MOV J,#0
							   CMP I,#8
							   BLT FOR_A
							   
							   
							   
							   
							   
		   
		   
		   
		   
		   
;		   MOV R0,RESULT
		   
		     POP{R4-R9,R10-R11,PC}
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