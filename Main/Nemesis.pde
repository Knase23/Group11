public class Nemesis extends Enemy
{
	public Nemesis () 
	{
		sprite = assets[6];  // nemesis image
		speed = 70;
	}

	public void nemesisPlayerLocationUpdate (Player player) 
   	{
		directionVelocity.y =  player.position.y - position.y; 		
		directionVelocity.x =  player.position.x - position.x; // follows player
  		directionVelocity.setMag(speed);
    }
    public void move () {
    	
		directionVelocity.mult(deltaTime);
		super.move();
    }



}
