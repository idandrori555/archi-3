org 100h   

mov ah, 0x7F
mov al, 0x80

jmp start

signed_bigger:
  jmp end

unsigned_bigger:
  jmp end

start:
  cmp ah, al

  ja unsigned_bigger
  jg signed_bigger

end:
    mov ah, 0
    int 16h
    ret
