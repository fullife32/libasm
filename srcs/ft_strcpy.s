			global	ft_strcpy

			section	.text
ft_strcpy:
			mov		rcx, 0

cpy:
			mov		al, byte [rsi + rcx]
			mov		byte [rdi + rcx], al
			cmp		byte [rsi + rcx], 0
			je		done
			inc		rcx
			jne		cpy

done:
			mov		rax, rdi
			ret