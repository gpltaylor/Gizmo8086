
; Check to see if input is a numeric or Alpha Char

org 100h

mov ax, 24h

cmp ax, 30h
jle notAlphaNumeric
cmp ax, 39h
jge notAlphaNumeric

; If we got here then we have a number!
jmp gotNumber

RET

; Check if value is a [A-Za-z]
notAlphaNumeric:             
mov [400h], ax
RET

gotNumber:
mov [300h], ax
ret
