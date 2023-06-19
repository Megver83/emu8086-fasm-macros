; The largest factorial that can be calculated in the 16-bit 8086 processor depends
; on the size of the registers and the available memory. In the 8086 processor, the
; general-purpose registers like AX, BX, CX, DX are 16 bits in size, allowing them
; to represent values up to a maximum of 65535 (2^16 - 1). Without using special
; techniques or algorithms to handle larger numbers, the largest factorial that
; can be calculated is 15! (15 factorial). To be more precise, 15! is approximately
; 1.3 trillion. If you need to calculate larger factorials on an 8086 processor,
; additional algorithms or techniques would be required to overcome the limitations
; of the 16-bit registers.
include 'emu8086.inc'
org 100h

PRINT 'Number: '
call SCAN_NUM
PRINTN ''

mov al, 1

factorial:
    mul cx
    loop factorial

PRINT 'Result: '
call PRINT_NUM

ret

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
