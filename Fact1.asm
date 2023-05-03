.model small

.data

a dw 05h

.code

main proc

mov ax,@data

mov ds,ax

mov ax,a

mov cl,04h

fact:dec a

mul a

dec cl

jnz fact

mov ch,04h

mov bx,ax

l2:rol bx,04h

mov dx,bx

and dx,0fh

cmp dx,09

jbe l4

add dx,07h

l4:add dx,30h

mov ah,02

int 21H

dec ch

jnz l2

mov ah,4ch

int 21H

main endp

end main
