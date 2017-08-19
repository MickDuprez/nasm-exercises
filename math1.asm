SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

Segment .data
	msg1 db 'Enter a digit ', 0xA, 0xD
	len1 equ $-msg1

	msg2 db 'Enter a second digit ', 0xA, 0xD
	len2 equ $-msg2

	msg3 db 'The sum is: '
	len3 equ $-msg3

segment .bss
	num1 resb 2
	num2 resb 2
	res resb 1

segment .text
global _start

_start:
	;print msg1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 80h

	;read input from user
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 80h
	
	;print msg2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 80h

	;read input again
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 80h

	;moving the first number to eax and second to ebx
	;and subtractin ascii '0' to convert to decimal
	mov eax, [num1]
	sub eax, '0'
	mov ebx, [num2]
	sub ebx, '0'

	add eax, ebx
	add eax, '0'		;convert from dec to ascii

	mov [res], eax		;store the result in mem location 'res'

	;print the sum blurb
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, len3
	int 80h

	;print the number of the sum
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 80h

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 80h

	
	
