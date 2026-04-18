;

ROW        RN  0
COL        RN  1
MAZE       RN  2

I          RN  3
CUR        RN  4
NEI        RN  5
BASE       RN  6
J          RN  7
TMP        RN  8
N          RN  9
LIMIT      RN  10

        AREA MYCODE, CODE, READONLY

shortestPath   PROC
        EXPORT shortestPath
        PUSH {R4-R10,LR}

        ; ---- INIT ----
        MOV BASE,#0

        ; LIMIT = ROW * COL
        MUL LIMIT,ROW,COL

; =========================
; MAIN LOOP (wave)
; =========================

NEXT_BASE
        MOV I,COL          ; ???? ?? ???? ??? (border ???? ?? ?? ???????)

FOR
        CMP I,LIMIT
        BEQ INC_BASE

        LDRB CUR,[MAZE,I]

        CMP CUR,#'e'
        BEQ CHECK_EXIT

        CMP CUR,BASE
        BNE NEXT_CELL

; -------- EXPAND --------

; TOP
        SUB J,I,COL
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BNE LEFT
        ADD TMP,CUR,#1
        STRB TMP,[MAZE,J]

LEFT
        SUB J,I,#1
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BNE RIGHT
        ADD TMP,CUR,#1
        STRB TMP,[MAZE,J]

RIGHT
        ADD J,I,#1
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BNE BOTTOM
        ADD TMP,CUR,#1
        STRB TMP,[MAZE,J]

BOTTOM
        ADD J,I,COL
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BNE NEXT_CELL
        ADD TMP,CUR,#1
        STRB TMP,[MAZE,J]

; -------- NEXT CELL --------
NEXT_CELL
        ADD I,I,#1
        B FOR

; =========================
; NEXT WAVE
; =========================
INC_BASE
        ADD BASE,BASE,#1
        B NEXT_BASE

; =========================
; CHECK EXIT (cell = 'e')
; =========================

CHECK_EXIT
        MOV N,#255     ; ??? ????? ?????? ???? ??????

; ---- TOP ----
        SUB J,I,COL
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BEQ CHECK_LEFT
        CMP NEI,#'X'
        BEQ CHECK_LEFT
        CMP NEI,#'e'
        BEQ CHECK_LEFT
        MOV N,NEI

; ---- LEFT ----
CHECK_LEFT
        SUB J,I,#1
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BEQ CHECK_RIGHT
        CMP NEI,#'X'
        BEQ CHECK_RIGHT
        CMP NEI,#'e'
        BEQ CHECK_RIGHT
        CMP NEI,N
        MOVLO N,NEI

; ---- RIGHT ----
CHECK_RIGHT
        ADD J,I,#1
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BEQ CHECK_BOTTOM
        CMP NEI,#'X'
        BEQ CHECK_BOTTOM
        CMP NEI,#'e'
        BEQ CHECK_BOTTOM
        CMP NEI,N
        MOVLO N,NEI

; ---- BOTTOM ----
CHECK_BOTTOM
        ADD J,I,COL
        LDRB NEI,[MAZE,J]
        CMP NEI,#' '
        BEQ AFTER_CHECK
        CMP NEI,#'X'
        BEQ AFTER_CHECK
        CMP NEI,#'e'
        BEQ AFTER_CHECK
        CMP NEI,N
        MOVLO N,NEI

AFTER_CHECK
        CMP N,#255
        BEQ NEXT_CELL      ; ???? ?? exit ??? ????

        ; ???? ???? ??
        MOV R0,N

        POP {R4-R10,PC}

        ENDP
        END
;ROW        RN  0
;COL		   RN  1
;MAZE	   RN  2
;I		   RN  3
;CUR		   RN  4
;NEI		   RN  5
;N		   RN  6
;BASE	   RN  7
;J		   RN  8
;TMP	       RN  10
;TMP2	   RN  11
;		   
;		   
;		   
;		   AREA MYCODE,CODE,READONLY
;			   
;shortestPath           PROC
;	                   EXPORT shortestPath
;			           PUSH{R4-R8,R10-R11,LR}
;					   
;					   LDR I,=0
;;					   MUL N,ROW,COL
;;					   SUB N,COL
;					   ADD I,COL
;					   LDR N,=0
;					 
;					   LDR BASE,=0
;					    
;          					   
;					   
;FOR					   LDRB CUR,[MAZE,I]
;                       CMP CUR,#'e'
;					   BEQ CHECK_EXIT
;                       CMP CUR,BASE
;					   BNE NEXT_CELL
;					   

