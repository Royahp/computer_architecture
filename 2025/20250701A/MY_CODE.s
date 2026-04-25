 
X          RN  0
A		   RN  1
C		   RN  2
N		   RN  3
M		   RN  4
PNTR	   RN  5
I		   RN  6
TMP		   RN  7
REM		   RN  8
Q		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
nextElementLCG         PROC
					   EXPORT nextElementLCG
					   PUSH{R4-R8,R10-R11,LR}
    				   ADD PNTR,SP,#32
					   LDR M,[PNTR]
					   LDR I,=0
					   
FOR					   CMP I,N
					   BEQ FINISH
					   MUL TMP,A,X
					   ADD TMP,C
					   EOR TMP,I
					   UDIV Q,TMP,M
					   MUL Q,Q,M
					   SUB REM,TMP,Q
					   
					   
					   MOV X,REM
					   ADD I,#1
					   B FOR
					   
				    
		   
		   
		   
		   
		   
		   
		   
FINISH		   
		      MOV R0,REM
		   
		     POP{R4-R8,R10-R11,PC}
			 ENDP
			 END 
				 
				 
;ADD  PNTR, SP, #32 ;stack pointer	
;STR  NUM, [PNTR]        ;  store digit IN STACK
;ADD  PNTR, PNTR, #4     ;  next slot
;LDR  TMP,[PNTR] ;GET DIGIT FROM STACK
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