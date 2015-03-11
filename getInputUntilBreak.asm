
; GetInput until terminated using ';' to make sure memmory is working as expected 
; This might get updated so that it terminated when a new line:run is found.
;org 100h
;var1 DW 200h
           
; Get input until ; is entered  
GetInputUntilBreak PROC 
lbGetInputUntilBreak:
call getInput 
cmp al, 3Bh
jne lbGetInputUntilBreak 
ret
   

include "getInput.asm"