public class Bullet extends GameObject {
	color c;
	float millisekundsPast;
	float startAnimate = 0;
	boolean explosionExploding = false;
	public Bullet (PVector startpos, PVector direction, boolean playerShot) {
		super();
		sprite = assets[1];
		position.x = startpos.x;
		position.y = startpos.y;

		directionVelocity.x = direction.x;
		directionVelocity.y = direction.y;
		directionVelocity.setMag(7);
		
		hitBox= 5;
		if(playerShot)
		{
			c = color(#e25822);
			soundEffects[2].trigger();
		}
		else {
			c = color(#ff0000);
			soundEffects[3].trigger();
			
		}
	}

	public void move() {
		position.add(directionVelocity);
	}

	public void update() {
		if(despawn || outOfBounds)
		{

		} else{
			move();
			if(position.x > width  || position.x < 0 || position.y > height ||position.y < 0)
			{
				despawn = true;
				outOfBounds = true;
			}
		}

		
	}
	
	public void draw() {
		if(!despawn){
			strokeWeight(hitBox);
			stroke(c);  // colour name  #e25822"flame" https://www.colorhexa.com/e25822
			point(position.x, position.y);
		} else if(!outOfBounds && millisekundsPast < 500) {
			
			imageMode(CENTER);
			tint(255,255 - millisekundsPast);
			image(sprite, position.x, position.y);
			tint(255,255);

			if(startAnimate == 0)
			{
				startAnimate = time;
			}
			millisekundsPast = time - startAnimate;
			if(!explosionExploding)
			{
				soundEffects[0].trigger();
				explosionExploding = true;
			}
		}
	}

}