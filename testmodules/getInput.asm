
; Test GetInput to make sure memmory is working as expected

org 100h
var1 DW 200h
           
; Get input until ; is entered
lbGetInput:
call getInput 
cmp al, 3Bh
jne lbGetInput 
ret
   

include "../getInput.asm"