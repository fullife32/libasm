			global	ft_strlen

			section	.text
ft_strlen:
			mov		rcx, 0

count:
			cmp		byte [rdi + rcx], 0
			je		done
			inc		rcx
			jne		count

done:
			mov		rax, rcx
			ret