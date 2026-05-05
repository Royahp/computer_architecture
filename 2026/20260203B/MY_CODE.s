 
NUM        RN  0
Q		   RN  1
REM		   RN  2
TEN		   RN  3
TMP		   RN  4
PRE		   RN  5
NEW		   RN  6
N		   RN  7
PL		   RN  8
CNT		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
run_length_encoding      PROC
	                     EXPORT run_length_encoding
			             PUSH{R4-R8,R10-R11,LR}
						 LDR TEN,=10
						 LDR PRE,=0
						 LDR N,=0
						 LDR CNT,=1
						
						 
FOR						UDIV Q,NUM,TEN
						MUL TMP,Q,TEN
						SUB REM,NUM,TMP
						MUL PRE,TEN
						ADD NEW,PRE,REM
						MOV PRE,NEW
						
						CMP Q,#0
						ITT NE
						MOVNE NUM,Q
						BNE FOR
						
		                MOV NUM,NEW
		      
		   
		                UDIV Q,NUM,TEN
						MUL TMP,Q,TEN
						SUB REM,NUM,TMP
						MOV PL,REM
						
FOR2					MOV NUM,Q
						
					
						UDIV Q,NUM,TEN
						MUL TMP,Q,TEN
						SUB REM,NUM,TMP
						CMP REM,PL
						ITT EQ
						ADDEQ CNT,#1
						BEQ FOR2
						
						MUL N,TEN
						ADD N,PL
						MUL N,TEN
						ADD N,CNT
						MOV PL,REM
						MOV CNT,#1
						CMP NUM,#0
						BNE FOR2
						
		   
		   
		   
		   
		   
FINISH	     	       MOV R0,N
		   
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