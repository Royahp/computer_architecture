 
INPUT      RN  0
OUTPUT 	   RN  1
NUM		   RN  2
INDEX	   RN  3
TMP		   RN  4
I		   RN  5
J		   RN  6
X		   RN  7;A[I]
Y		   RN  8;A[J]
K		   RN  10;J+1
;AK		   RN  11;A[J+1]
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
copyData       PROC
	           EXPORT copyData 
			   PUSH{R4-R8,R10-R11,LR}
			   LDR INDEX,=0
			   
COPY_LOOP	   CMP INDEX,NUM
			   BEQ COPY_DONE
			   LDRB TMP,[INPUT,INDEX]
			   STRB TMP,[OUTPUT,INDEX]
			   ADD INDEX,#1
			   B COPY_LOOP
		       
			   
COPY_DONE    		
		   

		   
		     POP{R4-R8,R10-R11,PC}
			 ENDP
				 
insertionSort 	PROC
	            EXPORT insertionSort 
			    PUSH{R4-R8,R10-R11,LR}	
                LDR I,=1
WHILE           CMP I,NUM
                BEQ END_WHILE
				LDRSB X,[OUTPUT,I]
				SUB J,I,#1
				
INEER_WHILE      CMP J,#0
                BLT END_INNER
				LDRSB Y,[OUTPUT,J]
				CMP Y,X
				BLE END_INNER
				ADD K,J,#1
				STRB Y,[OUTPUT,K];  A[j+1] ? A[j]
				SUB J,J,#1
				B INEER_WHILE
				

END_INNER       ADD K,J,#1
                STRB X,[OUTPUT,K]
                ADD I,I,#1
				B WHILE

END_WHILE

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