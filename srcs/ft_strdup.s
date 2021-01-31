			global	ft_strdup
			extern	ft_strcpy
			extern	ft_strlen
			extern	malloc

			section	.text
ft_strdup:
			push	rdi
			call	ft_strlen						; 
			inc		rax								; 
			mov		rdi, rax
			call	malloc wrt ..plt							; 
			pop		rsi
			cmp		rax, 0							; 
			je		error							; 
			mov		rdi, rax						; 
			call	ft_strcpy						; 

error:
			ret										; 