org 100h   

mov ah, 0x7F
mov al, 0x7F

jmp start

equal:
    jmp end

start:
  cmp ah, al
  je equal

end:
    mov ah, 0
    int 16h
    ret