; Working with String
; This stored some vars (at the bottom) and gets the string length
; we then print the length with the message

org 100h     
              
mov dx, offset TheLenghIsMSG
call PrintString   

mov di, offset welcome
call StringLen
       
mov ax, cx
call displayNumber     

; End
hlt

; Get the Length of a string at the given buffer pointer (di). 
; Answer goes into cx
proc StringLen
mov ax, '$'
mov cx, 255
repnz scasb
sub di, offset welcome
mov cx, di
RET
      
; Print the String stored at pointer dx      
proc PrintString
    mov ah,09      
    int 21h
RET 
   
; Print an int stored in dx 
proc PrintInt  
    MOV AH,2 
    int 21h
RET
          
; Display number at AX
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

buffer DB 'hello world', '$'            

welcome DB 'Welcome to the Real World', '$'  

TheLenghIsMSG DB 'Length is:', '$'