Велиметов Юсуп Касумович, лабораторная работа 5, вариант 4.
Программа состоит из нескольких модулей-файлов:
1) main.c - точка входа, здесь описана  main - функция 
2) get_valid_num.asm - функция ввода валидного значения числа с предварительным указанием отрезка [edge1,edge2]!!!! edge2>=edge1
3) var4.asm - функция для заданного алгоритма по варианту 4
4) print.asm - функция аналог си - функции printf(). Печатает в консоль текст с учетом управляющих символов:
%d - печать целочисленного значения 64 бита, %f - печать числа с плавующей точкой двойной точности. Максиальное количество передаваеых аргуентов в функцию 10: 5 - целых и 5 с плавующей точкой
("Выше указанная функция - моя попытка создать "велосипед", сделана исключительно для учебных целей и решения проблемы с буферизированной печатью текста в консоль. Хотя данную проблему ожно решить и с помощью классических функция.)
5) print_rax.asm 
6) print_xmm0.asm - функции для вывода результатов: первая для печати в консоль числа в регистре RAX, вторая для регистра хмм0 ( для чисел с плавующей точкой). Используется округление до сотых. (SSE -инчтрукции)
7) makefile
Функции 3 и 4 успешно интегрированы из лабораторной работы 2 согласно заданию. 
На этапе ввода данных осуществляется контроль: 
- ввод только целых числел
- ввод чисел из отрезка [edge1,edge2]!!!! edge2>=edge1
- исключение деления на ноль.
Запуск программы осуществляется на Linux (процессор x64 intel):
./main 



