 
P1          RN  0
P2		   RN  1
M1		   RN  2
M2		   RN  3
IM		   RN  4
TMP		   RN  5
EX1		   RN  6
EX2		   RN  7
EXR		   RN  8
MR		   RN  10
RESULT		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
addFPpositiveNumbers           PROC
							   EXPORT addFPpositiveNumbers
							   PUSH{R4-R8,R10-R11,LR}
							   LDR IM,=0X7FFFFF
							   AND M1,P1,IM
							   AND M2,P2,IM
							   
							   LDR TMP,=0X800000
							   ORR M1,TMP
							   ORR M2,TMP
							   
							   LSR EX1,P1,#23
							   LSR EX2,P2,#23
							   
							   LDR TMP,=0XFF
							   
							   AND EX1,TMP
							   AND EX2,TMP
							   
							   CMP EX1, EX2
							   ITE EQ
							   MOVEQ EXR,EX1
							   BNE CHECK_HIGH
							   
							   
							   
CHECK_HIGH                     CMP EX1,EX2
                               BLT EX2_HIGHER
							   MOV EXR,EX1
							   SUB TMP,EX1,EX2
							   LSR M2,M2,TMP
							   B CONTINUE
							   
							   
EX2_HIGHER                     MOV EXR,EX2
                               SUB TMP,EX1,EX2
							   LSR M1,M1,TMP
							 
						   
						   
						   
						   
CONTINUE					   ADD MR,M1,M2 
                               LSR TMP,MR,#24
							   AND TMP,#1
							   CMP TMP,#1
							   BNE NEXT
							   LSR MR,#1
							   ADD EXR,#1
						   
NEXT						   LDR TMP,=0X800000
							   ORR MR,TMP
							   
							   LSL RESULT,EXR,#23
							   ORR RESULT,MR
						   
						       MOV R0,RESULT
						   
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