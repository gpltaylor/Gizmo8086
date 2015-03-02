; Is Integer

org 100h

var1 DW 200h
           
; Get input until ; is entered
lbGetInput:
call getInput 
cmp al, 3Bh
jne lbGetInput   

;call adder
call parseInput

; Show answer   
;mov bl, al ; backup answer so print line does not mess with it
;call printNewLine
mov ah, 0
call displayNumber
call printNewLine           

; reset mem
mov var1, 200h
jmp lbGetInput
hlt
            
; Get input from keyboard
getInput PROC
MOV AX, 0B800h
mov	ah, 1h	
int	21h	; character input
; character is stored in al

; Convert from ASCII to DEC
cmp al, 3Bh ; is ;
je return
                             
cmp al, 2bh ; is +
je addToMem

cmp al, 2dh ; is -
je addToMem                              

cmp al, 2fh
jle error

cmp al, 3Ah
je error 

call convertASCIIToDec
         
; TODO: Convert adding to memory to push onto the stack
addToMem:   
mov bx, var1
mov [bx], al
; Increment var so the next time we call we write to the next address up
inc var1
ret

error: 
    mov dx, offset EMSG
    mov ah, 9
    int 21h
hlt  

convertASCIIToDec proc
    sub al, 30h
RET

printNewLine proc 
    mov    dl, 10      ; LF
    mov    ah, 02h     ; display character function
    int    21h         ; displays converted input
        
    mov    dl, 13      ; CR
    mov    ah, 02h     ; display character function
    int    21h         ; displays converted input
RET 
    
; Print number at AX
displayNumber   proc       ;Beginning of procedure 
   MOV BX, 10     ;Initializes divisor
   MOV DX, 0000H    ;Clears DX
   MOV CX, 0000H    ;Clears CX
    
          ;Splitting process starts here
.Dloop1:  MOV DX, 0000H    ;Clears DX during jump
   div BX      ;Divides AX by BX
   PUSH DX     ;Pushes DX(remainder) to stack
   INC CX      ;Increments counter to track the number of digits
   CMP AX, 0     ;Checks if there is still something in AX to divide
   JNE .Dloop1     ;Jumps if AX is not zero
    
.Dloop2:  POP DX      ;Pops from stack to DX
   ADD DX, 30H     ;Converts to it's ASCII equivalent
   MOV AH, 02H     
   INT 21H      ;calls DOS to display character
   LOOP .Dloop2    ;Loops till CX equals zero
   RET       ;returns control
displayNumber  ENDP

return:
RET    
     
EMSG    dw  " Syntax Error ", '$'
MSG1    dw  " Answer: ", '$'        

include "adder.asm"  
include "parser.asm" 