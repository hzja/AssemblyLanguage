; author:Byt3h
; referer:《汇编语言》王爽第四版
;这里并未验证是否正确

assume cs:codesg

data segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	;以上是表示21年的21个字符串
	
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	;以上是表示21年公司总收入的21个dword型数据
	
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
	;以上是表示21年公司雇员人数的21个word型数据
data ends
	
table segment
	db 21 dup ('year sum ne ??')
table ends

codesg segment
	start:
		mov ax,data
		mov ds,ax

		mov ax,table
		mov es, ax

		mov bx,0
		mov idata,0
		mov si,0
		;设置寻址方式的初始参数
		
		mov di,0
		;设置寻址方式的初始参数
		
		mov cx,21
		;设置循环次数
	 
	 ;这里并未验证是否正确
	 s: mov es:[bx+idata+si],ds:[di*4]
		mov idata,5
		mov es:[bx+idata+si],ds:[56+di*8]
		mov si,0
		mov word ptr dx,es:[bx+idata+si]
		mov si,2
		mov word ptr ax,es:[bx+idata+si]
		mov si,0
		mov idata,A
		mov es:[bx+idata+si],ds:[A8+di*4]
		div word ptr es:[A]
		add bx,10
		inc di
		loop s
		
		mov ax,4c00H
		int 21H

codesg ends

end start
