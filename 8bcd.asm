.model small
.data
a db 29H ; 8-bit BCD number 1
b db 38H ; 8-bit BCD number 2
.code
mov ax, @data ; Initialize data section 
mov ds, ax
mov al, a ; Load number1 in al 
mov bl, b ; Load number2 in bl
add al, bl ; add lower two digits. Result in al
daa ; adjust result to valid bcd 
mov bh, al ; store result in bh 
mov al, ah ; al=ah as daa works on al only 
daa ; adjust result to valid BCD 
mov ch, 02h ; Count of digits to be displayed 
mov cl, 04h ; Count to roll by 4 bits cl, 04h
l2:
rol bh, cl ; roll bh so that msb comes to lsb 
mov dl, bh ; load dl with data to be displayed 
and dl, 0fH ; get only lsb dl, 0fH 
cmp dl, 09 ; check if digit is 0-9 or letter A-F 
jbe l4
add dl, 07 ; if letter add 37H else only add 
l4: add dl, 30H 
mov ah, 02 ; Function 2 under INT 21H (Display character)
int 21H
dec ch ; Decrement Count 
jnz l2
mov ah, 4ch ; Terminate Program
int 21h
end
