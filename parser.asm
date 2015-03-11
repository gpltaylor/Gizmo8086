
; Parse input will loop over the memory and segment the input into memory ranges
; 300h for numbers
; 320h for the operators
; For example the following will produce
; 20+6*25-1;  
; [300h]=4 (being the number of inputted numerics
; [301h]=20
; [302h]=6
; [303h]=25
; [304h]=1
; [320h]=+
; [321h]=*
; [322h]=- 
 
; DEBUG Start 
;org 100h
;mov [200h], 32h
;mov [201h], 30h
;mov [202h], 2Bh
;mov [203h], 32h
;mov [204h], 35h
;mov [205h], 2Ah
;mov [205h], 31h   
;mov [206h], 3Bh
;call parseInput
;RET
; Debug End

parseInput PROC   
mov bx, 200h
lblParseInput:
mov al, [bx]
inc bx
cmp al, 3Bh
jne lblParseInput    

; TODO: Check value and push into memory block
    
RET