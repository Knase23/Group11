public class Bullet extends GameObject {

	public Bullet (PVector startpos, PVector direction) {
		super();
		position.x = startpos.x;
		position.y = startpos.y;

		directionVelocity = direction;
		directionVelocity.setMag(5);
	}

	public void move() {
		position.add(directionVelocity);

	}

	public void update() {
		move();
	}
	
	public void draw() {
		strokeWeight(5);
		stroke(#e25822);  // colour name  #e25822"flame" https://www.colorhexa.com/e25822
		point(position.x, position.y);
	}

}