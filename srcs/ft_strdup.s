			global	ft_strdup
			extern	ft_strlen
			extern	malloc
			extern	ft_strcpy

			section	.text
ft_strdup:
			push	rdi						; Push rdi to keep the original string unchanged

			call	ft_strlen				; Call ft_strlen function to get the len of the string
			mov		rdi, rax				; Move the len of the string to rdi
			call	malloc wrt ..plt		; Call malloc function
			pop		rsi						; Pop rsi to recover the string to duplicate
			cmp		rax, 0					; Check if the malloc function performed correctly
			je		error					; If not, jump to the error label
			mov		rdi, rax				; Move the allocated string to rdi
			call	ft_strcpy				; Duplicate the string from rsi to rdi

error:
			ret								; Return the duplicated string