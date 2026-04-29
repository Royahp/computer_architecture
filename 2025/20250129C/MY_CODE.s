 
A          RN  0
AT		   RN  1
I		   RN  2
J		   RN  3
TMP_A	   RN  4
K		   RN  5
TMP_B	   RN  6
RES		   RN  7
INDEX	   RN  8
SEVEN	   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
transposition  PROC
	           EXPORT transposition
			   PUSH{R4-R8,R10-R11,LR}
			   
			   ;LDR RES,=0
		   
		       LDR I,=0
			   LDR J,=7
			   LDR SEVEN,=7
			   LDR INDEX,=0
			  
FOR_A		   LDRB TMP_A,[A,I]
			   
			   
			   
			   LSR TMP_B,TMP_A,J
			   AND TMP_B,#1
			   SUB K,SEVEN,I
			   LSL TMP_B,TMP_B,K
			   ORR RES,TMP_B
			   ADD I,#1
			   CMP I,#8
			   BLT FOR_A
			   STRB RES,[AT,INDEX]
			   
			   ADD INDEX,#1
			   MOV RES,#0
			   MOV I,#0
			   SUB J,#1
			   CMP J,#8
			   BLT FOR_A
			   
			   
			   
			   
		   
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