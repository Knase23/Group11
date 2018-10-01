public class Enemy extends GameObject {


	public Enemy (){
		sprite = loadImage("/images/enemyOne.gif");
	}

	public void move() {
		
	}

	public void update() {
		
	}
	
	public void draw() {
		
		pushMatrix();
		translate(this.position.x, this.position.y);
		rotate(HALF_PI);
		
		imageMode(CENTER);
		image(sprite, 0, 0);
		
		stroke(0, 0, 255);
		noFill();
		ellipse(0, 0, this.hitBox, this.hitBox);

		popMatrix();
	}

}