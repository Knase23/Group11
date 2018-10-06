public class Enemy extends GameObject {
	float startTimeAfterShot = 0;
	float millisekundsPast = 0;
	float cooldownGuns = 2000;
	public Enemy (){
		super(random(0,10),random(10, height - 10), 50);
		sprite = assets[2];

		direction.x = 1;
		speed = random(40, 45);
	}

	public void update() {
		if(!despawn)
		{
			move();
			if(position.x > width)
				position.x -= width;
			
		} 
	}
	public boolean canShot()
	{
		if(despawn)
		{
			return false;
		}

		millisekundsPast = time - startTimeAfterShot;
		if(millisekundsPast > cooldownGuns)
		{
			startTimeAfterShot = time;
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
			rotate(this.direction.heading() + HALF_PI);
		
			imageMode(CENTER);
			image(sprite, 0, 0);
			
			strokeWeight(2);
			stroke(0, 0, 255);
			noFill();
			//ellipse(0, 0, this.hitBox, this.hitBox);

			popMatrix();
		}
	}
	public void newEnemy() {
		this.useExistingToCreateANew(random(0,10),random(10, height - 10), 50);
		direction.x = 1;
		speed = random(70, 90);
		millisekundsPast = 0;
		startTimeAfterShot = 0;
	}

}