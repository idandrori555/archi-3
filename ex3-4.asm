org 100h

table dw func1, func2, func3, func4

jmp start
      
start:
    mov si, 0x4
    
    dec si
    shl si, 1 ; valid index in table (even jumps, start: 0x0)
    jmp [table + si]

func1:
    PRINTN "Number One"
    jmp done
    
func2:
    PRINTN "Number Two"
    jmp done
        
func3:
    PRINTN "Number Three"
    jmp done
    
func4:
    PRINTN "Number Four"
    jmp done


done:
    xor ax, ax
    xor bx, bx
    int 16h
    ret
    
include magshimim.inc