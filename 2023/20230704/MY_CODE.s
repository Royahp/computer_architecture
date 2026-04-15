 
N          RN  0
SUM		   RN  1
A		   RN  2
BB		   RN  3
FLAG	   RN  4
REM		   RN  5
TMP		   RN  6
RETURN	   RN  7
PREV	   RN  8
CNT 	   RN  10
NUM		   RN  11
		   
		   
		   
		   AREA MYCODE,CODE,READONLY
			   
isSociable           PROC
	                 EXPORT isSociable
			         PUSH{R4-R8,R10-R11,LR}
					 LDR SUM,=1
					 LDR A,=2
					 LDR FLAG,=1
					 ;LDR PREV,=0
					 LDR CNT,=1
					 MOV NUM,N
					 
WHILE                CMP FLAG ,#1
                     BNE NEXT_STEP
					 UDIV BB,NUM,A
					 MUL TMP,A,BB
					 SUB REM,NUM,TMP
					 
					 CMP REM,#0
					 BNE NEXT_A
					 CMP A,BB
					 BGE EQ_COND
					 ADD TMP,A,BB
					 ADD SUM,TMP
					 B NEXT_A
					 
EQ_COND				 CMP A,BB
                     ITE EQ
					 ADDEQ SUM,A
					 MOVNE FLAG,#0
		   
		   
NEXT_A               ADD A,A,#1	
                 
                     B WHILE
		   
		   
NEXT_STEP            CMP NUM,SUM
                     ITT EQ
					 MOVEQ RETURN,#1
					 BEQ FINISH
					 
					 CMP SUM,#1
					 ITT EQ
					 MOVEQ RETURN,#0
					 BEQ FINISH
					 
					 
                     CMP SUM,N	
                     ITT EQ
					 MOVEQ RETURN,CNT
					 BEQ FINISH
					 
NEXT_S               
                     MOV NUM,SUM
					 MOV FLAG,#1
					 MOV SUM,#1
					 MOV A,#2
					 ADD CNT,#1
					 CMP CNT,#8
					 IT EQ
					 MOVEQ RETURN,#0
					 BEQ FINISH
					 B WHILE

                    
		   
		   
		   
FINISH		          MOV R0,RETURN
		   
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
;lowercase letter 97-122
;upper 65-90