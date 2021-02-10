			global	ft_read
			extern	__errno_location

			section	.text
ft_read:
			push	r8								; Push register 8 to keep the original value unchanged

read_call:
			mov		rax, 0							; Read register, the file descriptor is set at rdi, the buffer is set at rsi and the count is set at rcx
			syscall									; Call system to execute the read function
			cmp		rax, 0							; Check if the read function performed correctly
			jl		error							; If not, jump to the error label
			pop		r8								; Set r8 to its original value
			ret										; Return value

error:
			neg		rax								; Set the return of the read function to its absolute value
			mov		r8, rax							; Keep the value of rax in a temporary variable
			call	__errno_location wrt ..plt		; Call errno to set the error
			mov		[rax], r8						; Move back the value of rax in 1 byte
			pop		r8								; Set the return value to -1 to indicate an error
			mov		rax, -1							; Set r8 to its original value
			ret										; Return value