 
U          RN  0
L		   RN  1
D		   RN  2
TMP		   RN  3
TMP1	   RN  4
FLAG	   RN  5
;		   RN  6
;		   RN  7
;		   RN  8
;		   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
SDIV64         PROC
	           EXPORT SDIV64
			   PUSH{R4-R8,R10-R11,LR}
			   
			   LSR TMP,U,#3
			   LSR TMP1,D,#3
			   CMP TMP,TMP1
			   ITE EQ
			   MOVEQ FLAG,#1
			   MOVNE FLAG,#0
			   
			   CMP TMP,#1
			   BNE DIVISER_NEG
			   
			   MVN U,U
			   MVN L,L
			   AND U,#0X0000000F
			   AND L,#0X0000000F
			   ADDS L,L,#1 
			   ADC U,U,#0
			   
			   
DIVISER_NEG    MVN D,D
               AND D,#0X0000000F
			   ADDS D,D,#1
			   
			   
			   
		   
		   
		   
		   
		   
		   
		   
		   
		   
;		   MOV R0,RESULT
		   
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