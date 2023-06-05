# Work Log

## GROUP MEMBER 1: Regina

### 5/22

Added basic layout for Body and Main file

### 5/23

Body: add two apply methods and a touch method if Body touches Dirt<br>
Main: tried pushing Body off when Dirt touches it; didn't work; Dirt stop moving completely

### 5/24

Dirt: add getwidth()<br>
Body: add getsize()<br>
Main: only bottom Body moved when Dirt touches it; tried to move stack down after one Body is removed, didn't work

### 5/25

Main: stack falls correctly other than the very bottom one<br>
Dirt and Body: comment out methods for testing purpose

### 5/26

Added Gravity class, borrowed from lab

### 5/28

Body: moved gravity stuff into here and manipulate it to fit code, didn't work; added toptouch method to check if the bottom of a Body is touching a Dirt<br>
Main: if bottom of a Body touches a Dirt, Body doesn't fall; it'll fall after the Dirt passes

### 5/30

Main: Started adding a start screen before actual gameplay and still working on end screen; stops running if Bird head touches Dirt; fix problem of Body getting stuck in mid-air after keypress

### 5/31

Main: change so that head falls after Dirt passes; change shape of Bird and Body

### 6/1

Add modes for start, during, end game. Change shape of Body and Dirt; change so that last draw doesn't duplicate Body

### 6/4

working on restarting game with keypress after game ends; moved somethings in setup into a method so that it can be recalled ater restarting game

## GROUP MEMBER 2: Stephanie

### 5/22

Added basic layout for Dirt+Main file, write keypress for Main

### 5/23

Dirt: add three different shapes for obstacles, display modified to randomly choose from the 3<br>
Main: add variables/temporary values for testing. draw displays all blocks

### 5/24
Dirt: change constructor/different Dirt calls so Dirt size will fit with Block size.<br>
Main: add Dirt ArrayList for all newly called Dirt. work on making Blocks get pushed with every Dirt block

### 5/25
Dirt: comment out different Dirt constructors. make a simpler one to test Birdstack movement.<br>
Body: change touch method so it applies to 0 not height<br>
Main: remove Dirt ArrayList. add two temporary Dirt. attempt to fix bottom block's incorrect positioning

### 5/26
Body: modify parts of apply speed so no Blocks collapsing (falling into each other)
Main: add a ground. tried to make Body fall only if Dirt passed. had issues, pulled Regina's. fixed removed Blocks collapsing, instead will stack as main Body does.

### 5/30
Started on bird Head. Write constructor, display, changes in display after keypress.

### 5/31
Make bird face, add colors. Double size of display, Dirt, Bird, Block. Increase speeds, Fix problem where blocks did not fall even if nothing else under them. Add score, counts Dirts passed. cut down on both apply()s because most of that code ended up in toptouch/main.
