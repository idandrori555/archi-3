org 100h

mov ax, 0x5
mov bx, ax
dec bx ; bx = ax - 1

factorial_ax:
  cmp bx, 1
  je end

  mul bx
  dec bx
  jmp factorial_ax

end:
  call print_num

  mov ah, 0
  int 16h
  ret

include magshimim.inc