 
X           RN  0
K		   RN  1
R		   RN  2
Q		   RN  3
I		   RN  4
TMP		   RN  5
TWO_I	   RN  6
TMP2	   RN  7
;		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
squareRoot     PROC
	           EXPORT squareRoot 
			   PUSH{R4-R8,R10-R11,LR}
			   MOV R,X
			   LDR Q,=0
			   LDR I,=1
			   
FOR			   CMP I,K
			   BGT RETURN
			   LDR TMP,=2
			   MUL R,TMP,R
			   SUB TMP,K,I
			   LDR TWO_I,=1
			   LSL TWO_I,TMP ;2^-I
			   
			   ADD TMP2,Q,TWO_I
IFF			   CMP R,TMP2
			   BLT ELSE_IF
			   
			   LDR TMP,=2
			   MUL TMP,Q ;2*Q
			   SUB R,TMP ;r – 2 * Q 
			   SUB R,TWO_I ;r = r – 2 * Q - 2-i
			   ADD Q,TWO_I ;Q = Q + 2-i   
               B NEXT			   
			   
			   
			   
		   
ELSE_IF		   ADD TMP,Q,TWO_I
               NEG TMP,TMP
			   CMP R,TMP
			   BGE NEXT
			   LDR TMP,=2
			   MUL TMP,Q ;2*Q
			   ADD R,TMP ;r + 2 * Q 
			   SUB R,TWO_I ;r = r + 2 * Q - 2-i
			   SUB Q,TWO_I ;Q = Q - 2-i 
			   
		   
NEXT           ADD I,#1
               B FOR
		   
	   
		   
		   
		   
RETURN			   MOV R0,Q
		   
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