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
		imageMode(CENTER);
		image(sprite, this.position.x, this.position.y);
		
		stroke(0, 255, 0);
		noFill();
		ellipse(this.position.x, this.position.y, this.hitBox, this.hitBox);
	}

}