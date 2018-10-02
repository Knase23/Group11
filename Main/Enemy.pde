public class Enemy extends GameObject {
	float startTimeAfterShot = 0;
	float millisekundsPast = 0;
	float cooldownGuns = 2000;
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
		if(position.x > width)
			position.x -= width;
		
		if(despawn)
		{
			directionVelocity.mult(0);
		}


	}
	public boolean canShot()
	{
		millisekundsPast = millis() - startTimeAfterShot;
		if(millisekundsPast > cooldownGuns)
		{
			startTimeAfterShot = millis();
			return true;
		} else{
			return false;
		}
	}
	public void draw() {
		if(!despawn)
		{
			pushMatrix();
			translate(this.position.x, this.position.y);
			rotate(HALF_PI);
		
			imageMode(CENTER);
			image(sprite, 0, 0);
			
			strokeWeight(2);
			stroke(0, 0, 255);
			noFill();
			ellipse(0, 0, this.hitBox, this.hitBox);

			popMatrix();
		}
	}

}