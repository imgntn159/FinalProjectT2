# FinalProjectT2
APCS Term 2 Final Project
Current demo is up on the Master branch, use GameTime.pde under the GameTime folder and press play!

#To Do [Immediate]
- Add ~~monsters and~~ interactions
- Add ~~a menu, maybe~~ a pause menu

6-4-15
-------
- Branches merged

6-3-15
-------
- Added a menu with one button
- Added monsters that move

6-1-15
-------
- Bullet sprite added with rotation
- Changed range to use a range "counter" rather than coordiante limits
- Reformatted README.md

5-31-15
-------
- Player now rotates!

5-28-15
-------
- Cleaned up code
- Added bullet removal, can change properties later
- Added a temporary sprite

5-27-15
-------
- Added Mouse class for easier crosshair transforming
- Movement works on a "camera" system; the camera follows the player
	- The player is "static"; it stays in the center while obstacles move around it
- Added bullet creation when clicking mouse
 	- ~~Bug occurs where velocity is different based on how far away from player the mouse is clicked~~
 	- Bug fixed using vectors! Also added an attack speed constraint

5-26-15
-------
- Added move() function that moves the player accordingly to WASD keyboard inputs
- Movement is smooth, can also move diagonally

5-25-15
-------
- Added radius (r) to bullets
- Added more "concepts" for how collision between monsters are gonna work
- Added recticle
- Added HitCheck for-loop to draw()
- Added attack speed timer to Player class

5-24-15
-------
- Created a basic shape for the player
- Created a basic window for the game
- set a bulletDamage property for bullets

5-23-15
-------
- Added "camera" reference files 
- Added skeleton files for the player, monster, and bullets. Nothing has been tested and there are still some "skeleton" functions to write
