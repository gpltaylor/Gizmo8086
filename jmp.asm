
org 100h

; add your code here
   
jmp test1
   
HLT   
   
test1: 
mov al, 01h
ret

test2:
mov al, 02h
ret