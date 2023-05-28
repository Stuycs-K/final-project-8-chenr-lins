# Work Log

## GROUP MEMBER 1: Regina

### 5/22

Added basic layout for Body and Main file

### 5/23

Body: add two apply methods and a touch method if Body touches Dirt<br>
Main: tried pushing Body off when Dirt touches it; didn't work; Dirt stop moving completely

### 5/24

Dirt: add getwidth()
Body: add getsize()
Main: only bottom Body moved when Dirt touches it; tried to move stack down after one Body is removed, didn't work

### 5/25 

Main: stack falls correctly other than the very bottom one
Dirt and Body: comment out methods for testing purpose 

### 5/26

Added Gravity class, borrowed from lab

### 5/28

Body: moved gravity stuff into here and manipulate it to fit code, didn't work; added toptouch method to check if the bottom of a Body is touching a Dirt
Main: if bottom of a Body touches a Dirt, Body doesn't fall; it'll fall after the Dirt passes

## GROUP MEMBER 2: Stephanie

### 5/22

Added basic layout for Dirt+Main file, write keypress for Main

### 5/23

Dirt: add three different shapes for obstacles, display modified to randomly choose from the 3<br>
Main: add variables/temporary values for testing. draw displays all blocks

### 5/24
Dirt: change constructor/different Dirt calls so Dirt size will fit with Block size.
Main: add Dirt ArrayList for all newly called Dirt. work on making Blocks get pushed with every Dirt block

### 5/25
Dirt: comment out different Dirt constructors. make a simpler one to test Birdstack movement.
Body: change touch method so it applies to 0 not height
Main: remove Dirt ArrayList. add two temporary Dirt. attempt to fix bottom block's incorrect positioning
