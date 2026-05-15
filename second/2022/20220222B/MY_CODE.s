 
X          RN  0
N		   RN  1
Y		   RN  2
M		   RN  3
NP		   RN  4
MP		   RN  5
TMP		   RN  6
CNT		   RN  7
X2		   RN  8
R          RN  9
P		   RN  10
Q		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
computeG       PROC
	           EXPORT computeG
			   PUSH{R4-R9,R10-R11,LR}
			   LDR CNT,=0
			   
REMOVE_ZEROX   AND TMP,X,#1
			   CMP TMP,#0
			   ITTT EQ
			   LSREQ X,#1
			   ADDEQ CNT,#1
			   BEQ REMOVE_ZEROX
			   
			   SUB NP,N,CNT
			   
			   LDR CNT,=0
			   
REMOVE_ZEROY   AND TMP,Y,#1
			   CMP TMP,#0
			   ITTT EQ
			   LSREQ Y,#1
			   ADDEQ CNT,#1
			   BEQ REMOVE_ZEROY
			   
			   SUB MP,M,CNT
			   
			   MUL X2,X,X
			   ADD P,NP,NP
			   
			   MUL TMP,Y,X2
			   ADD Q,P,MP
			   
			   LDR CNT,=3
			   LSL CNT,Q
			   SUB TMP,CNT,TMP
			   
			   MUL TMP,X,TMP
			   ADD R,Q,NP
			   LDR CNT,=2
			   UDIV TMP,CNT
			   
			   CMP N,M
			   ITE GE
			   MOVGE CNT,N
			   MOVLT CNT,M
			   
			   SUB R,CNT
			   LSR TMP,R
			   
			   
			   
			   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		     MOV R0,TMP
		   
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