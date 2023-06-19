include 'emu8086.inc'
org 100h

PRINT 'Sequence numbers: '
CALL SCAN_NUM
PRINTN ''

; If the number is less than 1, exit
cmp cx, 1
jb fail

; Print the first number
mov ax, [fibonacci]
CALL PRINT_NUM
PRINT ' '
dec cx

; If the number is 1, end here
je exit

; If not, check if it's 2
cmp cx, 2

; Print the second number
mov ax, [fibonacci+2]
CALL PRINT_NUM
PRINT ' '
dec cx

; If it was 2, end here, otherwise continue
je exit

jmp fibonacci_loop

fail:
    PRINT 'Invalid input number, minimum is 1'
    jmp exit

fibonacci_loop:
    mov bx, [fibonacci+2]   ; Load the last generated number
    add bx, [fibonacci]     ; Add the previous number to it
    mov [fibonacci+4], bx   ; Save the result in the next position

    ; Print the generated Fibonacci number
    mov ax, bx              ; Move the number to print into ax
    CALL PRINT_NUM
    PRINT ' '

    mov ax, [fibonacci+2]   ; Move the last generated number to the previous position
    mov [fibonacci], ax

    mov ax, bx              ; Move the result to the current position
    mov [fibonacci+2], ax

    loop fibonacci_loop     ; Repeat until generating all numbers

exit:
    mov ah, 4Ch        ; Service function to terminate the program
    mov al, 0          ; Return code
    int 21h            ; Call DOS service to terminate
ret

fibonacci dw 0, 1

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
