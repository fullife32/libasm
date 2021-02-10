			global	ft_write
			extern	__errno_location

			section	.text
ft_write:
			push	r8								; Push register 8 to keep the original value unchanged

write_call:
			mov		rax, 1							; Write register, the string to write is already set at rdi
			syscall									; Call system to execute the write function
			cmp		rax, 0							; Check if the write function performed correctly
			jl		error							; If not, jump to the error label
			pop		r8								; Set r8 to its original value
			ret										; Return value

error:
			neg		rax								; Set the return of the write function to its absolute value
			mov		r8, rax							; Keep the value of rax in a temporary variable
			call	__errno_location wrt ..plt		; Call errno to set the error
			mov		[rax], r8						; Move back the value of rax in 1 byte
			mov		rax, -1							; Set the return value to -1 to indicate an error
			pop		r8								; Set r8 to its original value
			ret										; Return value