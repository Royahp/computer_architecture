 
X           RN  0
K		   RN  1
I		   RN  2
R		   RN  3
T		   RN  4
TMP		   RN  5
Q		   RN  6
ONE		   RN  7
TMP2	   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
restoringSquareRoot           PROC
							  EXPORT restoringSquareRoot
							  PUSH{R4-R8,R10-R11,LR}
						      LDR I,=1
							  LDR TMP,=2
							  MUL R,TMP,X
							  LDR Q,=0
							  LDR ONE,=1
							  SUB T,K,ONE ;6-1=5 MEGHDARE SHIFT
							  
							  LSL T,ONE,T
							  
FOR							  CMP I,K
                              BGT RETURN
							  CMP R,T
							  BLE ELSE_IF
							  SUB R,R,T
							  SUB TMP,K,I
							  LSL TMP,ONE,TMP ;2^-i
							  ADD Q,TMP
							  
							  
							 
							  
ELSE_IF						LDR TMP,=2
                            MUL TMP,Q
							ADD TMP2,I,ONE
                            SUB TMP2,K,TMP2
                            LSL TMP2,ONE,TMP2
                            ADD T,TMP,TMP2
							LDR TMP,=2
                            MUL R,R,TMP
  
                            ADD I,#1
                            B  FOR
							
							  
						   
						   
						   
						   
						   
						   
						   
						   
RETURN						   MOV R0,Q
						   
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