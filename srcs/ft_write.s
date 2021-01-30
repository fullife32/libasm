			global	ft_write
			extern	__errno_location

			section	.text
ft_write:
			xor		r8, r8					; 
			push	r8						; 

write_call:
			mov		rax, 1					; write register
			syscall							; 
			cmp		rax, 0					; 
			jl		error					; 
			pop		r8						; 
			ret								; 

error:
			neg		rax						; 
			mov		r8, rax					; 
			call	__errno_location		; 
			mov		[rax], r8				; memory
			pop		r8						; 
			mov		rax, -1					; 
			ret								; 