org 100h

mov ax, 0x5
mov bx, ax
dec bx

factorial_ax:
  cmp bx, 1
  je end

  mul bx
  dec bx
  jmp factorial_ax

end:
  mov ah, 0
  int 16h
  ret
