public class Nemesis extends Enemy
{
int noMoveTimer = 0;

public void nemesisTimer (Player player) 
   {
   	
		if (player.directionVelocity.x == 0 && player.directionVelocity.y == 0)
		{
		noMoveTimer = noMoveTimer+ time/ 1000 ;
		}
		
		else if  (player.directionVelocity.x > 0 || player.directionVelocity.y > 0) 
		{
			noMoveTimer= 0;
		}
  		
  	
    }
}


