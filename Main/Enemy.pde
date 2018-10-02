public class Enemy extends GameObject {


	public Enemy (){
		super(random(0,10),random(10, height - 10), 50);
		sprite = loadImage("/images/enemyOne.png");

		directionVelocity.x = random(1.5, 4.5);
	}

	public void move() {
		position.add(directionVelocity);
	}

	public void update() {
		move();
		if(position.x > height)
			despawn = true;

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