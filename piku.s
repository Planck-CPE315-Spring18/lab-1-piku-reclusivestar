    .syntax unified

    @ --------------------------------
    .global main
main:
    @ Stack the return address (lr) in addition to a dummy register (ip) to
    @ keep the stack 8-byte aligned.
    push    {ip, lr}
    @ Load the argument and perform the call. This is like 'printf("...")' in C.
    ldr r0, =first
    bl printf
    ldr r0, =second
    bl printf
    ldr r0, =third
    bl printf
    @ Exit from 'main'. This is like 'return 0' in C.
    mov     r0, #0      @ Return 0.
    @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
    @ value directly into pc — the Program Counter — to return.
    pop     {ip, pc}

    @ --------------------------------
    @ Data for the printf call. The GNU assembler's ".asciz" directive
    @ automatically adds a NULL character termination.
first:
    .asciz  "From the hot oven\n"
second:
    .asciz "A masterpiece delicious\n"
third:    
    .asciz "Can only be pi.\n"
