
org 100h

; add your code here

ret
   
mov al, 00h
call adder
call adder
   

adder PROC
inc al
ret