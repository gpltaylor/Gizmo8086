
; Parse input and perform math operation
; Making the asumption that memory 200h has been populated with a range that 
; This will lexically process the input
; 1+2               
; 30h = 0, 39 = 9  
; 2B = +, 2D = -  
 
; DEBUG Start
; mov [200h], 9 ; 31h = 1d in ASCII
; mov [201h], 2Bh
; mov [202h], 1 ; 31h = 1d in ASCII
; Debug End

call parseInput
RET

parseInput PROC   
    mov al, [200h]
    mov bl, [201h]
    mov cl, [202h]
    
    ; TODO: Convert HEX to DEC
    
    cmp bl, 2Bh ; Add
    je lbCallAdder
    RET

lbCallAdder:
    add al, cl 
RET