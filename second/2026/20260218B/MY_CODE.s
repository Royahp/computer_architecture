 
V          RN  0
DIM		   RN  1
Q		   RN  2
QN		   RN  3
N		   RN  4
TMP		   RN  5
TMP2	   RN  6
N_1	       RN  7
QN_1	   RN  8
QN_2       RN 9
N_2		   RN  10
MAX		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
HofstadterConway     PROC
	                 EXPORT HofstadterConway
			         PUSH{R4-R9,R10-R11,LR}
					 LDR Q,=1
					 LDR TMP,=0
					 STR Q,[V,TMP]
					 ADD TMP,#4
					 STR Q, [V,TMP]
					 MOV MAX,Q
					 LDR N,=3
					 
				
FOR				     SUB N_1,N,#1
					 SUB N_1,N_1,#1
					 LSL N_1,#2
                     LDR QN_1,[V,N_1] ;Q(n-1)=
					 SUB TMP,N,QN_1
					 SUB TMP,TMP,#1
					 LSL TMP,#2       ; (n - Q(n-1))
					 LDR TMP,[V,TMP]  ; Q(n - Q(n-1))
					 
					 SUB N_2,N,#2
					 SUB N_2,#1
					 LSL N_2,#2
					 LDR QN_2,[V,N_2] ; Q(n-2)
					 SUB TMP2,N,QN_2
					 SUB TMP2,#1
					 LSL TMP2,#2
					 LDR TMP2,[V,TMP2] ;  Q(n - Q(n-2))
					 
					 ADD Q,TMP,TMP2
					 SUB TMP2,N,#1
                     LSL TMP2,#2
                     STR Q,[V,TMP2]
					 
					 CMP MAX,Q
					 BGE NEXT
                     MOV MAX,Q		
                     					 
					 


NEXT                 ADD N,#1 
                     CMP N, DIM
					 BLE FOR
				
				
		   
		   
		             MOV R0,MAX
		   
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