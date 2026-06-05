 
NUM        RN  0
CNT		   RN  1
Q		   RN  2
REM		   RN  3
TMP		   RN  4
SUM		   RN  5
N		   RN  6
MAX		   RN  7
RESULT	   RN  8
;		   RN  10
;		   RN  11
;		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
aliquotSum     PROC
	           EXPORT aliquotSum
			   PUSH{R4-R8,R10-R11,LR}
			   LDR CNT,=1
			   MOV N,NUM
			   LDR TMP,=2
			   UDIV MAX,NUM,TMP
			   
FOR			   CMP CNT,MAX
			   BGT FINISH
			
			   UDIV Q,N,CNT
			   MUL TMP,Q,CNT
			   SUB REM,N,TMP
			   CMP REM,#0
			   IT EQ
			   ADDEQ SUM,CNT
			   
			   ADD CNT,#1
			  ; MOV N,Q
			   B FOR
			   
		   
		   
		   
		   
FINISH		  CMP NUM,SUM
              IT EQ
			  MOVEQ RESULT,#1
			  IT LT
			  MOVLT RESULT,#0
			  IT GT 
			  MOVGT RESULT,#2
               
              MOV R0,RESULT
		   
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