.global _start # Указать стартовый адрес программы редактору связей

_start:
    ## Загрузка числа -0x6789ABCDEF 9
    #addi x5, x0, 0x678
    #slli x5, x5, 8
    #addi x5, x5, 0x9A
    #slli x5, x5, 8
    #addi x5, x5, 0xBC
    #slli x5, x5, 8
    #addi x5, x5, 0xDE
    #slli x5, x5, 4
    #addi x5, x5, 0xF

    ## Загрузка числа -0x6789ABCDEF 7
    #lui x5, 0x6789A
    #srl x5, x5, 4
    #addi x5, x5, 0xBC
    #slli x5, x5, 8
    #addi x5, x5, 0xDE
    #slli x5, x5, 4
    #addi x5, x5, 0xF

    # Загрузка числа -0x6789ABCDEF 6
    lui x5, 0x6789A #0x6789A000
    slli x5, x5, 8
    lui x6, 0xBCDE #0xBCDE000
    srl x6, x6, 8
    add x5, x5, x6
    addi x5, x5, 0xF

    # Делаем число отрицательным
    xori x5, x5, -1         # Инвертировать все биты: ~0x6789ABCDEF
    addi x5, x5, 1          # Прибавить 1: -0x6789ABCDEF

    # Загрузка числа 0x1234567890ABCDEF 9
    lui x6, 0x12345 #0x12345000
    slli x6, x6, 32 #0x1234500000
    lui x7, 0x06789 #0x6789000
    addi x7, x7, 0xAB #0x67890AB
    slli x7, x7, 8
    addi x7, x7, 0xCD #0x67890ABCD
    slli x7, x7, 8
    addi x7, x7, 0xEF #0x67890ABEF
    add x6, x6, x7

    add x5, x5, x6

    # Завершение программы
    mv a0, x0                 # Возвращаемое значение = 0
    li a7, 93                 # Код системы "exit"
    ecall