org 100h
var1 DW 200h ; Input Data from command line
              
; Get input until the line terminator
call GetInputUntilBreak  
call parseInput         
                 
hlt
include "getInputUntilBreak.asm"                              
include "parser.asm"