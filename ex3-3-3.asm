org 100h 

arr db 100 dup(0)
size db 10
row db 0
col db 0

fill_rows:
    mov al, [row]
    cmp al, [size]
    jge done_fill
    mov col, 0 

fill_cols:
    mov bl, [col]
    cmp bl, [row]
    jg next_fill_row

    ; row * size + col
    mov al, [row]
    xor ah, ah
    mov cl, [size]
    mul cl
    xor bx, bx
    mov bl, [col]
    add ax, bx
    mov di, ax

    cmp bl, 0           ; L corner
    je set_one

    cmp bl, [row]       ; R corner
    je set_one

    ; else curr = R above + L above
    mov al, [arr + di - 10 - 1]   ; L above
    add al, [arr + di - 10]       ; R above
    mov [arr + di], al
    jmp next_fill_col

set_one:
    mov [arr + di], 1 

next_fill_col:
    inc col
    jmp fill_cols 

next_fill_row:
    inc row
    jmp fill_rows

done_fill:
mov row, 0

print_rows:
    mov al, [row]
    cmp al, [size]
    jge end
    mov col, 0

print_cols:
    mov bl, [col]
    cmp bl, [row]
    jg next_print_row

    ; row * size + col
    mov al, [row]
    xor ah, ah
    mov cl, [size]
    mul cl
    xor bx, bx
    mov bl, [col]
    add ax, bx
    mov di, ax
    mov al, [arr + di]
    xor ah, ah
    call PRINT_NUM_UNS
    PRINT " "

    inc col
    jmp print_cols

next_print_row:
    PRINTN ""
    inc row
    jmp print_rows

end:
    mov ah, 0
    int 16h
    ret

include magshimim.inc
