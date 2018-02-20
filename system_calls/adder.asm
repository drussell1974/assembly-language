section .data					; Data segment
	userMsg db 'Please enter a number: '	; Ask the user for a number
	lenUserMsg equ 23		; Length of the message
	userMsg2 db 'Please enter another number: ' ; Ask the user for another number	
	lenUserMsg2 equ 29		; Length of the message

	dispMsg db 'The numbers added together are: '
	lenDispMsg equ 30
	total equ 4
section .bss					; uninitialised data
	num resb 5
	num2 resb 6

section .text
	global _start

_start:
	; User prompt for first number
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 0x80

	; Read and store the first number
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 0x80

	; User prompt for second number
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg2
	mov edx, lenUserMsg2
	int 0x80

	; Read and stor the second number
	mov eax, 3
	mov ebx, 2
	mov ecx, num2
	mov edx, 5				; 5 bytes (numeric 1 for sign) of that information
	int 0x80


	; add the numbers together
	mov eax, [num]
	mov ebx, [num2]
	add eax, ebx
	
	; Output message 'The entered number is: '
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h

	; Output the number entered
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h

	; Exit code
	mov eax, 1
	mov ebx, 0
	int 80h
