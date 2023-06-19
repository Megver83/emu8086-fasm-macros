include 'emu8086.inc'
org 100h

PRINT 'Base: '
call SCAN_NUM
PRINTN ''
mov bx,cx

PRINT 'Power: '
call SCAN_NUM
PRINTN ''

mov AL,1

exp:
    mul bx
    loop exp

PRINT 'Result: '
call PRINT_NUM

ret

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
