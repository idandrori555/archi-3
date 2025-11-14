org 100

mov ax, 0x1
xor bx, bx ; counter

jmp count_bits_ax

count_bits_ax:
    cmp ax, 0
    jl count_bits_ax
    
    shr ax, 1
    inc bx
    
print:
    mov ax, bx ; move bit count   
    call print_num
    
mov ah, 0
int 16h
ret
      
include magshimim.inc