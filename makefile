all:
	nasm -f elf64 -F dwarf print.asm -o print.o
	nasm -f elf64 -F dwarf print_rax.asm -o print_rax.o
	nasm -f elf64 -F dwarf print_xmm0.asm -o print_xmm0.o
	nasm -f elf64 -F dwarf get_valid_num.asm -o get_valid_num.o
	nasm -f elf64 -F dwarf var4.asm -o var4.o
	gcc -ggdb -c main.c -o main.o 
	gcc -g3 main.o print.o print_rax.o print_xmm0.o get_valid_num.o var4.o -o main -no-pie
	gdb ./main