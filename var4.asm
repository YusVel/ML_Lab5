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
    je endwhile
    mov rax, [arr+rcx]
    inc rcx;
    cmp rax,qword [A]
    jge condition

    cmp rcx,  qword [N]
    jl while
    endwhile:
    mov rax, rbx
    mov [RESULT],rbx
    ret

    condition:
        inc rcx
        cmp rax,qword [B]
        jge while
        inc rbx
        jmp while