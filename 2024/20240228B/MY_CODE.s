 
ROW        RN  0
COL		   RN  1
MAZE	   RN  2
I		   RN  3
J		   RN  4
N		   RN  5
CUR		   RN  6
NEI		   RN  7
FLAG	   RN  8
CHANGED	   RN  10
;		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
deadEndFilling           PROC
	                     EXPORT deadEndFilling
			             PUSH{R4-R8,R10-R11,LR}
						 ADD I,COL,#1
						 MUL N,COL,ROW
						 SUB N,COL
						 LDR FLAG,=0

						 
START					
                         LDRB CUR,[MAZE,I]
						 CMP CUR,#' '
						 BNE NEXT_CELL
						 
						 ;TOP
						 SUB J,I,COL
						 LDRB NEI,[MAZE,J]
						 CMP NEI,#'*'
						 IT EQ
						 ADDEQ FLAG,#1
						 
						 ;RIGHT
						 
						 ADD J,I,#1
						 LDRB NEI,[MAZE,J]
						 CMP NEI,#'*'
						 IT EQ
						 ADDEQ FLAG,#1
						 
						 ;BOTTOM
						  
						 ADD J,I,COL
						 LDRB NEI,[MAZE,J]
						 CMP NEI,#'*'
						 IT EQ
						 ADDEQ FLAG,#1
						 
						 ;LEFT
						 SUB J,I,#1
						 LDRB NEI,[MAZE,J]
						 CMP NEI,#'*'
						 IT EQ
						 ADDEQ FLAG,#1
						 
						 
						 CMP FLAG,#3
						 BNE NEXT_CELL
						 MOV CUR,#'*'
						 STRB CUR,[MAZE,I]
						 MOV CHANGED,#1
						 
		   
		   
		   
		   
		   
NEXT_CELL                MOV FLAG,#0
                         ADD I,#1
						 
                         CMP I,N
						 BNE START
						 CMP CHANGED,#1
						 ITTT EQ
						 ADDEQ I,COL,#1
						 MOVEQ CHANGED,#0
						 BEQ START
		   
FINISH		   
		   
	;	   MOV R0,RESULT
		   
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