// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Clear RAM[2]
@2
M = 0

@1
D = M
@16
D; JLE

// Start main loop
// Load RAM[0] into D
@0
D = M

// Add RAM[0] to RAM[2]
@2
M = M + D

// RAM[1]--
@1
M = M - 1
D = M

@2
A; JMP

@12
A; JMP
