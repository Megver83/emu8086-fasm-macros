include 'emu8086.inc'
org 100h

PRINT 'Sequence numbers: '
call SCAN_NUM
PRINTN ''

; To print pair numbers, just replace 1 with 0
mov al, 1

sequence:
    call PRINT_NUM
    PRINT ' '
    add al,2
    loop sequence

ret

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
