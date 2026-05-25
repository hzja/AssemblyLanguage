; author:Byt3h
; referer:《汇编语言》王爽第四版
; usage:用于从零开始编写0号中断程序和触发

assume cs:code

code segment
start: mov ax,cs
	   mov ds,ax
	   mov si,offset do0                    ;设置ds:si指向源地址
	   mov ax,0
	   mov ex,ax
	   mov di,200h                           ;设置es:di指向目标地址
	   mov cx,offset do0end - offset do0     ;设置cx为传输长度
	   cld 									 ;设置传输方向为正
	   rep movsb
	   
	   mov ax,0
	   mov es,ax
	   mov word ptr es:[0*4],200h
	   mov word ptr es:[0*4+2],0              ;设置中断向量表
	   
	   int 0                                  ;触发0号中断，可用于验证本代码的功能是否正确
	   
	   mov ax,400ch
	   int 21h
	   
  do0: jmp short do0start                      ;这一段语句长度为2字节
   db: "divide error"						   ;定义显示的字符串

do0start: mov ax,cs 
		mov ds,ax
		mov si,202h                            ;设置ds:si指向字符串
		
		mov ax,0b800h
		mov es,ax
		mov di,12*160+36*2                      ;设置es:di指向显存空间中间位置
		
		mov cx,12                               ;设置cx为字符串长度
	s:  mov al,[si]
	    mov es:[di],al
		inc si
		add di,2
		loop s
		
		mov ax,4c00h
		int 21h
		
do0end: nop

code ends
end start
