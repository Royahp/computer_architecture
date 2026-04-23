 
A          RN  0
BB		   RN  1
C		   RN  2
I		   RN  3
J		   RN  4
TMP		   RN  5
BIT		   RN  6
BIT2	   RN  7
;TMP2	   RN  8
C_BIT      RN  9
K		   RN  10
RESULT	   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
bitwiseAffineTransformation        PROC
								   EXPORT bitwiseAffineTransformation
								   PUSH{R4-R9,R10-R11,LR}
							       LDR I,=0
								   LDR K,=7
								   LDR RESULT,=0
								   
FOR								   LDRB TMP,[A,I]
								   AND TMP,TMP,BB
								   LDR J,=0
								   AND BIT,TMP,#1;0
GET_BITS						   LSR BIT2,TMP,J
								   AND BIT2,BIT2,#1;0
								   EOR BIT,BIT,BIT2
								   ADD J,#1
								   CMP J,#8
								   BNE GET_BITS
								   
								   SUB J,K,I
								   LSR C_BIT,C,J
								   AND C_BIT,#1
								   EOR C_BIT,BIT
								   LSL C_BIT,J
								   ORR RESULT,C_BIT
								   ADD I,#1
								   CMP I,#8
								   BNE FOR
								   
								   
		   
		   
		   
		                           MOV R0,RESULT
								   
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