global p_rax

section .data
save_rcx dq 0
minus db '-' 
buffer db '*'
temp_rax dq 0
ten dd 10 ;  делим число в аккумуляторе на десять
section .bss
buffer_rax resb 32
Fbuffer_rax resb 32
section .text
p_rax:
	mov [save_rcx], rcx
	mov [temp_rax], rax
	cmp rax, 0
	jl p_minus
back_minus:
	xor rdx,rdx
	xor r8,r8
	xor rcx, rcx
while:
	idiv  dword [ten]
	mov [temp_rax], rax
	call p_buffer_from_rdx
	mov rax, qword [temp_rax]
	cmp rax, 0
	jne while
	dec r8
endwhile:

	mov al, [buffer_rax +r8]
	mov [Fbuffer_rax+rcx], al
	inc rcx
	dec r8
	cmp r8,0
	jge endwhile
	endprintwhile:

	mov rsi, Fbuffer_rax
	mov rdx, rcx
	call stdout
	
	mov rcx,[save_rcx]
	ret ; возвращаемся в вызываемую процедуру
	
p_buffer_from_rdx:
	add rdx,48
	mov [buffer_rax+ r8],  dl
	xor rdx,rdx
	inc r8
	ret

p_minus: ; печатаем только один символ "-" 
	imul rax, -1
	mov [temp_rax], rax
	mov rsi, minus
	mov rdx, 1
	call stdout
	xor rdx,rdx
	mov rax, qword [temp_rax]
	jmp back_minus 

stdout:
	mov rdi, 1
	mov rax, 1
	syscall
	ret