
; Check to see if input is a numeric or Alpha Char

org 100h
var1 DW 200h  
newline Db 0Dh
tokens DW 300h
mov bx, tokens      
           
lbGetInput:
call getInput 

cmp al, newline
je returnVal


cmp al, 30h
jle notAlphaNumeric
cmp al, 3ah
jge notAlphaNumeric

; If we got here then we have a number!
jmp gotNumber

; TODO: Allow this to break out and return
jmp lbGetInput
RET
      

; Check if value is a [A-Za-z]
proc notAlphaNumeric
mov [bx+14h], al
inc bx
jmp lbGetInput 



proc gotNumber
mov [bx], al
inc bx
jmp lbGetInput        
    
; Return back to the return pointer within the stack
returnVal:
pop bx
jmp bx
                        
                        
include "../getInput.asm"