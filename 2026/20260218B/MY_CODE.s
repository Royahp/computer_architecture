 
RESULT     RN  0
DIM		   RN  1
A		   RN  2
AN_1       RN  3
N		   RN  4
AN		   RN  5
TMP		   RN  6
N_1    	   RN  7
INDEX	   RN  8
TMP2	   RN  10
MAX		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
HofstadterConway       PROC
					   EXPORT HofstadterConway
					   PUSH{R4-R8,R10-R11,LR}
					   LDR A,=1
					  
					   LDR INDEX,=0
					   STRB A,[RESULT,INDEX]
					   ADD INDEX,#1
					   STRB A,[RESULT,INDEX]
					   MOV MAX,A
					   
					   ADD INDEX,#1 ;2
					   LDR N,=3
					   
FOR					   SUB N_1,N,#2
					   LDRB AN_1,[RESULT,N_1]; a(n - 1)
					   SUB TMP,N,AN_1
					   SUB N_1,TMP,#1
					   LDRB TMP,[RESULT,N_1] ;a(n - a(n - 1))
					   
					   SUB TMP2,AN_1,#1
					   LDRB TMP2,[RESULT,TMP2]
					   
					   ADD TMP,TMP2,TMP
					   STRB TMP,[RESULT,INDEX]
					   
					   ADD INDEX,#1
					   ADD N,#1
					   CMP N,DIM
					   BNE FOR
					   
					   
					   ;MAX VALUE
					   
					   LDR INDEX,=1
FOR_MAX				   CMP INDEX,DIM
                       BGT FINISH
	      		       LDRB TMP,[RESULT,INDEX]
					   
					   CMP TMP ,MAX
					   IT GT
					   MOVGT MAX,TMP
					   
					   ADD INDEX,#1
					   B FOR_MAX
					   
					   
					   
					   
					 
					   
					   
				   
		   
		   
		   
		   
		   
		   
		   
		   
FINISH       	   MOV R0,MAX
		   
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