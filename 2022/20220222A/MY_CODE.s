 
X          RN  0
BB		   RN  1
Y		   RN  2
A		   RN  3
TMP3	   RN  4
MAX	   RN  5
C		   RN  6
TMP		   RN  7
CNT		   RN  8
TMP2	   RN  10
D		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
computeF           PROC
	           EXPORT computeF
			   PUSH{R4-R8,R10-R11,LR}
			 
			   LDR CNT,=0
			   LDR TMP2,=31
			   
			   MOV TMP,Y ;00...0101001
FIND_C		   
			   LSR TMP ,#1
			   CMP TMP,#0
			   ITT NE
			   ADDNE CNT,#1
			   BNE FIND_C
			   SUB C,TMP2,CNT
			   
		
			   
			   LSL TMP,Y,C 
			   UDIV TMP,X
			   ADD D,A,C
			   SUB D,D,BB
			   
			   SUB TMP2,D,BB
			   LSL TMP3,X,TMP2 ;SHIFTED X
			   ADD TMP,TMP,TMP3
			   
			   LDR TMP3,=2
			   UDIV TMP,TMP3;RESULT
			    
			CMP A,BB
			ITE GE
			MOVGE MAX,A
			MOVLT MAX,BB
			 
			   
			   
			   SUB TMP2,D,MAX
			  
			   LSR TMP,TMP,TMP2
			   
			   
			   
			   
			   
			   
			   
			   
		   
		       
		   
		   
		   
		   
		   
		   
		   
		   
		   MOV R0,TMP
		   
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