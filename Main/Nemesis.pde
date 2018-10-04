public class Nemesis extends Enemy
{
int noMoveTimer = 0;

public Nemesis () 
{
sprite = assets[6];  // nemesis image
directionVelocity.y = player.position.y; 		
directionVelocity.x = player.position.x; // follows player

}

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
    public void move () {
    	
		directionVelocity.setMag(5);
		super.move();
    }



}
