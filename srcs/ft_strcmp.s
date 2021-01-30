			global	ft_strcmp

			section	.text
ft_strcmp:
			xor		rcx, rcx					; Set the counter value to zero

cmp:
			mov		al, byte [rdi + rcx]		; Assign second string actual char to a temporary variable
			cmp		al, byte [rsi + rcx]		; Compare first and second string actual char to see if they're equal
			jne		done						; If they're not equal, jump to the done label
			cmp		al, 0						; Check if the string ends
			je		done						; Jump to the done label if the string ends
			inc		rcx							; Increment counter
			jne		cmp							; Loop while there is a difference or string ends

done:
			sub		al, byte [rsi + rcx]		; Substract the second string char to the first one
			movsx	eax, al						; Assign the difference value to a larger register to include the sign
			ret									; Return value