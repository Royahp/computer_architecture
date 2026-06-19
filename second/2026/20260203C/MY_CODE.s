 
MY_AREA    RN  0
MAX		   RN  1
N		   RN  2
A		   RN  3
TMP		   RN  4
J		   RN  5
I		   RN  6
PRE		   RN  7
CM		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
Recaman        PROC
	           EXPORT Recaman
			   PUSH{R4-R8,R10-R11,LR}
			   LDR N,=0
			   LDR A,=0
			   LDR J,=0
			   STR A,[MY_AREA,J]
			   
FOR_INIT	   ADD J,#4
			   
			   ADD N,#1
			   CMP N,MAX
			   BEQ FINISH
			   
			   SUB TMP,A,N
			   CMP TMP,#0
			   BLT OTHERWISE
			   
			   LDR I,=0
			   LDR CM,=4
			   MUL CM,N,CM
FOR            CMP I,CM
               BGT CHECKED
			   LDR PRE,[MY_AREA,I]
			   CMP PRE,TMP
			   BEQ OTHERWISE
			   ADD I,#4
			   B FOR
		   
CHECKED		   STR TMP,[MY_AREA,J]
               MOV A,TMP
               B FOR_INIT
		   
OTHERWISE	   ADD TMP,A,N    
               STR TMP,[MY_AREA,J]
			   MOV A,TMP
		       B FOR_INIT
		   
		   
		   
FINISH		  
		   
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