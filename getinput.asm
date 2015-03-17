
; Get Input and store into mem using var1

org 100h

; Get input from keyboard
; character is stored in al
getInput PROC
MOV AX, 0B800h
mov	ah, 1h	
int	21h	; character input
ret