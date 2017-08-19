section .data
	userMsg db 'Please enter a number: '
	lenUserMsg equ $-userMsg
	dispMsg db 'You have entered: '
	lenDispMsg equ $-dispMsg

section .bss			;unitialised data
	num resb 5

section .text
	global _start

_start:
	mov eax, 4		;User Promp
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 0x80

	;; Read and store user input
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5		;5 bytes
	int 0x80

	;; Output the msg
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 0x80

	;; Output the number entered
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h

	;; Exit
	mov eax, 1
	mov ebx, 0
	int 80h
	
	
