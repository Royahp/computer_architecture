 
N          RN  0
SUM		   RN  1
A		   RN  2
FLAG	   RN  3
BB  	   RN  4
TMP		   RN  5
REM		   RN  6
PAR 	   RN  7
;		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
isSociable     PROC
	           EXPORT  isSociable
			   PUSH{R4-R8,R10-R11,LR}
			   LDR SUM,=1
			   LDR A,=2
			   LDR FLAG,=1
			   UDIV PAR,N,A
			   
WHILE          CMP FLAG,#0
               BEQ END_WHILE
			   UDIV BB,N,A
			   MUL TMP,A,BB
			   SUB REM,N,TMP
			   CMP REM,#0
			   BNE ADD_A
			   
			   CMP A,BB
			   BGE ELSE_IF
			   ADD TMP,A,BB
			   ADD SUM,TMP
			   B ADD_A
			   
			   
ELSE_IF    	   CMP A,BB
               IT EQ
			   ADDEQ SUM,A
			   BEQ END_WHILE
            
			   
		   
ADD_A		   ADD A,#1
               CMP A,PAR
			   IT GT
			   MOVGT FLAG,#0
               B WHILE
		   
		   
		   
		   
		   
		   
		   
END_WHILE	  ;MOV R0,RESULT
		   
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