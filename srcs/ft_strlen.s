			global	ft_strlen

			section	.text
ft_strlen:
			xor		rcx, rcx				; Set the counter to zero

count:
			cmp		byte [rdi + rcx], 0		; Check if the string ends
			je		done					; Jump to the done label when the string ends
			inc		rcx						; Increment counter
			jne		count					; Loop until the end of the string

done:
			mov		rax, rcx				; Assign the counter to the return value
			ret								; Return value