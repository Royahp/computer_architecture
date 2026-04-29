 
Y          RN  0
N		   RN  1
T		   RN  2
TMP		   RN  3
I		   RN  4
I2		   RN  5
TMP2	   RN  6
SUM		   RN  7
;		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
Maclaurin_cos           PROC
					   EXPORT Maclaurin_cos
					   PUSH{R4-R8,R10-R11,LR}
					   LDR T,=100
					   LDR TMP,=100
					   MOV SUM,TMP
					   LDR I,=1
					   MUL Y,Y,Y
					   
FOR					   NEG T,T
					   MUL T,T,Y
					   LDR I2,=2
					   MUL I2,I
					   SUB TMP2,I2,#1
					   MUL TMP2,I2
					   MUL TMP2,TMP
					   SDIV T,TMP2
					   ADD SUM,T
					   ADD I,#1
					   CMP I,#4
					   BLE FOR
					   
					   
		   
		   
		   
		   
		   
		   
		   
		   
	         	   MOV R0,SUM
		   
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