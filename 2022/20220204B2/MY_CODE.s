 
X          RN  0
K		   RN  1
P		   RN  2
Q		   RN  3
I		   RN  4
R_2		   RN  5
R		   RN  6
TMP		   RN  7
MI		   RN  8
TMP2	   RN  10
RESULT		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
nonRestoringSquareRoot         PROC
							   EXPORT nonRestoringSquareRoot
							   PUSH{R4-R8,R10-R11,LR}
							   LDR P,=0
							   LDR Q,=0
							   LDR I,=1
							   MOV R,X
							   
WHILE						   CMP I,K
							   BGT RETURN
							   CMP R,#0 
							   BEQ RETURN
							   
							   CMP R,#0
							   BLE ELSE_IF
							   
							   LDR R_2,=2
							   
							   SUB TMP,P,Q
							   MUL TMP,R_2,TMP;2 * (P – Q) 
							   MUL R_2,R ;2R
							   SUB R,R_2,TMP ;2 * r – 2 * (P – Q) 
							   SUB MI,K,I
							   LDR TMP2,=1
							   LSL TMP2,MI
							   
							   SUB R,TMP2
							   ADD P,TMP2
							   B NEXT
							   
		   
ELSE_IF		                   LDR R_2,=2
							   
							   SUB TMP,P,Q
							   MUL TMP,R_2,TMP;2 * (P – Q) 
							   MUL R_2,R ;2R
							   ADD R,R_2,TMP ;2 * r + 2 * (P – Q) 
							   SUB MI,K,I
							   LDR TMP2,=1
							   LSL TMP2,MI
							   SUB R,TMP2
							   ADD Q,TMP2 
							   
							   B NEXT
							   
		   
NEXT                           ADD I,#1
                               B WHILE
		   
		   
		   
		    
RETURN		                  SUB RESULT,P,Q 
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