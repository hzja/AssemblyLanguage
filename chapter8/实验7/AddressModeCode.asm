; author:Byt3h
; referer:《汇编语言》王爽第四版
;参考AI给出的答案，基本没啥问题

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

	mov bx,0	;行的基址
	mov si,0	;年份和总收入的基址
	mov di,0	;雇员的基址
	mov cx,21	;设置循环次数
 
 ;这里并未验证是否正确，这里的定义有点问题，有些地方
 s: 
	;复制年份
	mov ax,ds:[si+0]
	mov es:[bx+0],ax
	mov ax,ds:[si+2]
	mov es:[bx+2],ax
	
	;复制收入
	mov ax,ds:[si+84]
	mov es:[bx+5],ax
	mov ax,ds:[si+86]
	mov es:[bx+7],ax
	
	;复制雇员
	mov ax,ds:[si+168]
	mov es:[bx+0Ah],ax
	
	;求取人均收入
	mov dx,es:[bx+7]
	mov ax,es:[bx+5]
	div word ptr es:[bx+0Ah]
	mov es:[bx+0Dh],ax
	
	;改变基址，进入下一个循环
	add bx,16
	add si,4
	add di,2
	
	loop s
	
	mov ax,4c00H
	int 21H

codesg ends
end start
