// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INIT) 
  @SCREEN
  D = A
  @POS // current screen position (address)
  M = D 
  @24575
  D = A
  @MAX // max screen position (address)
  M = D
  @COLOR // current color to fill with
  M = 0 
  @BLACK
  M = -1
  @WHITE
  M = 0

(LISTEN)
  @KBD
  D = M
  @FILL
  D; JGT // pressed
  @CLEAR
  D; JEQ // not pressed
  @LISTEN
  0; JMP

(FILL)
  @BLACK
  D = M
  @COLOR
  M = D
  @RENDER
  0; JMP

(CLEAR)
  @WHITE
  D = M
  @COLOR
  M = D
  @RENDER
  0; JMP

(RENDER)
  // render color at current position
  @COLOR
  D = M
  @POS
  A = M
  M = D

  // increment position
  @POS
  M = M + 1
  D = M

  // check if at end of screen
  @MAX
  D = D - M;

  // if at end of screen, go to init
  @INIT
  D; JGT

  // else, keep rendering
  @RENDER
  0; JMP

(END)
  @INIT
  0; JMP