;					   
;					   ;TOP
;					   SUB J,I,COL
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BNE LEFT
;					   ADD NEI,CUR,#1
;					   STRB NEI,[MAZE,J]
;				
;					   
;LEFT                   SUB J,I,#1
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BNE RIGHT
;					   ADD NEI,CUR,#1
;					   STRB NEI,[MAZE,J]
;           
;					   					   
;RIGHT                  ADD J,I,#1
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BNE BOTTOM
;					   ADD NEI,CUR,#1
;					   STRB NEI,[MAZE,J]
;             
;					   
;BOTTOM                 ADD J,I,COL
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BNE NEXT_CELL
;					    ADD NEI,CUR,#1
;					   STRB NEI,[MAZE,J]
;                		   
;		   
;NEXT_CELL            
;					   ADD I,#1
;					  ; CMP I,N
;					   ;BEQ NEXT_BASE
;					   B FOR
;					   
;NEXT_BASE              ADD BASE,#1
;                       MOV I,#0
;					   ADD I,COL
;					   B FOR
;					   
;CHECK_EXIT             SUB J,I,COL
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BEQ CHECK_LEFT 
;					   CMP NEI,#'X'
;					   BEQ CHECK_LEFT
;					   MOV TMP,NEI


;CHECK_LEFT             SUB J,I,#1
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BEQ CHECK_RIGHT
;					   CMP NEI,#'X'
;					   BEQ CHECK_RIGHT
;					   MOV TMP2,NEI
;					   CMP TMP,TMP2
;					   ITE LE
;					   MOVLE N,TMP
;					   MOVGT N,TMP2
;					   
;					   
;CHECK_RIGHT			   ADD J,I,#1
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BEQ CHECK_BOTTOM
;					   CMP NEI,#'X'
;					   BEQ CHECK_BOTTOM
;					   MOV TMP,NEI
;					   CMP TMP,N
;					   IT LE
;					   MOVLE N,TMP
;					   
;					   					   
;CHECK_BOTTOM		   ADD J,I,COL
;					   LDRB NEI,[MAZE,J]
;					   CMP NEI,#' '
;					   BEQ NEXT_BASE
;					   CMP NEI,#'X'
;					   BEQ EXIT
;					   MOV TMP,NEI
;					   CMP TMP,N
;					   IT LE
;					   MOVLE N,TMP
;					   
;					   
;					   
;		   
;EXIT		           MOV R0,N
;		   
;		     POP{R4-R8,R10-R11,PC}
;			 ENDP
;			 END 
;				 
;				 
;;ADD  PNTR, SP, #32 ;stack pointer	
;;STR  NUM, [PNTR]        ;  store digit IN STACK
;;ADD  PNTR, PNTR, #4     ;  next slot
;;LDR 	TMP,[PNTR] ;GET DIGIT FROM STACK
;;LSL A,B,#1 A=2B
;;CS,HS unsigned>=
;;CC,LO unsigned<
;;MI negative
;;PL positive or 0
;;VS overFlow VC no over
;;HI unsigned>
;;LS unsigned<=
;;GE signed>=
;;LE signed <=
;;GT igned>
;;LT signed <
;;AL always
;;MVN Rd, Rn ,ADDS RD,#1 ; MAKUS MIKONE YANI AGE Rn = 0000 1101 MISHE Rd = 1111 0010 
;;X=UL  MVN U,U - MVN L,L -ADDS L,L,#1 -ADC U,U,#0 ;MAKUSE ADADE DO BAKHSI BA CARRY BIT
;;{SUBS  TMP, E2, E1      ; TMP = E2 - E1  
;;IT    MI               ; agar hasele tafrigh manfi bud,mosbatesh kone
;;RSBMI TMP, TMP, #0   }  ; TMP = 0 - TMP  => abs
;;BIC X, X,mask ;baraye 0 kardane bit morede nazar masalan mask=0101 bashe bit0 va bit2 ra tuye x sefr mikone

;;lowercase letter 97-122
;;upper 65-90