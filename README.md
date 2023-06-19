# About Emu8086

Emu8086 is a microprocessor emulator and assembler software that allows users to write, test, and run assembly language programs for the Intel 8086 microprocessor on a computer. It provides a simulated environment for programming and testing 8086-based applications without the need for physical hardware.

# What is emu8086.inc

The emu8086.inc file is a header file that contains macros definitions used by the Emu8086 assembler. It is included in assembly language programs written for the Emu8086 emulator to provide access to the emulator's functionality and to simplify programming. The file includes definitions for printing and gathering strings and numbers as input/output.

# FASM compatibility

Emu8086 uses its own assembler which is not FASM syntax-compatible because the Emu8086 assembler is designed to work specifically with the Emu8086 emulator. The syntax and structure of the Emu8086 assembler are tailored to the features and functionality of the emulator, which may differ from those of other assemblers like FASM. Even though you can add the `#fasm#` directive to make Emu8086 use FASM, `emu8086.inc` is not FASM-compatible. Therefore, I modified the code written in `emu8086.inc` to work with the FASM syntax.

# Usage

## Building

Just import it in your code using the `include` directive:

    include 'emu8086.inc'

Then build it with `fasm`:

    fasm example.asm example.com

## Running

You may use [DOSBox](http://dosbox.sourceforge.net/) to run your 8086 programs.

## Examples

Under the [`examples/`](examples/) directory you will find example programs tested in DOSBox.