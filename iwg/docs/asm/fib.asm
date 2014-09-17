BITS 32

section .data:

instr: db `%d\0`
outstr: db `%d\t%d\n\0`

section .text:

extern printf
extern scanf

global fib
fib:
    push ebp
    mov ebp, esp
    push ebx           ; ebx is callee saved
    mov edx, [ebp+0x8] ; nth number
    mov ebx, 0         ; previous fibonacci number
    mov eax, 1         ; current fibonacci number
                       ; ecx is our temporary
loop:
    test edx, edx
    jz end
    mov ecx, ebx
    mov ebx, eax
    add eax, ecx
    dec edx
    jmp loop
end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

global fib_r
fib_r:
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, [ebp+0x8]
    cmp ebx, 1
    jg calc
    mov eax, 1
    jmp done
calc:
    dec ebx
    push ebx
    call fib_r
    add esp,4
    push eax
    dec ebx
    push ebx
    call fib_r
    add esp,4
    pop ebx
    add eax, ebx
done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

global main
main:
    push ebp
    mov ebp,esp
    sub esp,4           ; alloc one local variable
    lea eax,[ebp-4]
    push eax            ; push address of local variable
    push instr
    call scanf
    add esp,8
    mov eax,[ebp-4]
    push eax
    call fib
    add esp,4
    push eax
    mov eax,[ebp-4]
    push eax
    call fib_r
    add esp,4
    push eax
    push outstr
    call printf
    xor eax,eax
    mov esp,ebp
    pop ebp
    ret

