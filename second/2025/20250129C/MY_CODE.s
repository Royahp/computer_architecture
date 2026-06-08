 
A          RN  0
AT		   RN  1
I		   RN  2
J		   RN  3
TMP		   RN  4
RES		   RN  5
K		   RN  6
T		   RN  7
X		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
transposition  PROC
	           EXPORT transposition
			   PUSH{R4-R8,R10-R11,LR}
		   
		       LDR RES,=0
		       LDR I,=0
			   LDR J,=7
			   LDR T,=0
			   LDR X,=7
			   
FOR			   LDRB TMP,[A,I]
			   SUB K,X,I
			   LSR TMP,J
			   AND TMP,#1
			   LSL TMP,K
			   ORR RES,TMP
			   ADD I,#1
			   CMP I,#8
			   BLT FOR
			   
			   STRB RES,[AT,T]
			   LDR RES,=0
		       LDR I,=0
			   ADD T,#1
			   SUB J,#1
			   
			   CMP J,#0
			   BGE FOR 
		   
		   
		   
		   
		   
		   
		   
		   ;MOV R0,RESULT
		   
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