 
R          RN  0
K		   RN  1
P		   RN  2
Q		   RN  3
I		   RN  4
TMP		   RN  5
TMP2	   RN  6
ONE		   RN  7
TWO		   RN  8
;		   RN  10
;		   RN  11
;		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
squer          PROC
	           EXPORT squer
			   PUSH{R4-R8,R10-R11,LR}
		       LDR P,=0
			   LDR Q,=0
			   LDR I,=1
			   LDR ONE,=1
			   LDR TWO,=2
WHILE          CMP I,K
               BGT RETURN
			   CMP R,#0
			   BEQ RETURN
			   
IFF            CMP R,#0
               BLE ELSE_IF
               MUL TMP,R,TWO ;2R
			   SUB TMP2,P,Q
			   MUL TMP2,TWO
			   SUB TMP,TMP2
			   SUB TMP2,K,I
			   LSL TMP2,ONE,TMP2;2^-i
			   SUB R,TMP,TMP2
			   ADD P,TMP2
			   B NEXT
			   
ELSE_IF        MUL TMP,R,TWO ;2R
			   SUB TMP2,P,Q
			   MUL TMP2,TWO
			   ADD TMP,TMP2
			   SUB TMP2,K,I
			   LSL TMP2,ONE,TMP2;2^-i
			   SUB R,TMP,TMP2
               ADD Q,TMP2
			   
		   
		   
		   
		   
NEXT		   ADD I,I,#1
               B WHILE
			   
RETURN         SUB TMP,P,Q
		   
		   
		   
		   MOV R0,TMP
		   
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