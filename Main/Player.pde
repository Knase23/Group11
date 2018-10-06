public class Player extends GameObject{
	boolean wantToShot = false;
	float millisekundsPast = 0;
	float timeAfterShot = 0; 
	float cooldownGuns = 200;
	float mouseAngle = 0;
	color c;
	float shieldAlpha = 255;
	boolean shieldHasBeenRepaired = false;
	public Player () {
		super(height/2,width/2,50);
		sprite = assets[0];
		speed = 0;
		
	}

	public void update() {
		
		mouseAngle = atan2(this.position.y - mouseY,this.position.x - mouseX);
		move();
		if(position.x > width)
			position.x -= width;
		if(position.x < 0)
			position.x += width;
		if(position.y > height)
			position.y -= height;
		if(position.y < 0)
			position.y += height;
	}
	
	public void draw() {
		pushMatrix();
		translate(this.position.x, this.position.y);
		rotate(mouseAngle - HALF_PI);
		
		imageMode(CENTER);
		image(sprite, 0, 0);
		
		strokeWeight(2);
		stroke(c);
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
		direction.normalize();
		if(speed > 160)
			speed = 160;
		speed *= 0.95f;
		wantToShot = isLeftmouseclicked;

		super.move();

	}
	public boolean canShot()
	{
		millisekundsPast = millis() - timeAfterShot;
		if(millisekundsPast > cooldownGuns || timeAfterShot < 1)
		{
			timeAfterShot = millis();
			return true;
		} else{
			return false;
		}
	}
	public void up(){
		speed += 1000 *deltaTime;
		direction.y += -1;
	}
	public void down(){
		speed += 1000 *deltaTime;
		direction.y += 1 ;
	}
	public void left(){
		speed += 1000 *deltaTime;
		direction.x += -1;
	}
	public void right(){
		speed += 1000 *deltaTime;
		direction.x += 1;
	}
	public void updateShield(Shield shield)
	{
		c = color(shield.redValue,shield.greenValue , 0, shieldAlpha);
		if(shield.shieldValue < 10)
			shieldAlpha = 0 ;
			shieldHasBeenRepaired = true;
			
		if (shieldHasBeenRepaired && shield.shieldValue>0) {
			shieldHasBeenRepaired=false;
			shieldAlpha = 255;
		}

	}
	
}