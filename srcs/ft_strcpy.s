			global	ft_strcpy

			section	.text
ft_strcpy:
			xor		rcx, rcx					; Set the counter value to zero

cpy:
			mov		al, byte [rsi + rcx]		; Assign the actual source char to a temporary variable
			mov		byte [rdi + rcx], al		; Copy the char to the destination string
			cmp		byte [rsi + rcx], 0			; Check if the source string ends
			je		done						; Jump to the done label if the source string ends
			inc		rcx							; Increment counter
			jne		cpy							; Loop while the source string is entirely copied

done:
			mov		rax, rdi					; Assign the destination string to the return value
			ret									; Return value