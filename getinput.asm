
org 100h

var1 DW 200h
           
; keyboard input subprogram
call getInput 
call getInput 
call getInput  

hlt
            
; Get input from keyboard
getInput PROC
MOV AX, 0B800h
mov	ah, 1h	
int	21h	; character input
; character is stored in al
          
; copy character from al memory address var1  
mov bx, var1
mov [bx], al
; Increment var so the next time we call we write to the next address up
inc var1
ret

hlt