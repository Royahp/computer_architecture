 
ROW        RN  0
COL		   RN  1
MAZE	   RN  2
VISIT	   RN  3
CUR		   RN  4
I		   RN  5
J		   RN  6
NEI		   RN  7
K		   RN  8
		   RN  10
		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
exploreMaze    PROC
	           EXPORT exploreMaze
			   PUSH{R4-R8,R10-R11,LR}
			   ADD I,COL,#1
			   LDR K,=0
			   MUL N,COL,ROW
			   SUB N,COL
			   
FOR			   LDRB CUR,[MAZE,I]
			   CMP CUR,#' '
			   BNE NEXT
			   MOV CUR,#'V'
			   STRB CUR,[MAZE,I]
			   
			   ;RIGHT
			   ADD J,I,#1
			   LDRB NEI,[MAZE,J]
			   CMP NEI,#'X'
			   BEQ LEFT
			   CMP NEI,#'V'
			   BEQ LEFT
			   
			   STRB I,[VISIT,K]
			   MOV CUR,NEI
			   
LEFT           SUB J,I,#1
			   LDRB NEI,[MAZE,J]
			   CMP NEI,#'X'
			   BEQ TOP
			   CMP NEI,#'V'
			   BEQ TOP
			   
			   STRB I,[VISIT,K]
			   MOV CUR,NEI
			   
TOP	           SUB J,I,COL
			   LDRB NEI,[MAZE,J]
			   CMP NEI,#'X'
			   BEQ BOTTOM
			   CMP NEI,#'V'
			   BEQ BOTTOM
			   
			   STRB I,[VISIT,K]
			   MOV CUR,NEI
			   
BOTTOM         ADD J,I,COL
			   LDRB NEI,[MAZE,J]
			   CMP NEI,#'X'
			   BEQ LAST_ELSE
			   CMP NEI,#'V'
			   BEQ LAST_ELSE
			   
			   STRB I,[VISIT,K]
			   MOV CUR,NEI 			   
			   
LAST_ELSE       
           
		   
		   
		   
		   
		   
		   
		   
		   
		   
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