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
