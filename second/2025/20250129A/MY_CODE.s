 
A          RN  0
BB		   RN  1
C		   RN  2
TMP		   RN  3
TMP2	   RN  4
TMP3	   RN  5
CNT		   RN  6
J		   RN  7
K		   RN  8
D		   RN  10
I		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
bitwiseAffineTransformation        PROC
								   EXPORT bitwiseAffineTransformation
								   PUSH{R4-R8,R10-R11,LR}
							        
								   LDR I,=0
								   LDR J,=7
								   LDR D,=0
									
FOR_A							   LDRB TMP,[A,I]
								   AND TMP,BB
								   
								   
								   AND TMP2,TMP,#0X1
								   LDR CNT,=1
FOR_XOR							   LSR TMP,#1
								   AND TMP3,TMP,#1
								   EOR TMP2,TMP3
								   ADD CNT,#1
								   CMP CNT,#8
								   BLE FOR_XOR
								   
								   SUB K,J,I
                                   LSR TMP,C,K
								   AND TMP,#1
                                   EOR TMP,TMP2
								   LSL TMP,K
								   ORR D,TMP
								   
								   ADD I,#1
						
								   CMP I,#8
                                   BLT FOR_A								   
                                   								   
								   
		   
		   
		   
		   
		   
		   
		   
		   
		    MOV R0,D
		   
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