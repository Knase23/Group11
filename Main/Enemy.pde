public class Enemy extends GameObject {


	public Enemy (){
		sprite = loadImage("/images/enemyOne.gif");
	}

	public void move() {
		
	}

	public void update() {
		
	}
	
	public void draw() {
		image(sprite, 0, 0);
	}

}