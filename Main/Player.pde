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
		
		pushMatrix();
		translate(this.position.x, this.position.y);
		rotate(0);
		
		imageMode(CENTER);
		image(sprite, 0, 0);
		
		stroke(0, 255, 0);
		noFill();
		ellipse(0, 0, this.hitBox, this.hitBox);

		popMatrix();
	}

}