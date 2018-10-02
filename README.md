# Group11
Group11 Project Space Shooter


### Gameplay
Goal of the game is to survive as long as possible and get the highest score.

### Features
+ Mouse aim
+ Fullscreen movement


### Kontrolls
Keyboard
+ W - Forward
+ S - Backward
+ A - Left
+ D - Right

Mouse
+ Right click - Shot
+ Left click - Power Bomb
+ Mouse position - where the shot is directed.

### Fiender
Ett skepp som följer ett mönster Fiender spawnar in random inom spelplanen. Mönstret beror på vad för typ av fienden är.
 Fiender skjuter från ett håll.

### Future plans
Extra stuff we might add:
+ Powerups
+ Boss
+ Multiple Weapons
+ Life bar
+ Possible store/ upgrading ship

## File and class description

##### -Gamestate-
  + Start Menu
  + Game over screen
   - When player gets hit by a EnemyBullet
  + Press enter to start - Spawns in Enemies
  + Running game

##### -Collision-
  + Ship Collision
  + Checks all collision between Player/Enemy and Bullets

##### -Input-
  + Handles all Input

##### -GameObject-
  + hitbox (enemy, player) - determines size of Enemy and Player
  + vector (direction, velocity, position)
  + Boolean (dead) (out of bounds)

###### -Enemy-
  + Different types of Enemy - Example: Different movement pattern, bigger bullets etc.
   - Boss Enemy

###### -Bullet-
  + Travel one direction ( cannot change)
  + Size
  + Despawn out of bounds
  + Player colour \= Enemy colour

###### -Player-
  + Size/Sprite


## Journal

###### Monday
We first came up with ideas on what we could do and what we should consider as part of the assignment and what we should do if later if we have time (extra assignment)(check File and class description).
we made sure that the sharing of github was done correctly and made a conflict so we would all be able to see what happened and fix it.
Sprites for player and enemy was made and added into the game. The playership followed the mouse, could shoot.

Hard parts:  Making the player model following the mouse and making the sprite image rotate towards it.  

###### Tuesday
Everyone was very early and no one was late at all.
The first parts of the game were actually made playable. Player can shoot, enemies move and can be shot. Death explosion was implemented. background was made. Journal was started. 

Bugs: when trying to make the explosion fade out, when an enemy was hit by a bullet all ships became invisible.
In backround, we wanted the nebulas to rotate. But at first the rotated once in a while and around the wrong point, which looked pretty goofy.

Hard parts: The player was shooting once every frame, which meant 60 shots in a line.
