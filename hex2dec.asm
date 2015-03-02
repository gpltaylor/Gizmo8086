
; Converts Input from ASCII to Decimal
org 100h     

  call main
       
ret    

main PROC   
; print user prompt  
     mov    dx, offset MSG1
     mov    ah, 09h     ; display string function
     int    21h     ; display it
     jmp    userin      ; jumps to user input so if illegal character is entered message won't display again
     RET
       
userin:
; input a hexidecimal number then compare to ASCII codes
     mov    ah, 01h     ; keyboard input function
     int    21h     ; character input, copies character into al
     mov    bh, al      ; moves al into bh to avoid al being messed with
     cmp    bh, 30h     ; compares input to ASCII code for 0
      jl    error       ; if input is less than 0 jump to main
     cmp    bh, 39h     ; compares input to ASCII code for 9
     jle    print1      ; if input is less than or equal to 9 jump to print
     cmp    bh, 41h     ; compares input to ASCII code for 'A'
      jl    error       ; if input is less than 'A' jump to main
     cmp    bh, 46h     ; compares input to ASCII code for 'F'
     jle    convert1    ; if input is less than or equal to 'F' jump to convert1
     cmp    bh, 61h     ; compares input to ASCII code for 'a'
      jl    error       ; if input is less than 'a' jump to main
     cmp    bh, 66h     ; compares input to ASCII code for 'f'
     jle    convert2    ; if input is less than of equal to 'f' jump to convert2
      jg    error       ; if input is greater than 'z' jump to main


  error:
; displays error message then jumps back
    mov dx, offset EMSG
    mov ah, 9
    int 21h
    jmp    userin 
     
convert1:
; converts input from hexadecimal A-F to decimal
     sub    bh, 17      ; subtracts 0Fh from input to get decimal
     jmp    print2      ; jumps to print

convert2:
; converts input from hexidecimal a-f to decimal
     sub    bh, 49      ; subtracts 30h from the input to get 
     jmp    print2      ; jumps to print

print1:
; prints the input in decimal form
     mov    dx, offset MSG2    ; moves MSG2 into display string register
     mov    ah, 09h     ; display string function
     int    21h     ; display MSG2 "In decimal it is:"
     mov    dl, bh      ; moves input into display character register
     mov    ah, 02h     ; display character function
     int    21h     ; display input in decimal form
     jmp    again       ; jumps to again

print2:
;prints the input in decimal form
     mov    dx, offset MSG2    ; moves MSG2 into display string register
     mov    ah, 09h     ; display string function
     int    21h         ; display MSG2 "In decimal it is:"
     mov    dl, 49      ; will add 10 to the converted ASCII code
     mov    ah, 02h     ; display character function
     int    21h         ; display 1 in front of input in decimal form
     mov    dl, bh      ; moves converted input to display character register
     mov    ah, 02h     ; display character function
     int    21h         ; displays converted input
     jmp    again       ; jumps to again

again:
; asks if user wants to do it again
     mov    dx, offset MSG3    ; moves MSG2 into display string register
     mov    ah, 09h     ; display string function
     int    21h     ; display MSG3 "Do you want to do it again?"
     mov    ah, 01h     ; keyboard input function
     int    21h     ; character input, copies into al
     cmp    al, 59h     ; compares input to ASCII code for 'Y'
      je    main        ; if input is equal to 'Y' jump to main
      jl    exit        ; if input is less than 'Y' jump to exit
     cmp    al, 79h     ; compares input to ASCII code for 'y'
      je    main        ; if input is equal to 'y' jump to main 
     jne    exit        ; if input is not equal to 'y' jump to exit     
     
exit: 
    hlt 
    
    MSG1    dw  " Enter a hexadecimal digit ", '$'
    MSG2    dw  " In decimal it is: ", '$'
    MSG3    dw  " Do you want to do it again? ", '$'
    EMSG    dw  " Illegal character, enter 0..9 or A..F: ", '$'        