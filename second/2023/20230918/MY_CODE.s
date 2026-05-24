 
A          RN  0
RESULT	   RN  1
N	       RN  2
Q		   RN  3
REM		   RN  4
TMP		   RN  5
SUM		   RN  6
NUM	       RN  7
TEN		   RN  8
I		   RN  10
TOTAL	   RN  11
;		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
digitSum       PROC
	           EXPORT digitSum
			   PUSH{R4-R8,R10-R11,LR}
			   
			   
			  LDR TEN,=10
			  LDR SUM,=0
			  LDR I,=1
			  MOV NUM,A
			  
FOR         
           
              UDIV Q,NUM,TEN
			  MUL TMP,TEN,Q
			  SUB REM,NUM,TMP
			  ADD SUM,REM
			  MOV NUM,Q
			  CMP Q,#0
			  BNE FOR
			  
              ADD TOTAL,SUM,A		
              B digitaddition			  
		   
		   
		   
		    ; MOV R0,SUM
		   
		     POP{R4-R8,R10-R11,PC}
			 ENDP
				 
				 
			   
digitaddition  PROC
	           EXPORT digitaddition 
			   PUSH{R4-R8,R10-R11,LR}
			   
			   CMP I,N
			   BEQ FINISH
			   STRB TOTAL,[RESULT,I]
			   MOV NUM,TOTAL
			   ADD I,#1
			   
			   B FOR
			   
			 
			   
			   
FINISH		  MOV R0,SUM	   
			    
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