 
Y           RN  0
N		   RN  1
SUM		   RN  2
TOLD	   RN  3
TNEW	   RN  4
TMP		   RN  5
I		   RN  6
I2		   RN  7
SAD		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
Maclaurin      PROC
	           EXPORT Maclaurin
			   PUSH{R4-R8,R10-R11,LR}
		       
			   LDR TMP,=10
			   MUL TOLD,TMP,Y
			   MOV SUM,TOLD
			   MUL Y,Y
			   LDR I,=1
			   LDR SAD,=100
			   
FOR			   NEG TOLD,TOLD
			   MUL TNEW,TOLD,Y ;SURAT
			   LDR TMP,=2
			   MUL I2,TMP,I
			   ADD TMP,I2,#1
			   MUL TMP,I2
			   MUL TMP,SAD
			   SDIV TNEW,TMP
			   
			   ADD SUM,TNEW
			   ADD I,#1
			   MOV TOLD,TNEW
			   CMP I, N
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