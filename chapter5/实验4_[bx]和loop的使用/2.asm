; author:Byt3h
; referer:《汇编语言》王爽第四版

assume cs:code
code segment
    mov ax,0200H
    mov ds,ax
    mov bx,0

  s:mov [bx],bx
    inc bx
    loop s

    mov ax,4c00h
    int 21h
end code 
end

