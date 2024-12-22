    .section .data
msg: 
    .ascii "Hello, world!\n"       # Наша строка для вывода
    len = . - msg                  # Вычислим длину строки

    .section .text
    .global _start

_start:
    # Системный вызов write(fd=1, buf=msg, len)
    # Аргументы системных вызовов обычно передаются через регистры a0, a1, a2 ... 
    # В ABI для Linux на RISC-V:
    # a0 = аргумент 0, a1 = аргумент 1, a2 = аргумент 2, ...
    # syscall номер в a7

    li a0, 1          # fd = 1 (stdout)
    la a1, msg         # a1 = адрес сообщения
    li a2, len         # a2 = длина сообщения
    li a7, 64          # номер системного вызова write = 64 для Linux RISC-V
    ecall              # вызов системного вызова

    # Системный вызов exit(код_выхода=0)
    li a0, 0           # код выхода
    li a7, 93          # номер системного вызова exit = 93 для Linux RISC-V
    ecall
