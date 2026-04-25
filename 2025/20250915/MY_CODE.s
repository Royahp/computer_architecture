 
NUM        RN  0
Q		   RN  1
REM		   RN  2
X		   RN  3
SUM		   RN  4
TMP		   RN  5
CNT		   RN  6
N		   RN  7
RETURN     RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
aliquotSum     PROC
	           EXPORT aliquotSum
			   PUSH{R4-R8,R10-R11,LR}
			   
			   MOV X,NUM
			   LDR SUM,=1
			   LDR CNT,=2
			   UDIV N,NUM,CNT
			   
			   
FOR			   CMP CNT,N
               BGT FINISH
               UDIV Q,X,CNT
			   MUL TMP,Q,CNT
			   SUB REM,X,TMP
			   CMP REM,#0
			   BNE NEXT
			   ADD SUM,CNT
			  
		   
		   
NEXT		    ADD CNT,#1
			    B FOR   
		   
		   
FINISH          CMP NUM,SUM
                IT EQ
				MOVEQ RETURN,#1
				IT LO
				MOVLO RETURN,#1
				IT GT
				MOVGT RETURN,#2
				
				
		   
		   
		   
	    	   MOV R0,RETURN
		   
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