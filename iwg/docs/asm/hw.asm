[BITS 32]

section .data:
    hello:      db `Hello, World!\n`  ; this time, don't need \0
    helloLen:   dd $-hello            ; string length

section .text:
    global _start
    
_start:                     ; not using C, use _start instead of main
    mov eax, 4              ; write() syscall number
    mov ebx, 1              ; fd (STDOUT_FILENO)
    mov ecx, hello          ; data (pointer) to write
    mov edx, [helloLen]     ; number of bytes to write
    int 0x80                ; call kernel
    mov eax, 1              ; exit() syscall number
    mov ebx, 0              ; return code (0)
    int 0x80                ; call kernel
                            ; NOTE: we cannot return from _start, must exit()
