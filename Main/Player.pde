public class Player extends GameObject{
	boolean wantToShot = false;
	public Player () {
		super(height/2,width/2,50);
		sprite = loadImage("/images/player.png");
		speed = 10;
		
	}

	public void update() {
		move();
	}
	
	public void draw() {
		

		float angle = atan2(this.position.y - mouseY,this.position.x - mouseX);				
		
		pushMatrix();
		translate(this.position.x, this.position.y);
		rotate(angle - HALF_PI);
		
		imageMode(CENTER);
		image(sprite, 0, 0);
		
		stroke(0, 255, 0);
		noFill();
		ellipse(0, 0, this.hitBox, this.hitBox);

		popMatrix();
	}

	public void move() {
		
		if(isWpressed)
			up();
		if(isSpressed)
			down();
		if(isApressed)
			left();
		if(isDpressed)
			right();
		
		wantToShot = isLeftmouseclicked; // might need changing

		directionVelocity.mult(0.95f);
		position.add(directionVelocity);

	}
	public void up(){
		directionVelocity.y += -speed * deltaTime;
	}
	public void down(){
		directionVelocity.y += speed * deltaTime;
	}
	public void left(){
		directionVelocity.x += -speed * deltaTime;
	}
	public void right(){
		directionVelocity.x += speed * deltaTime;
	}
}