ROW        RN  0
COL        RN  1
MAZE       RN  2
PATH       RN  3
I          RN  4
CUR        RN  5
V          RN  6
J          RN  7
NEI        RN  8
P_I        RN  10
N          RN  11

           AREA MYCODE,CODE,READONLY

exploreMaze PROC
            EXPORT exploreMaze
            PUSH {R4-R8,R10-R11,LR}

            ; start index = (1,1) = COL + 1
            ADD I, COL, #1

            ; path index = 0
            MOV P_I, #0

            ; visited char
            MOV V, #'V'

            ; final index = (ROW-2)*COL + (COL-2)
            SUB N, ROW, #2
            MUL N, N, COL
            ADD N, N, COL
            SUB N, N, #2

MAIN_LOOP
            ; if current == final position -> return 1
            CMP I, N
            BEQ FOUND

            ; mark current cell as visited
            STRB V, [MAZE, I]

            ; -------- RIGHT --------
IF_RIGHT    ADD J, I, #1
            LDRB NEI, [MAZE, J]
            CMP NEI, #'X'
            BEQ ELSE_LEFT
            CMP NEI, #'V'
            BEQ ELSE_LEFT
            STRB I, [PATH, P_I]
            ADD P_I, P_I, #1
            MOV I, J
            B MAIN_LOOP

            ; -------- LEFT --------
ELSE_LEFT   SUB J, I, #1
            LDRB NEI, [MAZE, J]
            CMP NEI, #'X'
            BEQ ELSE_TOP
            CMP NEI, #'V'
            BEQ ELSE_TOP
            STRB I, [PATH, P_I]
            ADD P_I, P_I, #1
            MOV I, J
            B MAIN_LOOP

            ; -------- TOP --------
ELSE_TOP    SUB J, I, COL
            LDRB NEI, [MAZE, J]
            CMP NEI, #'X'
            BEQ ELSE_BOTTOM
            CMP NEI, #'V'
            BEQ ELSE_BOTTOM
            STRB I, [PATH, P_I]
            ADD P_I, P_I, #1
            MOV I, J
            B MAIN_LOOP

            ; -------- BOTTOM --------
ELSE_BOTTOM ADD J, I, COL
            LDRB NEI, [MAZE, J]
            CMP NEI, #'X'
            BEQ BACKTRACK
            CMP NEI, #'V'
            BEQ BACKTRACK
            STRB I, [PATH, P_I]
            ADD P_I, P_I, #1
            MOV I, J
            B MAIN_LOOP

            ; -------- no movement possible -> backtrack --------
BACKTRACK
            CMP P_I, #0
            BEQ NO_PATH

            SUB P_I, P_I, #1
            LDRB I, [PATH, P_I]

            MOV CUR, #0
            STRB CUR, [PATH, P_I]

            B MAIN_LOOP

FOUND
            MOV R0, #1
            POP {R4-R8,R10-R11,PC}

NO_PATH
            MOV R0, #0
            POP {R4-R8,R10-R11,PC}

            ENDP
            END