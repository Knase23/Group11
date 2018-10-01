public class Player extends GameObject{

	public Player () {
		super(height/2,width/2,50);
		sprite = loadImage("/images/player.gif");
		
	}

	public void move() {
		
	}

	public void update() {
		
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

}