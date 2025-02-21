global var4
extern arr ; указатель на 8 байт
extern N ;размер массива arr
extern RESULT ; данные по 64 бита
extern A
extern B
section .text
var4:
xor rcx,rcx
xor rbx,rbx
    while:
    cmp rcx,   qword [N]
    jge endwhile
    mov rax, [arr+rcx*8]
    inc rcx;
    cmp rax,qword [A]
    jge condition
back_condition:
    cmp rcx,  qword [N]
    jl while
    endwhile:
    mov rax, rbx
    mov [RESULT],rbx
    ret

    condition:
        cmp rax,qword [B]
        jg back_condition
        inc rbx
        jmp back_condition