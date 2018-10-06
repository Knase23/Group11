public class Nemesis extends Enemy
{
	public Nemesis () 
	{
		sprite = assets[6];  // nemesis image
		
	}

	public void nemesisPlayerLocationUpdate (Player player) 
   	{
		directionVelocity.y =  player.position.y - position.y; 		
		directionVelocity.x =  player.position.x - position.x; // follows player
  		
    }
    public void move () {
    	
		directionVelocity.setMag(2);
		super.move();
    }



}
