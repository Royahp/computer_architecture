 
Y          RN  0
N		   RN  1
T0		   RN  2
TMP		   RN  3
T		   RN  4
Y2		   RN  5
PREV	   RN  6
I		   RN  7
I2		   RN  8
SAD	       RN  9
TMP2		   RN  10
SUM	   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
Maclaurin           PROC
	                EXPORT Maclaurin
			        PUSH{R4-R9,R10-R11,LR}
					LDR TMP,=10
					MUL T0,Y,TMP
					LDR I,=1
					LDR SAD,=100
					MOV SUM,T0
					MOV PREV,T0
					MUL Y2,Y,Y
					
FOR					CMP I,N
                    BGT FINISH
                    NEG PREV,PREV
					MUL TMP,PREV,Y2
					LDR TMP2,=2
					MUL I2,TMP2,I
					ADD TMP2,I2,#1
					MUL TMP2,I2
					MUL TMP2,SAD
					SDIV TMP,TMP2
					ADD SUM,TMP
					MOV PREV,TMP
					ADD I,#1
					B FOR
					
					
					
					
					
					
			
		   
FINISH 		   MOV R0,SUM
		   
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