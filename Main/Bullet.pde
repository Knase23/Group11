public class Bullet extends GameObject {

	public Bullet (PVector startpos, PVector direction) {
		super();
		position.x = startpos.x;
		position.y = startpos.y;

		directionVelocity = direction;
		directionVelocity.setMag(5);
		hitBox= 5;
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
		strokeWeight(hitBox);
		stroke(#e25822);  // colour name  #e25822"flame" https://www.colorhexa.com/e25822
		point(position.x, position.y);
	}

}