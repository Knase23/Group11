public class Nemesis extends Enemy
{
	public Nemesis () 
	{
		sprite = assets[6];  // nemesis image
		speed = 70;
	}

	public void nemesisPlayerLocationUpdate (Player player) 
   	{
		direction.y =  player.position.y - position.y; 		
		direction.x =  player.position.x - position.x; // follows player
  		direction.normalize();

    }
}
