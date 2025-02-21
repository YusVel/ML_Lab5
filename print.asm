global print ; эта функция написана по причине того, что стандартная функция 
					; printf() работала у меня неправильно: текст выводился в консоль после запроса ввода данных
extern p_rax
extern p_xmm0
section .bss
char_msg resq 1
arg1 resq 1
arg2 resq 1
arg3 resq 1
arg4 resq 1
arg5 resq 1

arg0_d resq 1
arg1_d resq 1
arg2_d resq 1
arg3_d resq 1
arg4_d resq 1

num_arg resq 1
num_arg_d resq 1
section .data


section .text
print:
	mov [char_msg], rdi
	mov [arg1], rsi
	mov [arg2], rdx
	mov [arg3], rcx
	mov [arg4], r8
	mov [arg5], r9

	movq [arg0_d], xmm0
	movq [arg1_d], xmm1
	movq [arg2_d], xmm2
	movq [arg3_d], xmm3
	movq [arg4_d], xmm4

	mov qword [num_arg_d], qword 1;
	mov qword [num_arg], qword 1;
	xor rbx,rbx ; счесчик символов в строке, включая %
	while:
	cmp qword [num_arg], 5
	jg endwhile
	cmp qword [num_arg_d], 5
	jg endwhile

	mov rax,  [char_msg]
	add rax, rbx

	cmp [rax],  byte 0 ; провекряе есть ли терминатор сивол 0 в аски
	je endwhile
	
	cmp [rax],  byte 37 ; провекряе есть ли символ %, если есто то идем в обработчик
	je handler_num

	mov rsi, rax
	mov rdx, 1
	call stdout
	inc rbx
	jmp while
	
	endwhile:
	mov rax, rbx
	ret
	
	stdout:
	mov rdi, 1
	mov rax, 1
	syscall
	ret

	handler_num:
		inc rbx 
		mov rax,  [char_msg]
		add rax, rbx
		cmp [rax], byte 100
		je p_d
	

		cmp [rax], byte 102
		je p_f

		jmp while

			p_d:
			mov rcx, [num_arg]
			mov rax, [char_msg +rcx*8]
			call p_rax
			inc qword [num_arg]
			inc rbx
			jmp while
			
			p_f:
			mov rcx, [num_arg_d]
			movq xmm0, [arg5 +rcx*8]
			call p_xmm0
			inc qword [num_arg_d]
			inc rbx
			jmp while
