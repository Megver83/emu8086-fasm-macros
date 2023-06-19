include 'emu8086.inc'
org 100h

PRINT 'Enter a number: '
call SCAN_NUM
PRINTN ''

mov ax, cx        ; Load the number into the AX register
mov [num], ax     ; Save it in the 'num' variable

cmp ax, 1          ; Check if the number is less than or equal to 1
jbe false          ; If so, it's not prime, jump to "false"

dec cx            ; Decrement CX

check_prime:
    ; If CX = 1, that is, the dividend, it is prime
    cmp cx, 1
    je true

    mov dx, 0          ; Clear the DX register
    mov ax, [num]      ; Restore the number into AX
    div cx             ; Divide the number in AX by the divisor in CX

    cmp dx, 0          ; Check if the remainder is zero
    je false           ; If so, it's not prime, jump to "false"

    loop check_prime    ; Check again with the next divisor

true:
    PRINTN 'It is prime'
    jmp exit           ; Exit the program

false:
    PRINTN 'It is not prime'

exit:
    mov ah, 4Ch        ; Service function to terminate the program
    mov al, 0          ; Return code
    int 21h            ; Call DOS service to terminate

ret

num dw ?

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
