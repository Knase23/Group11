public class Bullet extends GameObject {
	color c;
	public Bullet (PVector startpos, PVector direction, boolean playerShot) {
		super();
		position.x = startpos.x;
		position.y = startpos.y;

		directionVelocity = direction;
		directionVelocity.setMag(5);
		hitBox= 5;
		if(playerShot)
		{
			c = color(#e25822);
		}
		else {
			c = color(#ff0000);
			
		}
	}

	public void move() {
		position.add(directionVelocity);
	}

	public void update() {
		move();
		if(position.x > width || position.x < 0 || position.y > height ||position.y < 0)
		{
			despawn = true;
			directionVelocity = new PVector();
		}
	}
	
	public void draw() {
		if(!despawn){
			strokeWeight(hitBox);
			stroke(c);  // colour name  #e25822"flame" https://www.colorhexa.com/e25822
			point(position.x, position.y);
		}
	}

}