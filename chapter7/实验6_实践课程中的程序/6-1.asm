; author:Byt3h
; referer:《汇编语言》王爽第四版

assume cs:codesg,ds:datasg

datasg segment
	db '1.display...'
	db '2.brows.....'
	db '3.replace...'
	db '4.modify....'
datasg ends

codesg segment
	start:
		mov ax,datasg
		mov ds,ax
		mov bx,0
		mov cx,4
		
	  s:mov di,0
		mov cx,5
		
	 s0:mov al,[bx+di+2]
	    and al,11011111B
		mov [bx+di+2],al
		inc di
		loop s0
		add bx,12
		loop s
		
		mov ax,4c00H
		int 21H
codesg ends

end start