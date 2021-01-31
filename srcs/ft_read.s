			global	ft_read
			extern	__errno_location

			section	.text
ft_read:
			xor		r8, r8							; 
			push	r8								; 

read_call:
			mov		rax, 0							; read register
			syscall									; 
			cmp		rax, 0							; 
			jl		error							; 
			pop		r8								; 
			ret										; 

error:
			neg		rax								; 
			mov		r8, rax							; 
			call	__errno_location wrt ..plt		; dependancies
			mov		[rax], r8						; memory
			pop		r8								; 
			mov		rax, -1							; 
			ret										; 