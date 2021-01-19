			global	ft_strcmp

			section	.text
ft_strcmp:
			mov		rcx, 0
			mov		al, 0

cmp:
			cmp		byte [rdi + rcx], 0
			je		done
			mov		al, byte [rsi + rcx]
			cmp		byte [rdi + rcx], al
			jne		done
			inc		rcx
			je		cmp

done:
			sub		byte [rdi + rcx], al
			mov		al, byte [rdi + rcx]
			ret