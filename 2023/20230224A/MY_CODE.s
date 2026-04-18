A          RN 0
TEN        RN 1
Q          RN 2
BB         RN 3
TMP        RN 4
NUM        RN 5
DIG1       RN 6
DIG2       RN 7
DIG3       RN 8
DIG4       RN 9
C          RN 10

        AREA MYCODE, CODE, READONLY

KaprekarRoutine PROC
        EXPORT KaprekarRoutine
        PUSH {R4-R8,R10-R11,LR}

        MOV NUM, A
        LDR TEN, =10

        ; -------- ??????? ?????? --------

        UDIV Q, NUM, TEN
        MUL TMP, Q, TEN
        SUB DIG1, NUM, TMP

        MOV NUM, Q
        UDIV Q, NUM, TEN
        MUL TMP, Q, TEN
        SUB DIG2, NUM, TMP

        MOV NUM, Q
        UDIV Q, NUM, TEN
        MUL TMP, Q, TEN
        SUB DIG3, NUM, TMP

        MOV NUM, Q
        UDIV Q, NUM, TEN
        MUL TMP, Q, TEN
        SUB DIG4, NUM, TMP

        ; -------- ????????? ????? --------

        CMP DIG1, DIG2
        BGE SKIP1
        MOV TMP, DIG1
        MOV DIG1, DIG2
        MOV DIG2, TMP
SKIP1

        CMP DIG1, DIG3
        BGE SKIP2
        MOV TMP, DIG1
        MOV DIG1, DIG3
        MOV DIG3, TMP
SKIP2

        CMP DIG1, DIG4
        BGE SKIP3
        MOV TMP, DIG1
        MOV DIG1, DIG4
        MOV DIG4, TMP
SKIP3

        CMP DIG2, DIG3
        BGE SKIP4
        MOV TMP, DIG2
        MOV DIG2, DIG3
        MOV DIG3, TMP
SKIP4

        CMP DIG2, DIG4
        BGE SKIP5
        MOV TMP, DIG2
        MOV DIG2, DIG4
        MOV DIG4, TMP
SKIP5

        CMP DIG3, DIG4
        BGE SKIP6
        MOV TMP, DIG3
        MOV DIG3, DIG4
        MOV DIG4, TMP
SKIP6
       
	   MUL TMP,DIG1,TEN
	   ADD TMP,DIG2
	   MUL TMP,TEN
	   ADD TMP,DIG3
	   MUL TMP,TEN
	   ADD TMP,DIG4
	   MOV BB,TMP
	   
	    MUL TMP,DIG4,TEN
	   ADD TMP,DIG3
	   MUL TMP,TEN
	   ADD TMP,DIG2
	   MUL TMP,TEN
	   ADD TMP,DIG1
	   MOV C,TMP
	   
	   SUB TMP,BB,C
	   
	   MOV R0,TMP
	   

      

        POP {R4-R8,R10-R11,PC}
        ENDP

        END