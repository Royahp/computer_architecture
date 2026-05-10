 
X          RN  0
N		   RN  1
Y		   RN  2
M		   RN  3
TMP		   RN  4
CNT	   RN  5
C		   RN  6
A		   RN  7
BB		   RN  8
D		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
computeF       PROC
	           EXPORT computeF
			   PUSH{R4-R8,R10-R11,LR}
		   
		       MOV TMP,Y
			   LDR CNT,=1
			   
COPUTE_C	   LSR TMP,#1
			   CMP TMP,#0
			   ITT NE
			   ADDNE CNT,#1
			   BNE COPUTE_C
			   
			   LDR TMP,=32
			   SUB C,TMP,CNT
			   
			   MOV A,M
			   MOV BB,N
			   
			   
			   LSL Y,C
			   UDIV Y,X
			   ADD TMP,A,C
			   SUB D,TMP,BB
			   CMP N,D
			   BGE NOVER
			   SUB TMP,D,N
			   LSL X,TMP
			   ADD TMP,X,Y
			   
NOVER			   
			   
			   
			   

		   
		   
		   
		   
		   
		 ;  MOV R0,RESULT
		   
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