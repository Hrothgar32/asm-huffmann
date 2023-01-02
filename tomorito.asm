;; Zediu Álmos-Ágoston, zaim2103, 534

%include 'util.inc'
%include 'io.inc'

global main

section .text

main:
    push ebp
    mov ebp, esp
    sub esp, 4
;;; Opening file
    mov eax, read_prompt
    call io_writestr
    mov eax, filename
    call io_readstr
    mov ebx, 0
    call fio_open

;;; Reading in 1 byte of data from file
    mov ebx, esp
    mov ecx, 1
    call fio_read

;;; Closing the file
    call fio_close

.end:
    mov esp, ebp
    pop ebp
    ret

section .data
    read_prompt db "Enter name of the file: ", 0

section .bss
    filename: resb 256
