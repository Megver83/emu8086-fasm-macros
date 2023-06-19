include 'emu8086.inc'
org 100h

PRINT 'Length of the prime number sequence: '
call SCAN_NUM
PRINTN ''

mov [primes_length], cx
cmp [primes_length], 1
jb fail

print_primes:
    mov cx, [actual_num]
    dec cx

check_prime:
    ; If CX = 1, i.e., the dividend, it is prime
    cmp cx, 1
    je true

    mov dx, 0                 ; Clear the DX register
    mov ax, [actual_num]      ; Restore the current number into AX
    div cx                    ; Divide the number in AX by the divisor in CX

    cmp dx, 0          ; Check if the remainder is zero
    je next            ; If so, it's not prime, move to the next number

    loop check_prime    ; Check again with the next divisor

true:
    ; Print the number
    mov ax, [actual_num]
    call PRINT_NUM
    PRINT ' '

    ; Counter
    inc [counter]

next:
    mov ax, [counter]        ; Load the value of [counter] into the AX register
    mov bx, [primes_length]  ; Load the value of [primes_length] into the BX register

    cmp ax, bx               ; Compare the values in the AX and BX registers

    ; If we have reached the sequence length, exit
    je exit

    ; Increment the current number
    inc [actual_num]

    ; else, print the next one
    jmp print_primes

fail:
    PRINT 'Invalid input number, minimum is 1'

exit:
    mov ah, 4Ch        ; Service function to terminate the program
    mov al, 0          ; Return code
    int 21h            ; Call DOS service to terminate

ret

actual_num dw 2        ; Current number being evaluated, starting at 2
primes_length dw ?     ; Length of the sequence
counter dw 0           ; Keeps track of the displayed prime numbers

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
