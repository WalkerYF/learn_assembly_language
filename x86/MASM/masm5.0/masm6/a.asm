; Paul Ingendorf
; 2003-05-13
; ASM TEST FILE
.MODEL        SMALL
.STACK        32
.DATA
     MESSAGE  DB        'THIS IS A TEST','$'
.CODE
       MAIN:
; INITIALIZE STACK
              MOV       AX, @DATA
              MOV       DS, AX
; BEGIN TEST OUTPUT
              MOV       AX,0600H    ; INIT CLEAR SCREEN
              MOV       BX,0700H    ; INIT NORMAL TEXT MODE
              MOV       CX,0000H    ; INIT ROW/COL
              MOV       DX,184FH    ; INIT
              INT       10H         ; CLEAR SCREEN

              MOV       AX,0200H    ; INIT CURSOR MOVE
              MOV       DX,0D20H    ; SET X/Y POS
              XOR       BX,BX       ; CLEAR BX
              INT       10H         ; EXECUTE CURSOR MOVE

              MOV       AX,0900H    ; SETUP FOR OUTPUT
              LEA       DX,MESSAGE  ; LOAD OUTPUT FOR DX
              INT       21H         ; OUTPUT ANSWER TO SCREEN IN DX
; RETURN TO DOS
              MOV       AX, 4C00H
              INT       21H
              END       MAIN
