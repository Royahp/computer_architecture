 
NUM        RN  0
TEN		   RN  1
Q		   RN  2
TMP		   RN  3
REM		   RN  4
PRE		   RN  5
CNT		   RN  6
N		   RN  7
;		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
run_length_encoding      PROC
	                     EXPORT run_length_encoding
			             PUSH{R4-R8,R10-R11,LR}
		                 
						 LDR TEN,=10
						 LDR PRE,=0
						 
FOR						 
                         UDIV Q,NUM,TEN
						 MUL TMP,TEN,Q
						 SUB REM,NUM,TMP
						 
						 MUL TMP,PRE,TEN
						 ADD PRE,TMP,REM
						 MOV NUM,Q
						 CMP Q,#0
						 BNE FOR
						 
						 
						 MOV NUM,PRE
						 
						 LDR CNT,=1
						 LDR N,=0
						 
						 
						 UDIV Q,NUM,TEN
						 MUL TMP,TEN,Q
						 SUB REM,NUM,TMP
						 
						 MOV PRE,REM
						
						 
FOR2		             MOV NUM,Q
                         UDIV Q,NUM,TEN
						 MUL TMP,TEN,Q
						 SUB REM,NUM,TMP
						 
						 CMP PRE,REM
						 ITT EQ
						 ADDEQ CNT,#1
						 BEQ FOR2
						 
						 MUL N,TEN
						 ADD N,PRE
						 MUL N,TEN
						 ADD N,CNT
						 LDR CNT,=1
						 MOV PRE,REM
						 CMP NUM,#0
						 BNE FOR2
						 
		   
		   
		   
		   
		   
		   
		   
FINISH		             MOV R0,N
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