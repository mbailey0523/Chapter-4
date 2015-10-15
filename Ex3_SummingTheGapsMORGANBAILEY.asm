; Exercise 1: Summing the gaps between array elements
; Write a program with a loop and indexed addressing that 
; calculates the sum of all the gaps between successive 
; array elements. The array elements are doublewords, 
; sequenced in nondecreasing order.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
dwarray dword  0,2,5,9,10
count EQU (LENGTHOF dwarray)

.code
main proc
	mov edi,OFFSET dwarray	; assign array's address to a register
	mov ecx,count			; initialize loop counter to length of array
	mov eax,0				; assign 0 to register that acumulates the sum
	L1:					; create a label to mark loop
		mov ebx,[edi] 			; subtract the current element from the next element
		sub ebx,[edi+4]	
		add eax,ebx			; place value into sum 
		add edi,TYPE dwarray	; point to the next element
		loop L1				; repeat until count is 0.
	invoke ExitProcess,0
main endp
end main
