 
NUM        RN  0
N		   RN  1
Q		   RN  2
REM		   RN  3
TEN		   RN  4
TMP		   RN  5
PRE		   RN  6
CNT		   RN  7
RES		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
Look_and_say   PROC
	           EXPORT Look_and_say 
			   PUSH{R4-R8,R10-R11,LR}
			   LDR TEN,=10
			   LDR PRE,=0
			   MOV N,NUM
GET_DIGIT	   UDIV Q,N,TEN
			   MUL TMP,Q,TEN
			   SUB REM,N,TMP
			   MUL PRE,TEN
			   ADD PRE,REM
			   
			   MOV N,Q
			   CMP Q,#0
			   BGT GET_DIGIT
			   
			   LDR CNT,=0
			   LDR RES,=0
			   MOV N,PRE
       	       UDIV Q,N,TEN
			   MUL TMP,Q,TEN
			   SUB REM,N,TMP
			   MOV PRE,REM
			   ADD CNT,#1
			   MOV N,Q
			 
			   
			   
		   
COUNT 		   UDIV Q,N,TEN
			   MUL TMP,Q,TEN
			   SUB REM,N,TMP
			   MOV N,Q
			   CMP REM,PRE
			   IT EQ
			   ADDEQ CNT,#1
			   BEQ COUNT
			   
			   MUL RES,TEN
			   ADD RES,CNT
			   MUL RES,TEN
			   ADD RES,RES,PRE
			   
			   MOV PRE,REM
			   MOV CNT,#1
			   CMP Q,#0
			   BGT COUNT
			   
		   
		   
  	   
		   
		   
		   
        	   MOV R0,RES
		   
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