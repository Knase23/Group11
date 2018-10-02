public class Bullet extends GameObject {

	public Bullet (PVector startpos, PVector direction) {
		super();
	position= startpos; 
	directionVelocity= direction;
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
		point(position.x, position.y);
		stroke(#e25822);  // colour name  #e25822"flame" https://www.colorhexa.com/e25822
	}

}