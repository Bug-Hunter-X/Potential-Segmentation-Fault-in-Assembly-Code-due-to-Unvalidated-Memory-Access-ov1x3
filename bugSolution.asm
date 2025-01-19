section .data
    array times 10 dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ; Example array

section .bss
    array_size resd 1

section .text
    global _start

_start:
    mov dword [array_size], 10 ; Store array size
    mov ecx, 2 ; Example index 
    mov ebx, array ; Load array base address

    ; Bound checking
    cmp ecx, [array_size] ; Check if index is within bounds
    jge error_handler ; Handle out-of-bounds error
    cmp ecx, 0 ; Check if index is less than zero 
    jl error_handler
    mov eax, [ebx + ecx*4 + 0x0] ; Accessing element after bounds checking, changed offset to 0x0 for demonstration

    ; ... further code using eax ...
    jmp exit_program

error_handler:
    ; Handle error (e.g., exit with an error code)
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

exit_program:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80